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
    public partial class product : System.Web.UI.Page
    {
        string cs = Global.CS;

        public class CartItem
        {
            public string ProdImg { get; set; }
            public string ProdID { get; set; }
            public string ProdName { get; set; }
            public int Qty { get; set; }
            public float Price { get; set; }
            public float Subprice { get; set; }

            public CartItem(string image, string productId, string name, int quantity, float price, float subprice)
            {
                ProdImg = image;
                ProdID = productId;
                ProdName = name;
                Qty = quantity;
                Price = price;
                Subprice = subprice;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
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
                    string query = "SELECT p.prodID, p.prodImg1, p.prodName, p.prodPrice, p.prodColor, c.catName, c.catID FROM Product p INNER JOIN ProductCategory c ON p.catID = c.catID";
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
                    string query = "SELECT p.prodID, p.prodImg1, p.prodName, p.prodPrice, p.prodColor, c.catName, c.catID FROM Product p INNER JOIN ProductCategory c ON p.catID = c.catID WHERE p.prodName LIKE @searchTerm";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@searchTerm", "%" + searchTerm + "%");

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    lvProduct.DataSource = dt; // Change Repeater1 to lvProduct as per your ListView ID
                    lvProduct.DataBind();
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