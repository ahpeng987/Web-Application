using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class PaymentConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnConfirmPayment.CausesValidation = true;
            }
        }
        protected void btnConfirmPayment_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                // Establish connection
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Open the connection
                    con.Open();

                    // Query to retrieve the latest payment made
                    string query = @"
                SELECT TOP 1 P.prodName, PM.userID, PM.paymentID
                FROM OrderItem OI
                INNER JOIN [Order] O ON OI.orderID = O.orderID
                INNER JOIN Payment PM ON O.paymentID = PM.paymentID
                INNER JOIN Product P ON OI.prodID = P.prodID
                ORDER BY O.orderDate DESC";

                    // Create a command
                    SqlCommand cmd = new SqlCommand(query, con);

                    // Execute the query
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve values from the reader
                        string productName = reader["prodName"].ToString();
                        string userID = reader["userID"].ToString();
                        string paymentID = reader["paymentID"].ToString();

                        // Store the values in session
                        Session["productName"] = productName;
                        Session["userID"] = userID;
                        Session["paymentID"] = paymentID;

                        // Redirect the user to the feedback page with parameters
                        Response.Redirect("feedback.aspx");
                        Response.End();
                    }
                    else
                    {
                        // No payment found
                        // Handle accordingly
                    }

                    // Close the reader
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // Log the exception, display an error message, etc.
            }
        }


    }
}