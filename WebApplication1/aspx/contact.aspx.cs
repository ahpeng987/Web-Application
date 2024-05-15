using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Configuration;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Newtonsoft.Json.Linq;

namespace WebApplication1.aspx
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Write("<script>alert('Oops, seems like you have not login. Please login first.'); window.location.href='login.aspx';</script>");
            }
            else
            {
                string subject = txtSubject.Text;
                string senderEmail = txtEmail.Text;
                string messageBody = txtArea.Text;

                // Configure SMTP client
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                smtpClient.EnableSsl = true;
                smtpClient.Credentials = new NetworkCredential("thedotnetchannelsender22@gmail.com", "lgioehkvchemfkrw");

                // Create and configure the mail message
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("thedotnetchannelsender22@gmail.com");
                mailMessage.To.Add(new MailAddress("chanboxian1117@gmail.com"));
                mailMessage.Subject = subject;
                mailMessage.Body = $"Email from: {senderEmail}\n\n{messageBody}";

                try
                {
                    // Send the email
                    smtpClient.Send(mailMessage);
                    Response.Write("<script>alert('Email sent successfully!');</script>");
                    txtCustName.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtSubject.Text = string.Empty;
                    txtArea.Text = string.Empty;
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }


        }
    }
}