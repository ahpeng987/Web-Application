using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace WebApplication1.admin
{
    public partial class PromotionEdit : System.Web.UI.Page
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

            }
        }


        protected void btnCreate_Click(object sender, EventArgs e)
        {

            if (Page.IsValid && fupPromo1.HasFile)
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                // Ensure the file is an image
                if (fupPromo1.PostedFile.ContentType.ToLower().StartsWith("image/"))
                {
                    string path = MapPath("~/admin/img/"); // folder to store image
                    string filename1 = Guid.NewGuid().ToString("N") + Path.GetExtension(fupPromo1.FileName);
                    string filename2 = Guid.NewGuid().ToString("N") + Path.GetExtension(fupPromo2.FileName);
                    string filename3 = Guid.NewGuid().ToString("N") + Path.GetExtension(fupPromo3.FileName);

                    fupPromo1.SaveAs(Path.Combine(path, filename1));
                    fupPromo2.SaveAs(Path.Combine(path, filename2));
                    fupPromo3.SaveAs(Path.Combine(path, filename3));

                    string Description = txtDescription.Text;
                    string Discount = txtDiscount.Text;
                    DateTime Start = DateTime.Parse(txtStartDate.Text);
                    DateTime End = DateTime.Parse(txtEndDate.Text);
                    string Original = txtOriPrice.Text;
                    string color = txtpromoColor.Text;
                    string Name = txtProductName.Text;

                    int productID = GetProductIDByName(Name, connectionString);

                    if (productID != 0) // Product found
                    {
                        using (SqlConnection con = new SqlConnection(connectionString))
                        {
                            try
                            {
                                con.Open();
                                string sql = "INSERT INTO Promotion (promoDescript, oriPrice, disPrice, startDate, endDate, promoColor, prodID, promoImg, promoImg2, promoImg3) " +
                                             "VALUES (@promoDescript, @oriPrice, @disPrice, @startDate, @endDate, @promoColor, @prodID, @promoImg, @promoImg2, @promoImg3)";

                                SqlCommand cmd = new SqlCommand(sql, con);
                                cmd.Parameters.AddWithValue("@promoDescript", Description);
                                cmd.Parameters.AddWithValue("@oriPrice", Original);
                                cmd.Parameters.AddWithValue("@disPrice", Discount);
                                cmd.Parameters.AddWithValue("@startDate", Start);
                                cmd.Parameters.AddWithValue("@endDate", End);
                                cmd.Parameters.AddWithValue("@promoColor", color);
                                cmd.Parameters.AddWithValue("@prodID", productID);
                                cmd.Parameters.AddWithValue("@promoImg", filename1);
                                cmd.Parameters.AddWithValue("@promoImg2", filename2);
                                cmd.Parameters.AddWithValue("@promoImg3", filename3);

                                cmd.ExecuteNonQuery();

                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Promotion created successfully.'); window.location ='PromotionAdmin.aspx';", true);
                            }
                            catch (Exception ex)
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred while creating the promotion: " + ex.Message + "');", true);
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product with name \"" + Name + "\" not found.');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please upload a valid image file.');", true);
                }
            }
        }

        private int GetProductIDByName(string Name, string connectionString)
        {
            int prodID = 0;
            string query = "SELECT prodID FROM Product WHERE LOWER(prodName) = LOWER(@prodName)";
            // Using LOWER to make the comparison case-insensitive

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@prodName", Name);
                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    prodID = Convert.ToInt32(result);
                }
                else
                {

                    prodID = 0;
                }
            }
            return prodID;
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Clear the text of each TextBox control

            txtDescription.Text = "";
            txtDiscount.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtOriPrice.Text = "";
            txtProductName.Text = "";
        }


    }
}