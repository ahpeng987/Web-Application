using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.aspx;

namespace WebApplication1.admin
{
    public partial class changeAdminPass : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();

        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminName"] != null)
            {
                string adminname = Session["adminName"].ToString();
                lblWelcomeMessage.Text = adminname;
            }
            else
            {
                Response.Redirect("../admin/notAdmin.aspx");
            }
        }

        protected void changePassBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string id = Session["adminID"].ToString();
                    string password = editAdminPass.Text;
                    string hash = Security.getHash(password);

                    string sql = "UPDATE [Admin] SET adminPsw = @Password WHERE adminID = @id";

                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        using (SqlCommand cmd = new SqlCommand(sql, con))
                        {
                            cmd.Parameters.AddWithValue("@Password", hash);
                            cmd.Parameters.AddWithValue("@id", id);
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Changed Successfully !!'); window.location='" + ResolveUrl("../admin/dashboard.aspx") + "';", true);
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                }
            }
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("../admin/editAdminProfile.aspx");
        }
    }
}