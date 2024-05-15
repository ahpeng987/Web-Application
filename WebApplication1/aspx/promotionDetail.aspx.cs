using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static WebApplication1.aspx.product;

namespace WebApplication1.aspx
{
    public partial class promotionDetail1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtQty.Text = "1";
                // Check if the promoID query parameter exists
                if (Request.QueryString["promoID"] != null)
                {
                    // Retrieve the promoID from the query parameter
                    string promoID = Request.QueryString["promoID"];
                    string prodID = Request.QueryString["prodID"];
                    string name = Request.QueryString["prodName"];

                    // Use promoID to fetch promotion details
                    FetchAndDisplayPromotionDetails(promoID, prodID);
                    /*LoadProductSizes(name);*/
                }
                else
                {
                    // Handle the case where promoID query parameter is missing
                    Response.Write("Promotion ID is missing.");
                }



            }
        }

        private void FetchAndDisplayPromotionDetails(string promoID, string prodID)
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"
                 SELECT pr.promoID, pr.promoImg, pr.promoImg2, pr.promoImg3, p.prodName, pr.promoDescript, pr.disPrice, pr.oriPrice, pr.startDate, pr.endDate, p.prodQty, pr.promoColor, p.prodSize, pc.catName  
                    FROM Promotion pr 
                    INNER JOIN Product p ON pr.prodID = p.prodID 
                    INNER JOIN ProductCategory pc ON p.catID = pc.catID 
                    WHERE pr.promoID = @promoID AND p.prodID = @prodID";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@promoID", promoID);
                    cmd.Parameters.AddWithValue("@prodID", prodID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve promotion details
                        string color = reader["promoColor"].ToString();
                        string Size = reader["prodSize"].ToString();
                        string catName = reader["catName"].ToString();
                        string Description = reader["promoDescript"].ToString();
                        string Discount = reader["disPrice"].ToString();
                        DateTime Start = (DateTime)reader["startDate"];
                        DateTime End = (DateTime)reader["endDate"];
                        string Original = reader["oriPrice"].ToString();
                        string productName = reader["prodName"].ToString();
                        string promoImg = reader["promoImg"].ToString();
                        string promoImg2 = reader["promoImg2"].ToString();
                        string promoImg3 = reader["promoImg3"].ToString();

                        // Check if the image paths are correct
                        Debug.WriteLine("PromoImg: " + promoImg);
                        Debug.WriteLine("PromoImg: " + promoImg2);
                        Debug.WriteLine("PromoImg: " + promoImg3);

                        // Set image sources

                        imgProd1.ImageUrl = "../admin/img/" + promoImg;
                        imgProd2.ImageUrl = "../admin/img/" + promoImg2;
                        imgProd3.ImageUrl = "../admin/img/" + promoImg3;


                        // Display existing details in the appropriate controls on your page
                        lblDescription.InnerText = Description;
                        lblDiscountPrice.InnerText = Discount;
                        lblOriginalPrice.InnerText = Original;
                        lblProductName.InnerText = productName;
                        lblColor.Text = color;
                        lblSize.Text = Size;
                        lblCatName.Text = catName;
                        lblColor2.Text = color;
                        lblStart.InnerText = Start.ToString("dd-MM-yyyy");
                        lblEnd.InnerText = End.ToString("dd-MM-yyyy");
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

        protected void AddToCartButton_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["prodID"];
            string imageUrl = imgProd1.ImageUrl;
            string name = lblProductName.InnerText;
            int qty = Convert.ToInt32(txtQty.Text);
            float price = Convert.ToSingle(lblDiscountPrice.InnerText);
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



        protected void btnMinus_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtQty.Text) && int.TryParse(txtQty.Text, out int qty))
            {
                if (qty > 0)
                {
                    txtQty.Text = (qty - 1).ToString();
                }
            }
            else
            {
                // Handle the case when the text is empty or not a valid number
                txtQty.Text = "0";
            }
        }

        protected void btnPlus_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtQty.Text) && int.TryParse(txtQty.Text, out int qty))
            {
                txtQty.Text = (qty + 1).ToString();
            }
            else
            {
                // Handle the case when the text is empty or not a valid number
                txtQty.Text = "1";
            }
        }
        protected void Feedback_Click(object sender, EventArgs e)
        {

            string promoID = Request.QueryString["promoID"];
            string prodName = lblProductName.InnerText;


            Response.Redirect($"viewfeedback.aspx?promoID={promoID}&prodName={prodName}");
        }


    }
}

