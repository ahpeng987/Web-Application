using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class DeliveryAdd : System.Web.UI.Page
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

            BindOrders();
        }


        private void BindOrders()
        {
            // Retrieve and bind orders to ddlOrder dropdown list
            string query = "SELECT orderID FROM [dbo].[Order]";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();

                connection.Open();
                adapter.Fill(dt);

                ddlOrder.DataSource = dt;
                ddlOrder.DataTextField = "orderID";
                ddlOrder.DataValueField = "orderID";
                ddlOrder.DataBind();

                ddlOrder.Items.Insert(0, new ListItem("-- Select Order --", ""));
            }
        }

        protected void btnAddDelivery_Click(object sender, EventArgs e)
        {
            int orderID;
            if (!int.TryParse(ddlOrder.SelectedValue, out orderID) || orderID <= 0)
            {
                // Invalid or empty order selection
                return;
            }

            string deliveryAddress = txtDeliveryAddress.Text.Trim();
            string courier = ddlCourier.SelectedValue; // Retrieve selected courier

            if (string.IsNullOrWhiteSpace(deliveryAddress))
            {
                // Delivery address is required
                return;
            }

            // Set default values
            string deliveryStatus = "Pending";
            DateTime deliveryDate = DateTime.Now;

            // Insert delivery record into database
            bool success = InsertDelivery(orderID, deliveryAddress, courier, deliveryStatus, deliveryDate);

            if (success)
            {
                // Redirect to delivery list page upon successful insertion
                Response.Redirect("~/admin/Delivery.aspx");
            }
            else
            {
                // Display error message or handle failure
                // For example:
                // lblMessage.Text = "Failed to add new delivery.";
            }
        }

        private bool InsertDelivery(int orderID, string deliveryAddress, string courier,
            string deliveryStatus, DateTime deliveryDate)
        {
            string query = "INSERT INTO [dbo].[Delivery] (orderID, deliveryAddress, courierType, deliveryStatus, deliveryDate) " +
                           "VALUES (@orderID, @deliveryAddress, @courierType, @deliveryStatus, @deliveryDate)";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@orderID", orderID);
                command.Parameters.AddWithValue("@deliveryAddress", deliveryAddress);
                command.Parameters.AddWithValue("@courierType", courier);
                command.Parameters.AddWithValue("@deliveryStatus", deliveryStatus);
                command.Parameters.AddWithValue("@deliveryDate", deliveryDate);

                try
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    return rowsAffected > 0;
                }
                catch (Exception ex)
                {
                    // Handle database insertion error
                    // For example:
                    // Console.WriteLine("Database error: " + ex.Message);
                    return false;
                }
            }
        }
    }
    }

