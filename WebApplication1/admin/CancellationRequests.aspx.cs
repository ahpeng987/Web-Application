using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace WebApplication1.admin
{
    public partial class CancellationRequests : System.Web.UI.Page
    {
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

            LoadCancellationRequests();
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // Register expected control IDs for event validation
            RegisterControlEvents(rptCancellationRequests);
        }

        private void RegisterControlEvents(Repeater repeater)
        {
            foreach (RepeaterItem item in repeater.Items)
            {
                Button btnApprove = item.FindControl("btnApprove") as Button;
                if (btnApprove != null)
                {
                    ScriptManager.GetCurrent(this).RegisterPostBackControl(btnApprove);
                }

                Button btnDecline = item.FindControl("btnDecline") as Button;
                if (btnDecline != null)
                {
                    ScriptManager.GetCurrent(this).RegisterPostBackControl(btnDecline);
                }
            }
        }

        private void LoadCancellationRequests()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT RequestID, OrderID, RequestDate, RequesterEmail, Reason, Status FROM CancellationRequests";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();

                    con.Open();
                    da.Fill(dt);
                    con.Close();

                    rptCancellationRequests.DataSource = dt;
                    rptCancellationRequests.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while retrieving cancellation requests: " + ex.Message);
            }
        }

        protected void HandleCancellationRequest(object sender, EventArgs e)
        {
            // Cast the sender object back to Button to access its properties
            Button button = (Button)sender;

            // Retrieve the command argument which contains the RequestID
            int requestID = Convert.ToInt32(button.CommandArgument);

            // Determine the command name based on the button's ID
            string commandName = button.ID == "btnApprove" ? "Approve" : "Decline";

            // Process the cancellation request based on the command name
            switch (commandName)
            {
                case "Approve":
                    if (UpdateCancellationRequestStatus(requestID, "Approved"))
                    {
                        // Get the OrderID associated with the request
                        int orderId = GetOrderIDFromRequest(requestID);

                        if (orderId > 0)
                        {
                            // Attempt to delete the order and its associated items
                            if (DeleteOrder(orderId))
                            {
                                // Handle approval success and order deletion
                                Response.Write("Cancellation request approved and order deleted.");
                            }
                            else
                            {
                                // Handle order deletion failure
                                Response.Write("Failed to delete order after approving cancellation request.");
                            }
                        }
                        else
                        {
                            // Handle invalid or missing OrderID
                            Response.Write("Failed to retrieve OrderID associated with the cancellation request.");
                        }
                    }
                    else
                    {
                        // Handle approval failure
                        Response.Write("Failed to approve cancellation request.");
                    }
                    break;
                case "Decline":
                    if (UpdateCancellationRequestStatus(requestID, "Declined"))
                    {
                        // Send cancellation denial email
                        if (SendCancellationDenialEmail(requestID))
                        {
                            Response.Write("Cancellation request declined and denial email sent.");
                        }
                        else
                        {
                            Response.Write("Cancellation request declined, but failed to send denial email.");
                        }

                    }
                    else
                    {
                        // Handle decline failure
                        Response.Write("Failed to decline cancellation request.");
                    }
                    break;
                default:
                    // Handle other command names if needed
                    Response.Write("Invalid command.");
                    break;
            }

            // Reload cancellation requests after processing
            LoadCancellationRequests();
        }

        private bool DeleteOrder(int orderId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    // Begin a transaction
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction();

                    try
                    {
                        // Delete associated OrderItems first
                        string deleteOrderItemsQuery = "DELETE FROM OrderItem WHERE orderID = @OrderID";
                        SqlCommand deleteOrderItemsCmd = new SqlCommand(deleteOrderItemsQuery, con);
                        deleteOrderItemsCmd.Parameters.AddWithValue("@OrderID", orderId);
                        deleteOrderItemsCmd.Transaction = transaction;
                        int orderItemsDeleted = deleteOrderItemsCmd.ExecuteNonQuery();

                        // Delete associated delivery record
                        string deleteDeliveryQuery = "DELETE FROM Delivery WHERE orderID = @OrderID";
                        SqlCommand deleteDeliveryCmd = new SqlCommand(deleteDeliveryQuery, con);
                        deleteDeliveryCmd.Parameters.AddWithValue("@OrderID", orderId);
                        deleteDeliveryCmd.Transaction = transaction;
                        int deliveryDeleted = deleteDeliveryCmd.ExecuteNonQuery();

                        // Proceed to delete the Order if OrderItems and delivery record were successfully deleted
                        if (orderItemsDeleted > 0 && deliveryDeleted > 0)
                        {
                            string deleteOrderQuery = "DELETE FROM [Order] WHERE orderID = @OrderID";
                            SqlCommand deleteOrderCmd = new SqlCommand(deleteOrderQuery, con);
                            deleteOrderCmd.Parameters.AddWithValue("@OrderID", orderId);
                            deleteOrderCmd.Transaction = transaction;
                            int orderDeleted = deleteOrderCmd.ExecuteNonQuery();

                            // Commit the transaction if all deletions are successful
                            transaction.Commit();

                            return orderDeleted > 0;
                        }
                        else
                        {
                            // Rollback the transaction if any deletion fails
                            transaction.Rollback();
                            return false;
                        }
                    }
                    catch (Exception ex)
                    {
                        // Rollback the transaction if any deletion fails
                        transaction.Rollback();
                        Response.Write("An error occurred while deleting order: " + ex.Message);
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while deleting order: " + ex.Message);
                return false;
            }
        }

        private int GetOrderIDFromRequest(int requestID)
        {
            int orderID = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "SELECT OrderID FROM CancellationRequests WHERE RequestID = @RequestID";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@RequestID", requestID);

                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        orderID = Convert.ToInt32(result);
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while retrieving order ID: " + ex.Message);
            }
            return orderID;
        }

        private bool UpdateCancellationRequestStatus(int requestId, string status)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string updateQuery = "UPDATE CancellationRequests SET Status = @Status WHERE RequestID = @RequestID";
                    SqlCommand cmd = new SqlCommand(updateQuery, con);
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@RequestID", requestId);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    con.Close();

                    return rowsAffected > 0;
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while updating cancellation request status: " + ex.Message);
                return false;
            }
        }

        private bool SendCancellationDenialEmail(int requestId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string getEmailQuery = "SELECT RequesterEmail FROM CancellationRequests WHERE RequestID = @RequestID";
                    SqlCommand cmd = new SqlCommand(getEmailQuery, con);
                    cmd.Parameters.AddWithValue("@RequestID", requestId);

                    con.Open();
                    string requesterEmail = cmd.ExecuteScalar()?.ToString();
                    con.Close();

                    if (!string.IsNullOrEmpty(requesterEmail))
                    {
                        string subject = "Cancellation Request Denied";
                        string body = "Your cancellation request has been denied.";
                        SendEmail(requesterEmail, subject, body);
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while sending denial email: " + ex.Message);
                return false;
            }
        }

        private void SendEmail(string recipientEmail, string subject, string body)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress("thedotnetchannelsender22@gmail.com");
                mail.To.Add(new MailAddress(recipientEmail));
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true; // Set this to true if sending HTML content

                using (SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtpClient.EnableSsl = true; // Enable SSL encryption
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential("thedotnetchannelsender22@gmail.com", "lgioehkvchemfkrw");

                    // Send the email
                    smtpClient.Send(mail);
                }

                Response.Write("Email sent successfully.");
            }
            catch (Exception ex)
            {
                Response.Write("An error occurred while sending email: " + ex.Message);
            }
        }


    }
}