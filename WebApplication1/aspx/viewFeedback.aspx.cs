using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.admin;

namespace WebApplication1.aspx
{
    public partial class viewFeedback : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts(); // Load the products dropdown list
                LoadFeedback(); // Load all feedback initially
            }
        }

        protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadFeedback(); // Load feedback based on the selected product
        }


        private void BindProducts()
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
                string query = "SELECT prodID, prodName FROM Product";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    ddlProducts.DataSource = reader;
                    ddlProducts.DataTextField = "prodName";
                    ddlProducts.DataValueField = "prodID";
                    ddlProducts.DataBind();
                    ddlProducts.Items.Insert(0, new ListItem("All Products", "0")); // Add an option to show all products
                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error loading products: " + ex.Message);
            }
        }
        private void LoadFeedback()
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string selectedProductID = ddlProducts.SelectedValue;
                    string query = @"SELECT r.ratingID, p.prodName, r.ratingValue, r.feedBack, r.paymentID, r.userID, u.userName
                    FROM Rating r
                    INNER JOIN Product p ON r.prodID = p.prodID
                    INNER JOIN [User] u ON r.userID = u.userID";

                    if (selectedProductID != "0") // Filter feedback by selected product if not "All Products"
                    {
                        query += " WHERE r.prodID = @prodID";
                    }

                    SqlCommand cmd = new SqlCommand(query, con);
                    if (selectedProductID != "0")
                    {
                        cmd.Parameters.AddWithValue("@prodID", selectedProductID);
                    }

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

    }
}