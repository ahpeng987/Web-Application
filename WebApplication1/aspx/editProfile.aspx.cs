using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class editProfile : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string id = Session["userID"].ToString();

                string sql = "SELECT * FROM [User] WHERE userID = @Id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                bool found = false;
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    editName.Text = (string)dr["userName"];
                    editEmail.Text = (string)dr["userEmail"];
                }

                dr.Close();
                con.Close();

                if (!found)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User not exist.'); window.location='" + ResolveUrl("~/aspx/userProfile.aspx") + "';", true);
                }
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("../aspx/userProfile.aspx");
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = Session["userID"].ToString();
                string name = editName.Text;
                string email = editEmail.Text;

                string sql = "Update [User] SET userName='" + name + "', userEmail='" + email + "' WHERE userID='" + id + "'";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();

                Session["userName"] = name;
                Session["userEmail"] = email;

                con.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User Information Update Successfully'); window.location='" + ResolveUrl("~/aspx/userProfile.aspx") + "';", true);
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
    }
}