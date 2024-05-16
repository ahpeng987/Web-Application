using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.admin;
using static WebApplication1.aspx.product;

namespace WebApplication1.aspx
{
    public partial class prodDetail1 : System.Web.UI.Page
    {
        string cs = Global.CS;
        DatabaseEntities db = new DatabaseEntities();

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtQty.Text = "1";
                string id = Request.QueryString["prodID"];
                string name = Request.QueryString["prodName"];
                string color = Request.QueryString["prodColor"];
                string category = Request.QueryString["catName"];
                string qty = Request.QueryString["prodQty"];
                if (!string.IsNullOrEmpty(id))
                {
                    LoadProductDetails(id);
                    LoadProductSizes(name, color, category);
                    if (!string.IsNullOrEmpty(qty))
                    {
                        hfMaxQty.Value = qty; // Store the max quantity in hidden field
                    }
                    lblQuantity.Text = "Quantity left: " + qty;
                }
                else
                {
                    Response.Redirect("~/product.aspx");
                }
                Bind();
            }

        }

        private void LoadProductDetails(string prodID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT p.prodID, p.prodImg1, p.prodImg2, p.prodImg3, p.prodImg4, p.prodImg5, p.prodName, pc.catName, p.prodPrice, p.prodColor, p.prodDesc FROM Product p INNER JOIN ProductCategory pc ON p.catID = pc.catID WHERE p.prodID = @prodID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@prodID", prodID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        DisplayProductImage(reader["prodImg1"].ToString(), prodImg1);
                        DisplayProductImage(reader["prodImg2"].ToString(), prodImg2);
                        DisplayProductImage(reader["prodImg3"].ToString(), prodImg3);
                        DisplayProductImage(reader["prodImg4"].ToString(), prodImg4);
                        DisplayProductImage(reader["prodImg5"].ToString(), prodImg5);
                        
                        lblProdName.Text = reader["prodName"].ToString();
                        
                        lblCatName.Text = reader["catName"].ToString();

                        lblPrice.Text = float.Parse(reader["prodPrice"].ToString()).ToString("F2");

                        lblColor.Text = reader["prodColor"].ToString();
                        lblColor2.Text = reader["prodColor"].ToString();
                        lblDesc.Text = reader["prodDesc"].ToString();
                        lblDesc2.Text = reader["prodDesc"].ToString();
                    }
                    reader.Close();
                }
            }
            catch (SqlException ex)
            {
                // Handle SQL exception
                // For example, log the error or show an error message
                Response.Write("An error occurred while retrieving product details: " + ex.Message);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Response.Write("An error occurred: " + ex.Message);
            }
        }

        private void DisplayProductImage(string imagePath, Image imageControl)
        {
            if (!string.IsNullOrEmpty(imagePath))
            {
                // If the image path is not empty, set it as the ImageUrl
                imageControl.ImageUrl = "../admin/products/" + imagePath; // Assuming the images are stored in the "admin/img" folder
                imageControl.Visible = true;
            }
            else
            {
                // If the image path is empty, hide the Image control
                imageControl.Visible = false;
            }
        }

        private void LoadProductSizes(string productName, string color, string category)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"SELECT DISTINCT prodSize FROM Product WHERE prodName = @prodName AND prodColor = @color AND catID IN (SELECT catID FROM ProductCategory WHERE catName = @category)";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@prodName", productName);
                    cmd.Parameters.AddWithValue("@color", color);
                    cmd.Parameters.AddWithValue("@category", category);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    rptSizes.DataSource = reader;
                    rptSizes.DataBind();
                }
            }
            catch (SqlException ex)
            {
                // Handle SQL exception
                Response.Write("An error occurred while retrieving product sizes: " + ex.Message);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Response.Write("An error occurred: " + ex.Message);
            }
        }

        private void Bind()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {

                    string query = "SELECT TOP 4 * FROM Product ORDER BY NEWID()";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    lvOtherProd.DataSource = dt;
                    lvOtherProd.DataBind();
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

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = Request.QueryString["prodID"];
                string imageUrl = prodImg1.ImageUrl;
                string name = lblProdName.Text;
                int qty = Convert.ToInt32(txtQty.Text);
                float price = Convert.ToSingle(lblPrice.Text);
                float subprice = price;
                // Check if the cart is already in the session
                List<CartItem> cart;

                if (Session["cart"] != null)
                {
                    cart = (List<CartItem>)Session["cart"];
                }
                else
                {
                    cart = new List<CartItem>();
                }

                // Check if the item is already in the cart
                bool itemAlreadyInCart = false;

                foreach (CartItem item in cart)
                {
                    if (item.ProdID == id)
                    {
                        itemAlreadyInCart = true;
                        item.Qty += 1;
                        item.Subprice = item.Qty * item.Price;

                        break;
                    }

                    if (itemAlreadyInCart)
                    {
                        cart[cart.FindIndex(x => x.ProdID == id)] = new CartItem(imageUrl, id, name, item.Qty, price, item.Subprice);
                    }

                }

                // Add the new item to the cart if it is not already in the cart
                if (!itemAlreadyInCart)
                {
                    cart.Add(new CartItem(imageUrl, id, name, qty, price, subprice));
                }

                // Store the updated cart in the session
                Session["cart"] = cart;
                // Redirect to the Add to Cart page
                ScriptManager.RegisterStartupScript(this, this.GetType(), "showModal", "$('#addToCartModal').modal('show');", true);
            }

        }

        

        protected void btnMinus_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtQty.Text) > 0)
            {
                txtQty.Text = (int.Parse(txtQty.Text) - 1).ToString();
            }
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            int currentQty = int.Parse(txtQty.Text);
            int maxQty = int.Parse(hfMaxQty.Value);

            if (currentQty < maxQty)
            {
                txtQty.Text = (currentQty + 1).ToString();
            }
            else
            {
                // Display an alert message when the quantity exceeds the maximum available
                string message = $"Opps, the maximum quantity of this product is {maxQty}";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", $"alert('{message}');", true);
            }
        }

        protected void txtQty_TextChanged(object sender, EventArgs e)
        {
            // Ensure the quantity entered is within the range of 1 to the maximum quantity
            int currentQty = int.Parse(txtQty.Text);
            int maxQty = int.Parse(hfMaxQty.Value);

            if (currentQty > maxQty)
            {
                // If the quantity entered exceeds the maximum, reset it to the maximum
                txtQty.Text = maxQty.ToString();
                // Alert the user about the correction
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", $"alert('Maximum quantity of this product is {maxQty}');", true);
            }
            else if (currentQty < 1)
            {
                // If the quantity entered is less than 1, reset it to 1
                txtQty.Text = "1";
            }
        }

        protected void ValidateQuantity(object sender, ServerValidateEventArgs e)
        {
            // Server-side validation to ensure quantity does not exceed maximum
            int maxQty = int.Parse(hfMaxQty.Value);
            int currentQty = int.Parse(e.Value);
            e.IsValid = currentQty <= maxQty;
        }

        protected void Feedback_Click(object sender, EventArgs e)
        {
            string prodID = Request.QueryString["prodID"];

            if (!string.IsNullOrEmpty(prodID))
            {
                // Assuming you have a method to retrieve product name from the database based on prodID
                string prodName = GetProdNameFromProdID(prodID);

                if (!string.IsNullOrEmpty(prodName))
                {
                    Response.Redirect($"SpecificFeedback.aspx?prodID={prodID}&prodName={Server.UrlEncode(prodName)}");
                }
                else
                {
                    // Handle the case where product name is not found for the given prodID
                    Response.Write("Product name not found for the given product ID.");
                }
            }
            else
            {
                // Handle the case where prodID is not provided in the query string
                Response.Write("Product ID not provided.");
            }
        }

        private string GetProdNameFromProdID(string prodID)
        {
            string prodName = "";

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string sql = "SELECT prodName FROM Product WHERE prodID = @prodID";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@prodID", prodID);

                con.Open();
                prodName = cmd.ExecuteScalar()?.ToString(); // Assuming prodName is a string
            }

            return prodName;
        }


    }
}