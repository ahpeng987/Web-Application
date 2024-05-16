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
using System.Xml.Linq;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.pdf.draw;

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
            else
            {
                Response.Redirect("../admin/notAdmin.aspx");
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

                // Retrieve data for Customer Order History
                DataTable customerOrderHistoryData = GetCustomerOrderHistoryData();

                // Generate PDF report
                GeneratePDFReport(orderSummaryData, customerOrderHistoryData);
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while generating report: " + ex.Message);
            }
        }

        private void GeneratePDFReport(DataTable orderSummaryData, DataTable customerOrderHistoryData)
        {
            // Create a Document
            Document document = new Document();
            MemoryStream memoryStream = new MemoryStream();

            try
            {
                // Create a PDF writer that listens to the document and directs a PDF-stream to a file
                PdfWriter writer = PdfWriter.GetInstance(document, memoryStream);

                // Open the Document for writing
                document.Open();

                // Add Order Summary report
                AddOrderSummaryReport(document, orderSummaryData);

                // Add Customer Order History report
                AddCustomerOrderHistoryReport(document, customerOrderHistoryData);
            }
            catch (Exception ex)
            {
                // Handle exception
                throw ex;
            }
            finally
            {
                // Close the Document
                document.Close();
            }

            // Output PDF content
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", "attachment; filename=OrderReport.pdf");
            Response.BinaryWrite(memoryStream.ToArray());
            Response.End();
        }

        private void AddOrderSummaryReport(Document document, DataTable orderSummaryData)
        {
            // Add a title
            Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18f, BaseColor.BLACK);
            Paragraph title = new Paragraph("Order Summary Report", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            document.Add(title);

            // Add a separator manually
            Chunk linebreak = new Chunk(new LineSeparator(0.5f, 100, BaseColor.BLACK, Element.ALIGN_CENTER, 1));
            document.Add(linebreak);

            // Add a subtitle
            Font subtitleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 14f, BaseColor.BLACK);
            Paragraph subtitle = new Paragraph("Summary", subtitleFont);
            document.Add(subtitle);

            document.Add(new Chunk("\n"));

            // Create PdfPTable for order summary data
            PdfPTable table = new PdfPTable(orderSummaryData.Columns.Count);
            table.WidthPercentage = 100; // Make the table fill the entire width of the page

            // Add column headers
            foreach (DataColumn column in orderSummaryData.Columns)
            {
                PdfPCell headerCell = new PdfPCell(new Phrase(column.ColumnName));
                headerCell.BackgroundColor = BaseColor.LIGHT_GRAY; // Add background color to header cells
                table.AddCell(headerCell);
            }

            // Add rows
            foreach (DataRow row in orderSummaryData.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    table.AddCell(item.ToString());
                }
            }

            // Add PdfPTable to the Document
            document.Add(table);

            // Add new line
            document.Add(new Chunk("\n"));
            document.Add(new Chunk("\n"));
            document.Add(new Chunk("\n"));
            document.Add(new Chunk("\n"));
            document.Add(new Chunk("\n"));
        }

        private void AddCustomerOrderHistoryReport(Document document, DataTable customerOrderHistoryData)
        {
            // Add a separator manually
            Chunk linebreak = new Chunk(new LineSeparator(0.5f, 100, BaseColor.BLACK, Element.ALIGN_CENTER, 1));
            document.Add(linebreak);



            // Add a subtitle
            Font subtitleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 14f, BaseColor.BLACK);
            Paragraph subtitle = new Paragraph("Customer Order History", subtitleFont);
            document.Add(subtitle);

            document.Add(new Chunk("\n"));

            // Create PdfPTable for customer order history data
            PdfPTable table = new PdfPTable(customerOrderHistoryData.Columns.Count);
            table.WidthPercentage = 100; // Make the table fill the entire width of the page

            // Add column headers
            foreach (DataColumn column in customerOrderHistoryData.Columns)
            {
                PdfPCell headerCell = new PdfPCell(new Phrase(column.ColumnName));
                headerCell.BackgroundColor = BaseColor.LIGHT_GRAY; // Add background color to header cells
                table.AddCell(headerCell);
            }

            // Add rows
            foreach (DataRow row in customerOrderHistoryData.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    table.AddCell(item.ToString());
                }
            }

            // Add PdfPTable to the Document
            document.Add(table);
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









    }
}
