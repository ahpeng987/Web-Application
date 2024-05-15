using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class userProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] != null)
            {
                string username = Session["userName"].ToString();
                lblName.Text = username;
            }

            if (Session["userEmail"] != null)
            {
                string useremail = Session["userEmail"].ToString();
                lblEmail.Text = useremail;
            }
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                Session["userName"] = null;
                Session["userEmail"] = null;
                Session["role"] = null;
                Session["userID"] = null;
                FormsAuthentication.SignOut();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully logout.'); window.location='" + ResolveUrl("~/aspx/index.aspx") + "';", true);
            }
        }

        protected void editProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("editProfile.aspx");
        }

        protected void changePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("changePass.aspx");
        }

        protected void viewOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }
    }
}