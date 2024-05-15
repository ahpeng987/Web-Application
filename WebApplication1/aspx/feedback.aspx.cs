using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.admin;

namespace WebApplication1.aspx
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get product and payment details
                GetProductAndPaymentDetails();
            }
        }

        private void GetProductAndPaymentDetails()
        {
            // Retrieve product and payment details based on userID and paymentID
            string productName = Session["ProductName"].ToString();
            string userID = Session["UserID"].ToString();
            string paymentID = Session["PaymentID"].ToString();



            txtProductName.Text = productName;
            txtPaymentID.Text = paymentID;
            txtUserID.Text = userID;
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            // Get feedback details
            string userID = Session["UserID"].ToString();
            string paymentID = Session["PaymentID"].ToString();
            string productName = Session["productName"].ToString();
            int ratingValue = Convert.ToInt32(ratingDropDown.SelectedValue);
            string feedback = message1.Text;

            int prodID = GetProductID(productName);
            // Insert feedback into database
            if (InsertFeedback(userID, paymentID, ratingValue, feedback, prodID))
            {
                // Show confirmation message
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Feedback submitted successfully'); window.location='viewFeedback.aspx'", true);
            }
            else
            {
                // Show error message if insertion fails
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Error submitting feedback. Please try again.'); window.location='feedback.aspx'", true);
            }
        }

        private int GetProductID(string productName)
        {
            int prodID = 0;

            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT prodID FROM Product WHERE prodName = @productName";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@productName", productName);

                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        prodID = Convert.ToInt32(result);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error getting product ID: " + ex.Message);
            }

            return prodID;
        }

        private bool InsertFeedback(string userID, string paymentID, int ratingValue, string feedback, int prodID)
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO Rating (userID, paymentID, ratingValue, feedBack, prodID) 
                             VALUES (@userID, @paymentID, @ratingValue, @feedBack, @prodID)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters
                        cmd.Parameters.AddWithValue("@userID", userID);
                        cmd.Parameters.AddWithValue("@paymentID", paymentID);
                        cmd.Parameters.AddWithValue("@ratingValue", ratingValue);
                        cmd.Parameters.AddWithValue("@feedBack", feedback);
                        cmd.Parameters.AddWithValue("@prodID", prodID);

                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        // Check if insertion was successful
                        return rowsAffected > 0;




                    }
                }

            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error inserting feedback: " + ex.Message);
                return false;
            }
        }
    }
}