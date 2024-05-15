using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing;
using System.Security.Cryptography;

namespace WebApplication1.aspx
{
    public partial class register1 : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cvUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //from textbox
            string name = args.Value;

            // Check for duplicated username
            // u is object name nia can be any alphabet
            if (db.Logins.Any(u => u.Username == name))
            {
                //same username detected
                args.IsValid = false; //display error message
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string name = regUsername.Text;
                string email = regEmail.Text;
                string password = regPass.Text;

                User u = new User
                {
                    userName = name,
                    userEmail = email,
                    userPsw = Security.getHash(password)
                };

                db.Users.Add(u);
                db.SaveChanges();

                regUsername.Text = "";
                regEmail.Text = "";
                regPass.Text = "";
                regConfirmPass.Text = "";

                Response.Redirect("../aspx/success.aspx");
            }
        }

        protected void cvEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string email = args.Value;

            // Check for duplicated username
            // u is object name nia can be any alphabet
            if (db.Logins.Any(u => u.Useremail == email))
            {
                //same username detected
                args.IsValid = false; //display error message
            }
        }
    }
}