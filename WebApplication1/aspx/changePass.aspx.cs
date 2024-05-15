using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class changePass : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();

        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("../aspx/userProfile.aspx");
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    string id = Session["userID"].ToString();
                    string password = editPass.Text;
                    string hash = Security.getHash(password);

                    string sql = "UPDATE [User] SET userPsw = @Password WHERE userID = @id";

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

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Changed Successfully !!'); window.location='" + ResolveUrl("../aspx/userProfile.aspx") + "';", true);
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                }
            }

        }
    }
}