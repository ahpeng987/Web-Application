using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class AddOrder1 : System.Web.UI.Page
    {

        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PopulateProductsDropDown();
                PopulateUsersDropDown();
            }

        }

        protected void PopulateProductsDropDown()
        {
            DataTable productsTable = GetProductsFromDatabase();
            ddlProducts.DataSource = productsTable;
            ddlProducts.DataTextField = "ProdName";
            ddlProducts.DataValueField = "ProdID";
            ddlProducts.DataBind();
        }

        protected DataTable GetProductsFromDatabase()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ProdID, ProdName, prodPrice FROM Product", con))
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            return dt;
        }

        protected void PopulateUsersDropDown()
        {
            DataTable usersTable = GetUsersFromDatabase();
            ddlUsers.DataSource = usersTable;
            ddlUsers.DataTextField = "UserName"; // Change to the actual user name field
            ddlUsers.DataValueField = "UserID"; // Change to the actual user ID field
            ddlUsers.DataBind();
        }

        protected DataTable GetUsersFromDatabase()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT userID, userName FROM [User]", con))
                {
                    con.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            return dt;
        }

        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblUnitPrice.Text = ""; // Clear unit price
            lblTotalAmt.Text = ""; // Clear total amount
        }

        protected decimal GetUnitPrice(int productId)
        {
            decimal unitPrice = 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT prodPrice FROM Product WHERE ProdID = @ProductID", con))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        unitPrice = Convert.ToDecimal(result);
                    }
                }
            }
            return unitPrice;
        }

        protected void btnAddOrder_Click(object sender, EventArgs e)
        {
            if (IsValidOrderInput())
            {
                int productId = Convert.ToInt32(ddlProducts.SelectedValue);
                string productName = ddlProducts.SelectedItem.Text;
                int orderQty = Convert.ToInt32(txtOrderQty.Text);

                // Get unit price from dropdown selection
                decimal unitPrice = GetUnitPrice(productId);

                // Calculate total amount
                decimal totalAmount = orderQty * unitPrice;

                // Get selected user
                int userId = Convert.ToInt32(ddlUsers.SelectedValue);

                // Get payment method
                string paymentMethod = txtPaymentMethod.Text;

                // Create payment record
                int paymentId = CreatePayment(userId, totalAmount, paymentMethod);

                if (paymentId > 0)
                {
                    // Save order and link to payment
                    int orderId = SaveOrderToDatabase(paymentId, totalAmount);

                    if (orderId > 0)
                    {
                        // Save order item
                        SaveOrderItemToDatabase(orderId, productId, orderQty, unitPrice);

                        // Redirect to another page or display a success message
                        Response.Redirect("OrderAdmin.aspx");
                    }
                    else
                    {
                        // Handle order save failure
                    }
                }
                else
                {
                    // Handle payment creation failure
                }
            }
        }

        protected int CreatePayment(int userId, decimal amount, string paymentMethod)
        {
            int paymentId = 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Payment (userID, amount, paymentMethod, paymentDate) VALUES (@UserID, @Amount, @PaymentMethod, @PaymentDate); SELECT SCOPE_IDENTITY();", con))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    cmd.Parameters.AddWithValue("@Amount", amount);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                    cmd.Parameters.AddWithValue("@PaymentDate", DateTime.Now);
                    con.Open();
                    paymentId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return paymentId;
        }


        protected int SaveOrderToDatabase(int paymentId, decimal totalAmount)
        {
            int orderId = 0;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO [Order] (orderDate, totalAmt, paymentID) VALUES (@OrderDate, @TotalAmount, @PaymentID); SELECT SCOPE_IDENTITY();", con))
                {
                    cmd.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@TotalAmount", totalAmount);
                    cmd.Parameters.AddWithValue("@PaymentID", paymentId);
                    con.Open();
                    orderId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }
            return orderId;
        }

        protected void SaveOrderItemToDatabase(int orderId, int productId, int orderQty, decimal unitPrice)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO OrderItem (orderID, prodID, orderQty, unitPrice) VALUES (@OrderID, @ProductID, @OrderQty, @UnitPrice)", con))
                {
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    cmd.Parameters.AddWithValue("@OrderQty", orderQty);
                    cmd.Parameters.AddWithValue("@UnitPrice", unitPrice);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (IsValidOrderInput())
            {
                int productId = Convert.ToInt32(ddlProducts.SelectedValue);
                int orderQty = Convert.ToInt32(txtOrderQty.Text);

                // Get unit price from dropdown selection
                decimal unitPrice = GetUnitPrice(productId);

                // Calculate total amount
                decimal totalAmount = orderQty * unitPrice;

                // Display unit price and total amount
                lblUnitPrice.Text = unitPrice.ToString("C"); // Display unit price in currency format
                lblTotalAmt.Text = totalAmount.ToString("C"); // Display total amount in currency format
            }
        }

        protected bool IsValidOrderInput()
        {
            // Validate input fields (e.g., order quantity should be numeric)
            int orderQty;
            if (!int.TryParse(txtOrderQty.Text, out orderQty))
            {
                // Display error message or handle invalid input
                return false;
            }
            return true;
        }


    }
}