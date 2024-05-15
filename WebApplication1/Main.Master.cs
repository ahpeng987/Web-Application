using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{

    public partial class Main : System.Web.UI.MasterPage
    {
        DatabaseEntities db = new DatabaseEntities();

        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                logoutBtn.Visible = false;
                loginBtn.Visible = true;
            }
            else
            {
                loginBtn.Visible = false;
                logoutBtn.Visible = true;
                profile.Visible = true;
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/aspx/login.aspx");
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            if (Context.User.Identity.IsAuthenticated)
            {
                string id = Session["userID"].ToString();
                string sql = "UPDATE [User] SET activationCode = NULL, token = NULL WHERE userID = @Id";

                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@Id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    Session["userName"] = null;
                    Session["userEmail"] = null;
                    Session["role"] = null;
                    Session["userID"] = null;

                    FormsAuthentication.SignOut();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Successfully logout.'); window.location='" + ResolveUrl("~/aspx/index.aspx") + "';", true);
                }
            }
        }
    }
}