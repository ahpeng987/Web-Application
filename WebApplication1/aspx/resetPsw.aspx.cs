using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class register : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void resetBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string useremail = Session["email"].ToString();
                string password = resetPass.Text;
                string hash = Security.getHash(password);

                string sql = "UPDATE [User] SET userPsw = @Password WHERE userEmail = @Email";

                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.AddWithValue("@Password", hash);
                        cmd.Parameters.AddWithValue("@Email", useremail);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Changed Successfully !! You can try to login now !!'); window.location='" + ResolveUrl("../aspx/login.aspx") + "';", true);
            }
            catch (Exception ex)
            {
                // Handle the exception
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
            }
        }
    }
}