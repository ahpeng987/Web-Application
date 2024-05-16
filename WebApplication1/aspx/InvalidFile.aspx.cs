using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class InvalidFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnHome_Click(object sender, EventArgs e)
        {
            if (User.IsInRole("Member"))
                Response.Redirect("~/aspx/index.aspx");
            else if (User.IsInRole("Admin"))
                Response.Redirect("~/admin/dashboard.aspx");
            else Response.Redirect("/aspx/index.aspx");
        }
    }
}