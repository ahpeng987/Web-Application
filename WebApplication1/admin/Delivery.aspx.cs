using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class Delivery : System.Web.UI.Page
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
                BindDeliveryData();
            }
        }

        private void BindDeliveryData()
        {
            string query = "SELECT * FROM Delivery";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                rptDeliveries.DataSource = dt;
                rptDeliveries.DataBind();
            }
        }

        protected void EditDelivery(object sender, EventArgs e)
        {
            // Get the OrderID of the delivery to be edited from the button's CommandArgument
            var orderID = ((Button)sender).CommandArgument;

            // Redirect to DeliveryUpdate.aspx with OrderID as query parameter
            Response.Redirect($"DeliveryUpdate.aspx?OrderID={orderID}");
        }

        protected void DeleteDelivery(object sender, EventArgs e)
        {
            // Get the OrderID of the delivery to be deleted from the button's CommandArgument
            var orderID = ((Button)sender).CommandArgument;

            // Construct the DELETE query to remove the delivery record
            string query = "DELETE FROM Delivery WHERE OrderID = @OrderID";

            // Establish connection and command objects
            using (SqlConnection connection = new SqlConnection(cs))
            {
                SqlCommand command = new SqlCommand(query, connection);

                // Add OrderID parameter to the command
                command.Parameters.AddWithValue("@OrderID", orderID);

                try
                {
                    // Open the connection and execute the delete command
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // If deletion is successful, rebind the delivery data
                        BindDeliveryData();
                    }
                    else
                    {
                        // Handle deletion failure (optional)
                        // You can display a message here if the delete operation fails
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log error, display error message)
                    // For demo, display error in an alert
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", $"alert('Error: {ex.Message}');", true);
                }
            }
        }

    }

}



