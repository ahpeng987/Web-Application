using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace WebApplication1.admin
{
    public partial class PromotionAdmin : System.Web.UI.Page
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
                BindRepeater();
            }
        }

        private void BindRepeater()
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True"; ;

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT pr.promoImg, pr.promoID, p.prodName, pr.promoDescript, pr.disPrice, pr.oriPrice, pr.startDate, pr.endDate, p.prodSize, p.prodQty, pr.promoColor " +
                                    "FROM Promotion pr " +
                                    "INNER JOIN Product p ON pr.prodID = p.prodID " +
                                    "INNER JOIN ProductCategory pc ON p.catID = pc.CatID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    Repeater1.DataSource = dt;
                    Repeater1.DataBind();
                }
            }
            catch (SqlException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/admin/PromotionAdmin.aspx") + "'; }, 0);", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/admin/PromotionAdmin.aspx") + "'; }, 0);", true);
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btnDelete = (Button)sender;
            string promoID = btnDelete.Attributes["data-promo-id"];

            // Check if promoID is not null and is not empty
            if (!string.IsNullOrEmpty(promoID))
            {
                int id = Convert.ToInt32(promoID);

                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string sql = "DELETE FROM Promotion WHERE promoID = @promoID";

                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@promoID", id);

                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record Deleted Successfully.'); window.location ='PromotionAdmin.aspx';", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Record not found.'); window.location ='PromotionAdmin.aspx';", true);
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
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Promotion ID not found.'); window.location ='PromotionAdmin.aspx';", true);
            }

        }

    }
}