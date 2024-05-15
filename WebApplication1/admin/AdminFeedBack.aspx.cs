using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class AdminFeedBack : System.Web.UI.Page
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
                BindFeedbackData();
            }
        }

        private void BindFeedbackData()
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {

                string query = @"SELECT r.ratingID, r.userID, u.userName, p.prodName, r.feedBack, r.ratingValue 
                    FROM Rating r
                    INNER JOIN Product p ON r.prodID = p.prodID
                    INNER JOIN [User] u ON r.userID = u.userID";
                SqlCommand cmd = new SqlCommand(query, con);


                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                //DATA BIND 
                Repeater1.DataSource = reader;
                Repeater1.DataBind();

                reader.Close();
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string ratingID = btnDelete.Attributes["data-promo-id"];

            // Check if promoID is not null and is not empty
            if (!string.IsNullOrEmpty(ratingID))
            {
                int id = Convert.ToInt32(ratingID);

                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string sql = "DELETE FROM Rating WHERE ratingID = @ratingID";

                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@ratingID", id);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record Deleted Successfully.'); window.location ='AdminFeedBack.aspx';", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record not found.'); window.location ='AdminFeedBack.aspx';", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("An error occurred: " + ex.Message);
                    }
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Rating ID not found.'); window.location ='AdminFeedBack.aspx';", true);
            }

        }
    }
}
