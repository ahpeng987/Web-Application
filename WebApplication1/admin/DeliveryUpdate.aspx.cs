using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class DeliveryUpdate : System.Web.UI.Page
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
                // Check if OrderID is provided in query string
                if (Request.QueryString["OrderID"] != null)
                {
                    string orderID = Request.QueryString["OrderID"];

                    // Fetch delivery details from database based on OrderID
                    // Populate your form fields (e.g., dropdown for delivery status) with fetched data
                    PopulateDeliveryDetails(orderID);
                }
            }
        }

        private void PopulateDeliveryDetails(string orderID)
        {
            string query = "SELECT * FROM Delivery WHERE OrderID = @OrderID";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@OrderID", orderID);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    // Populate form fields with delivery details
                    // Example: ddlDeliveryStatus.SelectedValue = reader["DeliveryStatus"].ToString();
                }

                reader.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["OrderID"] != null)
            {
                string orderID = Request.QueryString["OrderID"];
                string newStatus = ddlDeliveryStatus.SelectedValue; // Example: Get new status from dropdown

                // Update delivery status in the database
                string query = "UPDATE Delivery SET DeliveryStatus = @DeliveryStatus WHERE OrderID = @OrderID";

                using (SqlConnection connection = new SqlConnection(cs))
                {
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@DeliveryStatus", newStatus);
                    command.Parameters.AddWithValue("@OrderID", orderID);

                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Redirect back to Delivery.aspx after successful update
                        Response.Redirect("Delivery.aspx");
                    }
                    else
                    {
                        // Handle update failure (optional)
                        // Display error message or take appropriate action
                    }
                }
            }
        }

    }
}