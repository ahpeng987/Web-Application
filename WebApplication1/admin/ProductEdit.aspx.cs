using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.IO;
using System.EnterpriseServices;

namespace WebApplication1.admin
{
    public partial class ProductEdit : System.Web.UI.Page
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

            }

            if (!IsPostBack)
            {
                string id = Request.QueryString["prodID"];
                Product p = db.Products.SingleOrDefault(o => o.prodID.ToString() == id);

                if (p != null)
                {
                    //LoadProductDetails(id);
                    Image1.ImageUrl = "~/admin/products/" + p.prodImg1;
                    Image2.ImageUrl = "~/admin/products/" + p.prodImg2;
                    Image3.ImageUrl = "~/admin/products/" + p.prodImg3;
                    Image4.ImageUrl = "~/admin/products/" + p.prodImg4;
                    Image5.ImageUrl = "~/admin/products/" + p.prodImg5;
                    txtProdID.Text = p.prodID.ToString();

                    txtProdName.Text = p.prodName;
                    txtColor.Text = p.prodColor.Trim();
                    txtDesc.Text = p.prodDesc;
                    txtPrice.Text = p.prodPrice.ToString("F2");
                    txtQty.Text = Convert.ToString(p.prodQty);
                    txtSize.Text = Convert.ToString(p.prodSize);
                    int cat = p.catID;
                    switch (cat)
                    {
                        case 2000:
                            ddlCat.SelectedIndex = 1; break;
                        case 2001:
                            ddlCat.SelectedIndex = 2; break;
                        case 2002:
                            ddlCat.SelectedIndex = 3; break;
                    }


                }
                else
                {
                    Response.Redirect("~/admin/ProductAdmin.aspx");
                }
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
            txtQty.Text = (int.Parse(txtQty.Text) + 1).ToString();
        }

        protected void btnMinusSize_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtSize.Text) > 0)
            {
                txtSize.Text = (int.Parse(txtSize.Text) - 1).ToString();
            }
        }

        protected void btnPlusSize_Click(object sender, EventArgs e)
        {
            txtSize.Text = (int.Parse(txtSize.Text) + 1).ToString();
        }


        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string id = txtProdID.Text;
                Product p = db.Products.SingleOrDefault(o => o.prodID.ToString() == id);

                if (p != null)
                {
                    string name = txtProdName.Text;
                    string color = txtColor.Text;
                    int qty = Convert.ToInt32(txtQty.Text);
                    float price = Convert.ToSingle(txtPrice.Text);
                    string desc = txtDesc.Text;
                    float size = Convert.ToSingle(txtSize.Text);
                    int catddl = ddlCat.SelectedIndex;
                    int cat = 0;
                    switch (catddl)
                    {
                        case 1:
                            cat = 2000;
                            break;
                        case 2:
                            cat = 2001;
                            break;
                        case 3:
                            cat = 2002;
                            break;
                    }

                    p.prodName = name;
                    p.prodColor = color;
                    p.prodQty = qty;
                    p.prodPrice = price;
                    p.prodDesc = desc;
                    p.prodSize = size;
                    p.catID = cat;

                    if (fupProd1.HasFile)
                    {
                        string path = MapPath("~/admin/products/");
                        string filename = p.prodImg1;
                        File.Delete(path + filename);

                        filename = Guid.NewGuid().ToString("N") + ".jpg";
                        SimpleImage img = new SimpleImage(fupProd1.FileContent);

                        img.SaveAs(path + filename);

                        p.prodImg1 = filename;

                    }

                    if (fupProd2.HasFile)
                    {
                        string path = MapPath("~/admin/products/");
                        string filename = p.prodImg2;
                        File.Delete(path + filename);

                        filename = Guid.NewGuid().ToString("N") + ".jpg";
                        SimpleImage img = new SimpleImage(fupProd2.FileContent);

                        img.SaveAs(path + filename);

                        p.prodImg2 = filename;

                    }

                    if (fupProd3.HasFile)
                    {
                        string path = MapPath("~/admin/products/");
                        string filename = p.prodImg3;
                        File.Delete(path + filename);

                        filename = Guid.NewGuid().ToString("N") + ".jpg";
                        SimpleImage img = new SimpleImage(fupProd3.FileContent);

                        img.SaveAs(path + filename);

                        p.prodImg3 = filename;

                    }

                    if (fupProd4.HasFile)
                    {
                        string path = MapPath("~/admin/products/");
                        string filename = p.prodImg4;
                        File.Delete(path + filename);

                        filename = Guid.NewGuid().ToString("N") + ".jpg";
                        SimpleImage img = new SimpleImage(fupProd4.FileContent);

                        img.SaveAs(path + filename);

                        p.prodImg4 = filename;

                    }

                    if (fupProd5.HasFile)
                    {
                        string path = MapPath("~/admin/products/");
                        string filename = p.prodImg5;
                        File.Delete(path + filename);

                        filename = Guid.NewGuid().ToString("N") + ".jpg";
                        SimpleImage img = new SimpleImage(fupProd5.FileContent);

                        img.SaveAs(path + filename);

                        p.prodImg5 = filename;

                    }


                    db.SaveChanges();
                }

                Response.Redirect("ProductAdmin.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

            string id = txtProdID.Text;
            Product p = db.Products.SingleOrDefault(o => o.prodID.ToString() == id);

            if (p != null)
            {
                // Check if the product is associated with any order items
                if (db.OrderItems.Any(oi => oi.prodID == p.prodID))
                {
                    // If the product is associated with order items, display a message to the user
                    ScriptManager.RegisterStartupScript(this, GetType(), "showAlert", "alert('Cannot delete the product because it is associated with order items.');", true);
                    return; // Stop further execution
                }

                try
                {
                    string path1 = MapPath("~/admin/products/");
                    string filename1 = p.prodImg1;
                    File.Delete(path1 + filename1);

                    if (fupProd2.HasFile)
                    {
                        string path2 = MapPath("~/admin/products/");
                        string filename2 = p.prodImg2;
                        File.Delete(path2 + filename2);
                    }

                    if (fupProd3.HasFile)
                    {
                        string path3 = MapPath("~/admin/products/");
                        string filename3 = p.prodImg3;
                        File.Delete(path3 + filename3);
                    }

                    if (fupProd4.HasFile)
                    {
                        string path4 = MapPath("~/admin/products/");
                        string filename4 = p.prodImg4;
                        File.Delete(path4 + filename4);
                    }

                    if (fupProd5.HasFile)
                    {
                        string path5 = MapPath("~/admin/products/");
                        string filename5 = p.prodImg5;
                        File.Delete(path5 + filename5);
                    }


                    db.Products.Remove(p);
                    db.SaveChanges();
                    Response.Redirect("ProductAdmin.aspx");

                }
                catch (Exception ex)
                {
                    // Handle other exceptions that might occur during deletion
                    Response.Write("An error occurred: " + ex.Message);
                }
            }

        }
    }
}