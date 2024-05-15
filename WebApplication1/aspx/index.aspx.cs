using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class index : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                string username = Session["userName"].ToString();
                lblWelcomeMessage.Text = "Welcome To JD Sport, " + username + "!";
            }
            else
            {
                lblWelcomeMessage.Text = "Welcome To JD Sport!";
            }

            if (!IsPostBack)
            {
                Bind();
            }
        }

        private void Bind()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT TOP 6 p.prodID, p.prodImg1, p.prodImg2, p.prodImg3, p.prodImg4, p.prodImg5, p.prodName, p.prodPrice, p.prodColor, p.prodDesc, pc.catName FROM Product p INNER JOIN ProductCategory pc ON p.catID = pc.catID ORDER BY p.prodID DESC";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    lvProduct.DataSource = dt;
                    lvProduct.DataBind();
                }
            }
            catch (SqlException)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/productDisplayTest.aspx") + "'; }, 0);", true);
            }
            catch (Exception)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('There is an error occurred in this page. Sorry!'); setTimeout(function(){ window.location.href = '" + ResolveClientUrl("~/productDisplayTest.aspx") + "'; }, 0);", true);
            }
        }

    }
}