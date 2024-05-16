using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class ProductAdmin : System.Web.UI.Page
    {
        string cs = Global.CS;
        DatabaseEntities db = new DatabaseEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminName"] != null)
            {
                string adminname = Session["adminName"].ToString();
                lblWelcomeMessage.Text = adminname;
            }
            else
            {
                Response.Redirect("../admin/notAdmin.aspx");
            }

            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT Product.*, ProductCategory.catName FROM Product INNER JOIN ProductCategory ON Product.catID = ProductCategory.catID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    rptProduct.DataSource = dt;
                    rptProduct.DataBind();

                }
            }
            catch (Exception ex)
            {
                // Handle the exception
                Response.Write("An error occurred while retrieving data: " + ex.Message);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchTerm = searchProd.Text.Trim();


            SearchFunction(searchTerm);

        }

        private void SearchFunction(string searchTerm)
        {
            try
            {

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT p.*, c.catName FROM Product p INNER JOIN ProductCategory c ON p.catID = c.catID WHERE p.prodName LIKE @searchTerm";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@searchTerm", "%" + searchTerm + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    rptProduct.DataSource = dt; // Change Repeater1 to lvProduct as per your ListView ID
                    rptProduct.DataBind();
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