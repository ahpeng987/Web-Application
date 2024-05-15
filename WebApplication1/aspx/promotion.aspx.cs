using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class promotion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = searchInput.Text.Trim();


            SearchFunction(searchTerm);
        }

        private void SearchFunction(string searchTerm)
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT pr.promoID, pr.promoImg, p.prodName, pr.disPrice, pr.oriPrice, p.prodID, pr.startDate, pr.endDate " +
                                   "FROM Promotion pr INNER JOIN Product p ON pr.prodID = p.prodID " +
                                   "WHERE p.prodName LIKE @searchTerm";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@searchTerm", "%" + searchTerm + "%");

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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/aspx/promotion.aspx") + "'; }, 0);", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/aspx/promotion.aspx") + "'; }, 0);", true);
            }
        }
        private void BindRepeater()
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT pr.promoID, pr.promoImg, p.prodName, pr.disPrice, pr.oriPrice, p.prodID, pr.startDate, pr.endDate " +
                            "FROM Promotion pr INNER JOIN Product p ON pr.prodID = p.prodID";
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
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/aspx/promotion.aspx") + "'; }, 0);", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/aspx/promotion.aspx") + "'; }, 0);", true);
            }
        }
    }
}




