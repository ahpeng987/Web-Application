using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class SpecificFeedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string prodID = Request.QueryString["prodID"];

                if (!string.IsNullOrEmpty(prodID))
                {
                    // Assuming you have a method to retrieve feedback based on prodID
                    List<Feedback> feedbackList = Passing.GetFeedbackByProduct(prodID);

                    // Bind feedbackList to your UI
                    Repeater1.DataSource = feedbackList;
                    Repeater1.DataBind();
                }
                else
                {
                    // Handle case where prodID is not provided
                    Response.Write("Product ID is missing.");
                }


                LoadFeedback();
            }
        }





        private void LoadFeedback()
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string selectedProductName = Request.QueryString["prodName"]; // Get the product name from query string
                    string query = @"SELECT r.ratingID, p.prodName, r.ratingValue, r.feedBack, r.paymentID, r.userID, u.userName
                         FROM Rating r
                         INNER JOIN Product p ON r.prodID = p.prodID
                         INNER JOIN [User] u ON r.userID = u.userID
                         WHERE p.prodName = @prodName"; // Filter by product name

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@prodName", selectedProductName); // Add parameter for product name

                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    Repeater1.DataSource = reader;
                    Repeater1.DataBind();
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error loading feedback: " + ex.Message);
            }
        }

        public static class Passing
        {
            public static List<Feedback> GetFeedbackByProduct(string prodID)
            {
                List<Feedback> feedbackList = new List<Feedback>();

                try
                {
                    string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        string query = @"SELECT r.ratingID, p.prodName, r.ratingValue, r.feedBack, r.paymentID, r.userID, u.userName
                         FROM Rating r
                         INNER JOIN Product p ON r.prodID = p.prodID
                         INNER JOIN [User] u ON r.userID = u.userID
                         WHERE r.prodID = @prodID";

                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@prodID", prodID);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            Feedback feedback = new Feedback();
                            feedback.RatingID = Convert.ToInt32(reader["ratingID"]);
                            feedback.ProdName = reader["prodName"].ToString();
                            feedback.RatingValue = Convert.ToInt32(reader["ratingValue"]);
                            feedback.feedBack = reader["feedBack"].ToString();
                            feedback.PaymentID = Convert.ToInt32(reader["paymentID"]);
                            feedback.UserID = Convert.ToInt32(reader["userID"]);
                            feedback.UserName = reader["userName"].ToString();

                            feedbackList.Add(feedback);
                        }

                        reader.Close();
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception
                    Console.WriteLine("Error retrieving feedback: " + ex.Message);
                }

                return feedbackList;
            }
        }

        public class Feedback
        {
            public int RatingID { get; set; }
            public string ProdName { get; set; }
            public int RatingValue { get; set; }
            public string feedBack { get; set; }
            public int PaymentID { get; set; }
            public int UserID { get; set; }
            public string UserName { get; set; }
        }
    }
}