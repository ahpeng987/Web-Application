using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Threading;
using System.Threading.Tasks;
using System.Configuration;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Data;
using Newtonsoft.Json;
using System.Net;
using Newtonsoft.Json.Linq;

namespace WebApplication1.aspx
{
    public partial class login : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();

        string cs = Global.CS;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["UserID"] == null)
            {

                HttpCookie authCookie = Request.Cookies["RememberMe"];
                if (authCookie != null)
                {
                    string token = authCookie.Value;
                    (string userID, string userName, string userEmail) = ValidateTokenAndGetUserID(token);
                    if (!string.IsNullOrEmpty(userID))
                    {
                        Login u = db.Logins.SingleOrDefault(x => x.Username == userName);

                        if (u != null)
                        {
                            // Establish user session and redirect
                            Session["userID"] = userID;
                            Session["Role"] = "customer";
                            Session["userName"] = userName; ;
                            Session["userEmail"] = userEmail; ;
                            RedirectUser(Session["Role"].ToString());
                        }

                    }
                }
            }

        }

        private string GenerateToken()
        {
            using (RandomNumberGenerator rng = new RNGCryptoServiceProvider())
            {
                byte[] tokenData = new byte[32];
                rng.GetBytes(tokenData);
                return Convert.ToBase64String(tokenData);
            }
        }

        private void SetPersistentCookie(string name, string value)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.HttpOnly = true;
            cookie.Expires = DateTime.Now.AddDays(30); // Expires in 30 days
            Response.Cookies.Add(cookie);
        }

        private void SaveTokenToDatabase(string userID, string token)
        {
            string id = Session["userID"].ToString();
            string sql = "UPDATE [User] SET token = @Token WHERE userID = @Id";

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Token", token);
                cmd.Parameters.AddWithValue("@Id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        private (string userID, string userName, string userEmail) ValidateTokenAndGetUserID(string token)
        {
            string sql = "SELECT userID, userName, userEmail FROM [User] WHERE token = @Token";

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Token", token);

                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    string userID = dr["userID"].ToString();
                    string userName = dr["userName"].ToString();
                    string userEmail = dr["userEmail"].ToString();
                    con.Close();
                    return (userID, userName, userEmail);


                }
                else
                {
                    return (null, null, null);
                }


            }
        }

        private void RedirectUser(string role)
        {
            if (role.ToLower() == "customer")
            {
                Response.Redirect("../aspx/index.aspx");
            }
            else if (role.ToLower() == "admin")
            {
                Response.Redirect("../admin/dashboard.aspx");
            }
        }


        protected void btnLogin_Click(object sender, EventArgs e)
        {

            string response = Request.Form["g-recaptcha-response"];
            bool isCaptchaValid = ValidateCaptcha(response);

            if (isCaptchaValid)
            {

                if (Page.IsValid)
                {
                    string username = loginUsername.Text;
                    string password = loginPass.Text;
                    bool rememberMe = chkRememberMe.Checked;

                    string hash = Security.getHash(password.Trim());



                    // Define session keys for tracking failed login attempts
                    const string FailedLoginAttemptsKey = "FailedLoginAttempts";
                    const string LastFailedLoginTimeKey = "LastFailedLoginTime";

                    DateTime lastFailedLoginTime = DateTime.MinValue;
                    int failedAttempts = 0;



                    if (Session[FailedLoginAttemptsKey] != null)
                    {
                        failedAttempts = (int)Session[FailedLoginAttemptsKey];
                    }

                    if (Session[LastFailedLoginTimeKey] != null)
                    {
                        lastFailedLoginTime = (DateTime)Session[LastFailedLoginTimeKey];
                    }

                    if (DateTime.Now - lastFailedLoginTime > TimeSpan.FromSeconds(30))
                    {
                        // Reset failed attempts counter if it has been more than 30 seconds since the last failed attempt
                        failedAttempts = 0;
                    }

                    // Login the user
                    Login u = db.Logins.SingleOrDefault(x => x.Username == username && x.Hash == hash);

                    if (u != null)
                    {
                        if (u.Role == "Customer") // record found
                        {
                            try
                            {
                                bool isCust = false;
                                SqlConnection con = new SqlConnection(cs);
                                con.Open();

                                // password hashing
                                // string hashPsw = Security.getHash(loginPass.Text.Trim());

                                string sql = "SELECT * FROM [User] WHERE userName = @UserName AND userPsw = @UserPsw";
                                SqlCommand cmd = new SqlCommand(sql, con);

                                cmd.Parameters.AddWithValue("@UserName", loginUsername.Text.Trim()); //send in parameter
                                cmd.Parameters.AddWithValue("@UserPsw", hash);

                                SqlDataReader dr = cmd.ExecuteReader();

                                if (dr.HasRows)
                                {
                                    while (dr.Read())
                                    {
                                        isCust = true;
                                        Session["userName"] = dr.GetValue(1).ToString();
                                        Session["userEmail"] = dr.GetValue(2).ToString();
                                        Session["role"] = "customer";
                                        Session["userID"] = dr.GetValue(0).ToString();

                                    }

                                    if (chkRememberMe.Checked)
                                    {
                                        string token = GenerateToken();
                                        SetPersistentCookie("RememberMe", token);
                                        SaveTokenToDatabase(Session["userID"].ToString(), token);
                                    }


                                    Security.LoginUser(u.Username, u.Role, rememberMe);
                                }


                                dr.Close();
                                con.Close();
                            }
                            catch (Exception ex)
                            {
                                MsgDialog("ERROR: " + ex.Message + ". ", this.Page, this);
                            }

                            string role = u.Role;
                            if (role.ToLower() != "customer")
                            {
                                cvNotMatched.IsValid = false;
                            }

                        }
                        else if (u.Role == "Admin")
                        {
                            try
                            {
                                bool isAdmin = false;
                                SqlConnection con = new SqlConnection(cs);
                                con.Open();

                                // password hashing
                                // string hashPsw = Security.getHash(loginPass.Text.Trim());

                                string sql = "SELECT * FROM [Admin] WHERE adminName = @AdminName AND adminPsw = @AdminPsw";
                                SqlCommand cmd = new SqlCommand(sql, con);

                                cmd.Parameters.AddWithValue("@AdminName", loginUsername.Text.Trim()); //send in parameter
                                cmd.Parameters.AddWithValue("@AdminPsw", hash);

                                SqlDataReader dr = cmd.ExecuteReader();

                                if (dr.HasRows)
                                {
                                    while (dr.Read())
                                    {
                                        isAdmin = true;
                                        Session["adminName"] = dr.GetValue(1).ToString();
                                        Session["adminEmail"] = dr.GetValue(2).ToString();
                                        Session["role"] = "admin";
                                        Session["adminID"] = dr.GetValue(0).ToString();
                                    }

                                    if (chkRememberMe.Checked)
                                    {
                                        string token = GenerateToken();
                                        SetPersistentCookie("RememberMe", token);
                                        SaveTokenToDatabase(Session["adminID"].ToString(), token);
                                    }


                                    Response.Redirect("~/admin/dashboard.aspx");
                                }


                                dr.Close();
                                con.Close();
                            }
                            catch (Exception ex)
                            {
                                MsgDialog("ERROR: " + ex.Message + ". ", this.Page, this);
                            }
                        }
                    }
                    else
                    {
                        // Increment failed login attempts
                        failedAttempts++;
                        Session[FailedLoginAttemptsKey] = failedAttempts;
                        Session[LastFailedLoginTimeKey] = DateTime.Now;

                        // Display error message for wrong username or password
                        cvNotMatched.IsValid = false;

                        // Show alert messages for remaining attempts
                        if (failedAttempts == 1)
                        {
                            loginPass.Text = "";
                            Response.Write("<script>alert('You left 2 attempts for login.');</script>");
                        }
                        else if (failedAttempts == 2)
                        {
                            loginPass.Text = "";
                            Response.Write("<script>alert('You left 1 attempt for login.');</script>");
                        }
                        else if (failedAttempts == 3)
                        {
                            // Clear the password textbox
                            loginPass.Text = "";

                            //// Block login for 10 seconds
                            Response.Write("<script>alert('Your attempts for login have used up. You will be blocked for 10 seconds. Please try again later.');</script>");  // Display error message

                            // Disable the loginPass textbox
                            loginPass.Enabled = false;
                            loginPass.Style["border-color"] = "red";

                            Response.Write("<script>setTimeout(function(){ window.location.reload(); }, 10000);</script>");
                        }
                        else if (failedAttempts == 5)
                        {
                            // Clear the password textbox
                            loginPass.Text = "";

                            //// Block login for 10 seconds
                            Response.Write("<script>alert('Your attempts for login have used up. You will be blocked for 30 seconds. Please try again later.');</script>");  // Display error message

                            // Disable the loginPass textbox
                            loginPass.Enabled = false;
                            loginPass.Style["border-color"] = "red";

                            Response.Write("<script>setTimeout(function(){ window.location.reload(); }, 30000);</script>");
                        }
                    }

                }


            }
            else
            {
                // CAPTCHA validation failed
                ShowErrorMessage("CAPTCHA validation failed. Please verify that you are not a robot.");
            }



        }


        private bool ValidateCaptcha(string response)
        {
            string secretKey = "6LfJpd0pAAAAANOtOZhB10wdNcnaBcrWvi9DPuOl"; // Replace with your reCAPTCHA Secret Key
            string apiUrl = "https://www.google.com/recaptcha/api/siteverify";

            using (WebClient client = new WebClient())
            {
                string result = client.DownloadString($"{apiUrl}?secret={secretKey}&response={response}");

                if (!string.IsNullOrEmpty(result))
                {
                    JObject jObj = JObject.Parse(result);
                    return (bool)jObj.SelectToken("success");
                }

                return false;
            }
        }

        private void ShowErrorMessage(string message)
        {
            lblError.Text = message;
            lblError.Visible = true;
        }


        public void MsgDialog(String ex, Page pg, Object obj)
        {
            Label lblError = pg.FindControl("lblError") as Label;
            if (lblError != null)
            {
                lblError.Text = ex;
            }
        }

        void Page_Error()
        {
            Response.Write("<p><b>Sorry. </b></p>" + "<br/><p style=\"color:red;\">An error occured on this page : "
                + Server.GetLastError().Message + " ! Please verify your information to resolve the issue. </p>");
            Server.ClearError();
        }
    }
}