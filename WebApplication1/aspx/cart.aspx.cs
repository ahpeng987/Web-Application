using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebApplication1.aspx.product;

namespace WebApplication1.aspx
{
    public partial class cart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            BindCartItems();
        }


        private void BindCartItems()
        {
            List<CartItem> cartItems = (List<CartItem>)Session["cart"];

            if (cartItems != null && cartItems.Count > 0)
            {
                gvCart.DataSource = cartItems;
                gvCart.DataBind();
                lblEmptyCartMessage.Visible = false;
                lblSubTotalAmount.Visible = true;
                lblShipping.Visible = true;
                lblTotalAmount.Visible = true;
                gvCart.Visible = true;
            }
            else
            {
                gvCart.Visible = false;
                lblEmptyCartMessage.Visible = true;
                lblTotalAmount.Visible = false;
                lblShipping.Visible = false;
                lblTotalAmount.Visible = false;
                checkOutBtn.Enabled = false;

            }

        }
        protected void gvCart_ItemDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Get the CartItem for the current row
                CartItem item = (CartItem)e.Row.DataItem;

                // Find the TextBox control for the quantity
                TextBox txtQuantity = (TextBox)e.Row.FindControl("txtQuantity");

                // Set the Text property of the TextBox to the Quantity property of the CartItem
                txtQuantity.Text = item.Qty.ToString();
            }
        }

        protected void btnRemoveItem_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandArgument == "Delete")
            {
                // Get the GridViewRow that contains the clicked button
                GridViewRow row = ((Button)sender).NamingContainer as GridViewRow;

                // Get the index of the row that was clicked
                int rowIndex = row.RowIndex;

                // Retrieve the list of items in the cart from session state
                List<CartItem> cartItems = (List<CartItem>)Session["cart"];

                // Remove the item at the specified index
                cartItems.RemoveAt(rowIndex);

                // Update the cart in session state
                Session["CartItems"] = cartItems;

                // Bind the updated cart to the GridView control
                BindCartItems();
            }
        }

        protected void CheckoutBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/aspx/Payment.aspx");
        }
    }
}