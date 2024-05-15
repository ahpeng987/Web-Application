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
    public partial class editAdminProfile : System.Web.UI.Page
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

            }

            if (!Page.IsPostBack)
            {
                string id = Session["adminID"].ToString();

                string sql = "SELECT * FROM [Admin] WHERE adminID = @Id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                bool found = false;
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    editAdminName.Text = (string)dr["adminName"];
                    editAdminEmail.Text = (string)dr["adminEmail"];
                }

                dr.Close();
                con.Close();
            }
        }


        protected void updateBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string id = Session["adminID"].ToString();
                string name = editAdminName.Text;
                string email = editAdminEmail.Text;

                string sql = "Update [Admin] SET adminName='" + name + "', adminEmail='" + email + "' WHERE adminID='" + id + "'";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                cmd.ExecuteNonQuery();

                Session["adminName"] = name;
                Session["adminEmail"] = email;

                con.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User Information Update Successfully'); window.location='" + ResolveUrl("~/admin/dashboard.aspx") + "';", true);
            }
        }

        protected void cvAdminName_ServerValidate(object source, ServerValidateEventArgs args)
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

        protected void toChangePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("../admin/changeAdminPass.aspx");
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("../admin/dashboard.aspx");
        }
    }
}