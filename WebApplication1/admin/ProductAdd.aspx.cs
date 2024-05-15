using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class ProductAdd : System.Web.UI.Page
    {
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
        }
        protected void btnMinusQty_Click(object sender, EventArgs e)
        {
            if (int.Parse(txtQty.Text) > 0)
            {
                txtQty.Text = (int.Parse(txtQty.Text) - 1).ToString();
            }
        }

        protected void btnPlusQty_Click(object sender, EventArgs e)
        {
            txtQty.Text = (int.Parse(txtQty.Text) + 1).ToString();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = txtProdName.Text;
                string color = txtColor.Text.Trim();
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

                string filename1 = null;
                if (fupProd1.HasFile)
                {
                    string path1 = MapPath("~/admin/products/");//folder to store image
                    filename1 = Guid.NewGuid().ToString("N") + ".jpg";
                    SimpleImage img1 = new SimpleImage(fupProd1.FileContent);
                    img1.SaveAs(path1 + filename1);
                }

                string filename2 = null;
                if (fupProd2.HasFile)
                {
                    string path2 = MapPath("~/admin/products/");//folder to store image
                    filename2 = Guid.NewGuid().ToString("N") + ".jpg";
                    SimpleImage img2 = new SimpleImage(fupProd2.FileContent);
                    img2.SaveAs(path2 + filename2);
                }

                string filename3 = null;
                if (fupProd3.HasFile)
                {
                    string path3 = MapPath("~/admin/products/");//folder to store image
                    filename3 = Guid.NewGuid().ToString("N") + ".jpg";
                    SimpleImage img3 = new SimpleImage(fupProd3.FileContent);
                    img3.SaveAs(path3 + filename3);
                }

                string filename4 = null;
                if (fupProd4.HasFile)
                {
                    string path4 = MapPath("~/admin/products/");//folder to store image
                    filename4 = Guid.NewGuid().ToString("N") + ".jpg";
                    SimpleImage img4 = new SimpleImage(fupProd4.FileContent);
                    img4.SaveAs(path4 + filename4);
                }

                string filename5 = null;
                if (fupProd5.HasFile)
                {
                    string path5 = MapPath("~/admin/products/");//folder to store image
                    filename5 = Guid.NewGuid().ToString("N") + ".jpg";
                    SimpleImage img5 = new SimpleImage(fupProd5.FileContent);
                    img5.SaveAs(path5 + filename5);
                }

                // Check if the product already exists
                var existingProduct = db.Products
                    .FirstOrDefault(p => p.prodName == name && p.prodSize == size && p.catID == cat);

                if (existingProduct != null)
                {
                    // If the product exists, update its quantity
                    existingProduct.prodQty += qty;
                    db.SaveChanges();
                }
                else
                {
                    // If the product doesn't exist, create a new product
                    Product p = new Product
                    {
                        prodName = name,
                        prodDesc = desc,
                        prodColor = color,
                        prodPrice = price,
                        prodQty = qty,
                        prodSize = size,
                        prodImg1 = filename1,
                        prodImg2 = filename2,
                        prodImg3 = filename3,
                        prodImg4 = filename4,
                        prodImg5 = filename5,
                        catID = cat
                    };

                    db.Products.Add(p);
                    db.SaveChanges();
                }

                Response.Redirect("ProductAdmin.aspx");
            }
        }


        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtProdName.Text = "";
            txtColor.Text = "";
            txtQty.Text = "";
            txtPrice.Text = "";
            txtDesc.Text = "";
            txtSize.Text = "";
            ddlCat.SelectedIndex = 0;
            fupProd1.Dispose();
            fupProd2.Dispose();
            fupProd3.Dispose();
            fupProd4.Dispose();
            fupProd5.Dispose();

        }
    }
}