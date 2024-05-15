using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void logoutBtn_Click1(object sender, EventArgs e)
        {
            Session["adminName"] = null;
            Session["adminEmail"] = null;
            Session["role"] = null;
            Session["adminID"] = null;
            FormsAuthentication.SignOut();

            Response.Write("<script>alert('Log out successfully !'); window.location.href='../aspx/index.aspx';</script>");
        }
    }
}