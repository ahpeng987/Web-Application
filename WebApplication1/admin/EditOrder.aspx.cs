using System;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication1.admin
{
    public partial class EditOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminName"] != null)
            {
                string adminname = Session["adminName"].ToString();
                lblWelcomeMessage.Text = adminname;
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["orderID"] != null)
                {
                    int orderID = Convert.ToInt32(Request.QueryString["orderID"]);
                    LoadOrderDetails(orderID);
                }
                else
                {
                    Response.Redirect("~/admin/OrderAdmin.aspx");
                }
            }
        }

        private void LoadOrderDetails(int orderID)
        {
            string cs = Global.CS;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "SELECT orderID, orderDate, totalAmt FROM [Order] WHERE orderID = @orderID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@orderID", orderID);
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hdnOrderID.Value = reader["orderID"].ToString(); // Store order ID in a hidden field for later use
                    txtOrderDate.Text = Convert.ToDateTime(reader["orderDate"]).ToString("yyyy-MM-dd"); // Display order date in a textbox
                    txtTotalAmount.Text = reader["totalAmt"].ToString(); // Display total amount in an editable textbox
                }
                else
                {
                    Response.Redirect("~/admin/OrderAdmin.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int orderID = Convert.ToInt32(hdnOrderID.Value);
            decimal totalAmount = Convert.ToDecimal(txtTotalAmount.Text);

            // Update order details in the database
            string cs = Global.CS;
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = "UPDATE [Order] SET totalAmt = @totalAmount WHERE orderID = @orderID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@totalAmount", totalAmount);
                cmd.Parameters.AddWithValue("@orderID", orderID);
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    // Update successful, redirect or display success message
                    Response.Redirect("~/admin/OrderAdmin.aspx"); // Redirect back to order list
                }
                else
                {
                    // Handle update failure (e.g., display error message)
                    // You can add error handling logic here
                }
            }
        }
    }
}
