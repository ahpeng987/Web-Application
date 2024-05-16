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

namespace WebApplication1.aspx
{
    public partial class resendOTP : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            string activationcode = this.GenerateOTP();
            string useremail = Session["email"].ToString();

            string sql = "UPDATE [User] SET activationCode = @ActivationCode WHERE userEmail = @Email";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter sda = new SqlDataAdapter();

            cmd.Parameters.AddWithValue("@ActivationCode", activationcode);
            cmd.Parameters.AddWithValue("@Email", useremail);
            cmd.Connection = con;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Session["otp"] = activationcode;

            try
            {
                SmtpSection smtpSection = (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");

                string recipientEmail = useremail;

                // SMTP client configuration
                SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                smtp.UseDefaultCredentials = false;
                smtp.EnableSsl = true;
                //smtp.Credentials = new NetworkCredential("jdsport456@gmail.com", "JDsport@!23");
                smtp.Credentials = new NetworkCredential("thedotnetchannelsender22@gmail.com", "lgioehkvchemfkrw");

                // Mail message configuration
                MailMessage mm = new MailMessage();
                mm.From = new MailAddress("thedotnetchannelsender22@gmail.com");
                mm.To.Add(new MailAddress(recipientEmail));
                mm.Subject = "JD Sport: Account Activation";

                string body = "Dear " + Session["userName"].ToString() + ", " +
                              "the following is your OTP code: " + activationcode + ". " +
                              "Thank you.";

                mm.Body = body;

                // Send the email
                smtp.Send(mm);


            }
            catch (SmtpException ex)
            {
                // Handle SMTP exceptions
                Response.Write("SMTP Exception: " + ex.Message);
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Response.Write("Exception: " + ex.Message);
            }
            finally
            {
                Response.Write("<script>alert('Email Validated successfully. Please check your email for OTP.'); window.location.href='checkOTP.aspx';</script>");
            }

            Response.Write("<script>alert('OTP resend successfully !!')</script>");
        }

        protected string GenerateOTP()
        {
            string characters = "1234567890";
            string otp = string.Empty;
            for (int i = 0; i < 5; i++)
            {
                string character = string.Empty;
                do
                {
                    int index = new Random().Next(0, characters.Length);
                    character = characters.ToCharArray()[index].ToString();
                } while (otp.IndexOf(character) != -1);
                otp += character;
            }
            return otp;
        }
    }
}