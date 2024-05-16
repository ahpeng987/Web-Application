using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace WebApplication1.aspx
{
    public partial class checkOTP : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();

        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void otpSubmit_Click(object sender, EventArgs e)
        {
            string input = otpInput.Text;

            if (input == Session["otp"].ToString())
            {
                lblVerify.Text = "Activation successful.";
                lblVerify.ForeColor = Color.Green;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('OTP Verified Successfully.'); window.location='" + ResolveUrl("../aspx/resetPsw.aspx") + "';", true);
            }
            else
            {
                lblVerify.Text = "Invalid OTP.";
                lblVerify.ForeColor = Color.Red;
            }
        }
    }
}