using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class updatePromotion : System.Web.UI.Page
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

                if (Request.QueryString["promoID"] != null)
                {

                    string promoID = Request.QueryString["promoID"];

                    // Use promoID to fetch promotion details
                    FetchAndDisplayPromotionDetails(promoID);
                }
                else
                {

                    Response.Write("Promotion ID is missing.");
                }
            }

        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                if (Page.IsValid)
                {
                    string promotionID = txtpromoID.Text;
                    string Description = txtDescription.Text;
                    string Discount = txtDiscount.Text;
                    DateTime Start = DateTime.Parse(txtStartDate.Text);
                    DateTime End = DateTime.Parse(txtEndDate.Text);
                    string Original = txtOriPrice.Text;
                    string Name = txtProductName.Text;
                    string color = txtpromoColor.Text;

                    // Check if a new image is uploaded
                    if (fupNewImage.HasFile)
                    {
                        // Save the new image
                        string path = MapPath("~/admin/img/");
                        string filename1 = Guid.NewGuid().ToString("N") + Path.GetExtension(fupNewImage.FileName);
                        string filename2 = Guid.NewGuid().ToString("N") + Path.GetExtension(fupNewImage2.FileName);
                        string filename3 = Guid.NewGuid().ToString("N") + Path.GetExtension(fupNewImage3.FileName);

                        fupNewImage.SaveAs(path + filename1);
                        fupNewImage2.SaveAs(path + filename2);
                        fupNewImage3.SaveAs(path + filename3);

                        // Update the image path in the database
                        string updateImageSql = "UPDATE Promotion SET promoImg = @promoImg, promoImg2 = @promoImg2, promoImg3 = @promoImg3 WHERE promoID = @promoID";
                        SqlCommand updateImageCmd = new SqlCommand(updateImageSql, con);
                        updateImageCmd.Parameters.AddWithValue("@promoID", promotionID);
                        updateImageCmd.Parameters.AddWithValue("@promoImg", filename1);
                        updateImageCmd.Parameters.AddWithValue("@promoImg2", filename2);
                        updateImageCmd.Parameters.AddWithValue("@promoImg3", filename3);

                        con.Open();
                        updateImageCmd.ExecuteNonQuery();
                        con.Close();
                    }

                    // Update the promotion details in the database
                    string updateSql = "UPDATE PROMOTION SET promoDescript = @promoDescript, disPrice = @disPrice, startDate = @startDate, endDate = @endDate, oriPrice = @oriPrice, promoColor = @promoColor, prodID = @prodID WHERE promoID = @promoID";
                    SqlCommand cmd = new SqlCommand(updateSql, con);
                    cmd.Parameters.AddWithValue("@promoID", promotionID);
                    cmd.Parameters.AddWithValue("@promoDescript", Description);
                    cmd.Parameters.AddWithValue("@disPrice", Discount);
                    cmd.Parameters.AddWithValue("@startDate", Start);
                    cmd.Parameters.AddWithValue("@endDate", End);
                    cmd.Parameters.AddWithValue("@oriPrice", Original);
                    cmd.Parameters.AddWithValue("@promoColor", color);
                    cmd.Parameters.AddWithValue("@prodID", GetProductIDByName(Name, connectionString));

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    if (rowsAffected > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Promotion modified successfully.'); window.location ='PromotionAdmin.aspx';", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Promotion not found'); window.location ='PromotionAdmin.aspx';", true);
                    }
                }
            }
        }
        private int GetProductIDByName(string Name, string connectionString)
        {
            int prodID = 0;
            string query = "SELECT prodID FROM Product WHERE prodName = @prodName";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@prodName", Name);
                con.Open();
                object result = cmd.ExecuteScalar();
                if (result != null)
                {
                    prodID = (int)result;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product not found.'); window.location ='PromotionAdmin.aspx';", true);
                }
            }
            return prodID;
        }
        private void FetchAndDisplayPromotionDetails(string promoID)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT pr.promoID, p.prodName, pr.promoDescript, pr.disPrice, pr.oriPrice, pr.startDate, pr.endDate, p.prodQty, pr.promoColor " +
                                   "FROM Promotion pr INNER JOIN Product p ON pr.prodID = p.prodID WHERE pr.promoID = @promoID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@promoID", promoID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve existing promotion details
                        string Description = reader["promoDescript"].ToString();
                        string Discount = reader["disPrice"].ToString();
                        DateTime Start = (DateTime)reader["startDate"];
                        DateTime End = (DateTime)reader["endDate"];
                        string Original = reader["oriPrice"].ToString();
                        string prodName = reader["prodName"].ToString();
                        string color = reader["promoColor"].ToString();

                        // Display existing details in the input fields
                        txtpromoID.Text = promoID;
                        txtDescription.Text = Description;
                        txtDiscount.Text = Discount;
                        txtStartDate.Text = Start.ToString("yyyy-MM-dd");
                        txtEndDate.Text = End.ToString("yyyy-MM-dd");
                        txtOriPrice.Text = Original;
                        txtpromoColor.Text = color;

                        txtProductName.Text = prodName;
                        txtProductName.ReadOnly = true;
                    }
                    else
                    {
                        Response.Write("Promotion not found.");
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred: " + ex.Message);
            }
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtpromoID.Text = "";
            txtDescription.Text = "";
            txtDiscount.Text = "";
            txtStartDate.Text = "";
            txtEndDate.Text = "";
            txtOriPrice.Text = "";
            txtProductName.Text = "";
            txtpromoColor.Text = "";
        }
        protected void ValidateDateFormat(object source, ServerValidateEventArgs args)
        {

            DateTime date;
            args.IsValid = DateTime.TryParseExact(args.Value, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out date);
        }
    }
}



