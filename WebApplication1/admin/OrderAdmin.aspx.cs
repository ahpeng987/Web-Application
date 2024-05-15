using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class OrderAdmin : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminName"] != null)
            {
                string adminname = Session["adminName"].ToString();
                lblWelcomeMessage.Text = adminname;
            }

            if (!IsPostBack)
            {
                LoadOrders();

            }
        }

        private void LoadOrders()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT o.orderID, o.orderDate, o.totalAmt, o.paymentID
                                         FROM [Order] o 
                                         INNER JOIN [OrderItem] oi ON o.orderID = oi.orderID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    rptOrders.DataSource = dt;
                    rptOrders.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while retrieving orders: " + ex.Message);
            }
        }


        // Event handler for edit order button click
        protected void EditOrder(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string orderId = btn.CommandArgument;
            Response.Redirect($"EditOrder.aspx?orderId={orderId}");
        }

        // Event handler for delete order button click
        protected void DeleteOrder(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string orderId = btn.CommandArgument;


            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    // Begin a transaction
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Delete delivery record first
                        string deleteDeliveryQuery = "DELETE FROM Delivery WHERE OrderID = @OrderId";
                        SqlCommand deleteDeliveryCmd = new SqlCommand(deleteDeliveryQuery, con);
                        deleteDeliveryCmd.Parameters.AddWithValue("@OrderId", orderId);
                        deleteDeliveryCmd.Transaction = transaction;
                        deleteDeliveryCmd.ExecuteNonQuery();

                        // Delete related OrderItems first
                        string deleteOrderItemsQuery = "DELETE FROM OrderItem WHERE OrderID = @OrderId";
                        SqlCommand deleteOrderItemsCmd = new SqlCommand(deleteOrderItemsQuery, con);
                        deleteOrderItemsCmd.Parameters.AddWithValue("@OrderId", orderId);
                        deleteOrderItemsCmd.Transaction = transaction;
                        deleteOrderItemsCmd.ExecuteNonQuery();

                        // Then delete the Order
                        string deleteOrderQuery = "DELETE FROM [Order] WHERE OrderID = @OrderId";
                        SqlCommand deleteOrderCmd = new SqlCommand(deleteOrderQuery, con);
                        deleteOrderCmd.Parameters.AddWithValue("@OrderId", orderId);
                        deleteOrderCmd.Transaction = transaction;
                        deleteOrderCmd.ExecuteNonQuery();

                        // Commit the transaction if both deletions are successful
                        transaction.Commit();

                        // Refresh the order list
                        LoadOrders();
                    }
                    catch (Exception ex)
                    {
                        // Rollback the transaction if any deletion fails
                        transaction.Rollback();
                        throw new Exception("An error occurred while deleting the order: " + ex.Message);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while deleting the order: " + ex.Message);
            }
        }


        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                // Retrieve data for Order Summary
                DataTable orderSummaryData = GetOrderSummaryData();

                // Generate order summary report
                string orderSummaryReport = GenerateOrderSummaryReport(orderSummaryData);

                // Retrieve data for Customer Order History
                DataTable customerOrderHistoryData = GetCustomerOrderHistoryData();

                // Generate customer order history report
                string customerOrderHistoryReport = GenerateCustomerOrderHistoryReport(customerOrderHistoryData);

                // Combine both reports
                string combinedReport = orderSummaryReport + Environment.NewLine + customerOrderHistoryReport;

                // Output combined report
                Response.Clear();
                Response.ContentType = "text/plain";
                Response.AddHeader("Content-Disposition", "attachment; filename=CombinedOrderReport.txt");
                Response.Write(combinedReport);
                Response.End();
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while generating report: " + ex.Message);
            }
        }

        private DataTable GetOrderSummaryData()
        {
            DataTable data = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT orderID, orderDate, totalAmt, paymentID FROM [Order]";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Open();
                    da.Fill(data);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return data;
        }

        private DataTable GetCustomerOrderHistoryData()
        {
            DataTable data = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"
                        SELECT o.orderID, o.orderDate, o.totalAmt, p.userID, p.paymentMethod, u.userName AS customerName, u.userEmail AS customerEmail
                        FROM [Order] o
                        INNER JOIN [Payment] p ON o.paymentID = p.paymentID
                        INNER JOIN [User] u ON p.userID = u.userID
                        ORDER BY o.orderDate DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Open();
                    da.Fill(data);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return data;
        }

        private string GenerateOrderSummaryReport(DataTable data)
        {
            // Calculate summary statistics
            int totalOrders = data.Rows.Count;
            decimal totalSalesAmount = 0;
            Dictionary<int, int> paymentMethodCounts = new Dictionary<int, int>();

            foreach (DataRow row in data.Rows)
            {
                totalSalesAmount += Convert.ToDecimal(row["totalAmt"]);

                int paymentID = Convert.ToInt32(row["paymentID"]);
                if (paymentMethodCounts.ContainsKey(paymentID))
                {
                    paymentMethodCounts[paymentID]++;
                }
                else
                {
                    paymentMethodCounts.Add(paymentID, 1);
                }
            }

            // Prepare report content
            StringBuilder reportContent = new StringBuilder();
            reportContent.AppendLine("Order Summary Report");
            reportContent.AppendLine("---------------------");
            reportContent.AppendLine($"Total Orders: {totalOrders}");
            reportContent.AppendLine($"Total Sales Amount: ${totalSalesAmount}");
            reportContent.AppendLine("Payment Method Breakdown:");

            foreach (KeyValuePair<int, int> kvp in paymentMethodCounts)
            {
                // Retrieve payment method name from database or a lookup table
                string paymentMethodName = GetPaymentMethodName(kvp.Key);
                reportContent.AppendLine($"{paymentMethodName}: {kvp.Value} orders");
            }

            // Return report content as string
            return reportContent.ToString();
        }

        private string GetPaymentMethodName(int paymentID)
        {
            string paymentMethodName = "";

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT paymentMethod FROM Payment WHERE paymentID = @PaymentID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@PaymentID", paymentID);

                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        paymentMethodName = Convert.ToString(result);
                    }
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions appropriately (e.g., logging, displaying error message)
                paymentMethodName = "Payment Method " + paymentID; // If an error occurs, return a default value
            }

            return paymentMethodName;
        }

        private string GenerateCustomerOrderHistoryReport(DataTable customerOrderHistoryData)
        {
            StringBuilder reportContent = new StringBuilder();
            reportContent.AppendLine("Customer Order History Report");
            reportContent.AppendLine("--------------------------------");

            foreach (DataRow row in customerOrderHistoryData.Rows)
            {
                int orderID = Convert.ToInt32(row["orderID"]);
                DateTime orderDate = Convert.ToDateTime(row["orderDate"]);
                decimal totalAmt = Convert.ToDecimal(row["totalAmt"]);
                int userID = Convert.ToInt32(row["userID"]);
                string paymentMethod = row["paymentMethod"].ToString();

                // You can add more details from the order if needed

                // Append order details to the report content
                reportContent.AppendLine($"Order ID: {orderID}");
                reportContent.AppendLine($"Order Date: {orderDate}");
                reportContent.AppendLine($"Total Amount: ${totalAmt}");
                reportContent.AppendLine($"User ID: {userID}");
                reportContent.AppendLine($"Payment Method: {paymentMethod}");
                reportContent.AppendLine(); // Add a blank line for better readability
            }

            // Return the generated report content as a string
            return reportContent.ToString();
        }


        private void GenerateCSVReport(DataTable data)
        {
            // Generate a CSV file based on DataTable data
            StringWriter sw = new StringWriter();

            // Write column headers
            foreach (DataColumn column in data.Columns)
            {
                sw.Write(column.ColumnName + ",");
            }
            sw.WriteLine();

            // Write rows
            foreach (DataRow row in data.Rows)
            {
                for (int i = 0; i < data.Columns.Count; i++)
                {
                    sw.Write(row[i].ToString().Replace(",", string.Empty) + ",");
                }
                sw.WriteLine();
            }

            // Output CSV content
            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment; filename=OrderReport.csv");
            Response.Write(sw.ToString());
            Response.End();
        }




    }
}
