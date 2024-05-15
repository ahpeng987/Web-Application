using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.aspx
{
    public partial class Order : System.Web.UI.Page
    {

        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // put session here
                if (Session["userID"] == null)
                {
                    // redirect to login page
                    Response.Redirect("~/aspx/login.aspx");
                }
                else // not null
                {
                    int userID = int.Parse(Session["userID"].ToString());

                    DataTable ordersTable = GetOrdersByUserID(userID); // Retrieve orders based on user ID

                    PopulateOrders(ordersTable); // Populate orders in the placeholder

                }

            }


        }

        private DataTable GetOrdersByUserID(int userID)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                string query = @"
            SELECT o.orderID, o.orderDate, o.totalAmt, d.deliveryStatus
            FROM [Order] o
            INNER JOIN [Payment] p ON o.paymentID = p.paymentID
            LEFT JOIN [Delivery] d ON o.orderID = d.orderID
            WHERE p.userID = @userID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userID", userID);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        private void PopulateOrders(DataTable ordersTable)
        {
            ordersPlaceholder.Controls.Clear(); // Clear existing content
            if (ordersTable != null && ordersTable.Rows.Count > 0)
            {
                foreach (DataRow row in ordersTable.Rows)
                {
                    int orderID = Convert.ToInt32(row["orderID"]);
                    DateTime orderDate = Convert.ToDateTime(row["orderDate"]);
                    decimal totalAmount = Convert.ToDecimal(row["totalAmt"]);
                    string deliveryStatus = row["deliveryStatus"] != DBNull.Value ? row["deliveryStatus"].ToString() : "Pending";

                    TableRow tr = new TableRow();

                    // Add order details to the table cells
                    TableCell cellNumber = new TableCell();
                    cellNumber.Text = (ordersTable.Rows.IndexOf(row) + 1).ToString();
                    tr.Cells.Add(cellNumber);

                    TableCell cellOrderID = new TableCell();
                    cellOrderID.Text = orderID.ToString();
                    tr.Cells.Add(cellOrderID);

                    TableCell cellOrderDate = new TableCell();
                    cellOrderDate.Text = orderDate.ToString("dd/MM/yyyy");
                    tr.Cells.Add(cellOrderDate);

                    TableCell cellTotalAmount = new TableCell();
                    cellTotalAmount.Text = totalAmount.ToString("0.00");
                    tr.Cells.Add(cellTotalAmount);

                    TableCell cellDeliveryStatus = new TableCell();
                    cellDeliveryStatus.Text = deliveryStatus;
                    tr.Cells.Add(cellDeliveryStatus);


                    // Add action buttons
                    TableCell cellActions = new TableCell();

                    Button viewDetailsButton = new Button();
                    viewDetailsButton.Text = "View Details";
                    viewDetailsButton.CssClass = "btn btn-primary";

                    // Set the CommandName and CommandArgument properties for postback handling
                    viewDetailsButton.CommandName = "ViewDetails";
                    viewDetailsButton.CommandArgument = orderID.ToString();

                    // Specify the target URL for the postback using the PostBackUrl property
                    viewDetailsButton.PostBackUrl = $"orderDetails.aspx?orderID={orderID}";

                    cellActions.Controls.Add(viewDetailsButton);

                    // Cancel Order Button
                    Button cancelOrderButton = new Button();
                    cancelOrderButton.Text = "Cancel Order";
                    cancelOrderButton.CssClass = "btn btn-danger";
                    cancelOrderButton.OnClientClick = $"showCancelModal({orderID}); return false;";
                    cellActions.Controls.Add(cancelOrderButton);

                    // Add cellActions to the table row (tr)
                    tr.Cells.Add(cellActions);

                    // Add the table row (tr) to the ordersPlaceholder
                    ordersPlaceholder.Controls.Add(tr);
                }
            }
            else
            {
                // No orders found for the user
                TableRow tr = new TableRow();
                TableCell cellNoOrders = new TableCell();
                cellNoOrders.Text = "No orders found.";
                cellNoOrders.ColumnSpan = 5;
                tr.Cells.Add(cellNoOrders);
                ordersPlaceholder.Controls.Add(tr);
            }
        }


        protected void btnSubmitCancellation_Click(object sender, EventArgs e)
        {
            // Retrieve the order ID from the hidden field
            int orderID = 0;
            if (int.TryParse(orderIDHidden.Value, out orderID))
            {
                // Find the cancelReason textarea control
                TextBox cancelReason = (TextBox)Page.FindControl("cancelReason");

                if (cancelReason != null)
                {
                    string reason = cancelReason.Text;

                    // Save cancellation request details into the database
                    SubmitCancellationRequest(orderID, reason);

                    // Display a success message
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Cancellation request submitted successfully!');", true);

                    // Optionally, hide the modal or perform other actions
                    ScriptManager.RegisterStartupScript(this, GetType(), "hideModal", "$('#cancelOrderModal').modal('hide');", true);
                }
                else
                {
                    // If cancelReason is null, show an error message
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error: Cancellation reason not found.');", true);
                }
            }
            else
            {
                // If orderIDHidden.Value is not a valid integer, show an error message
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Error: Invalid order ID.');", true);
            }
        }


        [System.Web.Services.WebMethod]
        public static void SubmitCancellationRequest(int orderID, string reason)
{
    string cs = Global.CS;
    using (SqlConnection con = new SqlConnection(cs))
    {
        con.Open();

        // Retrieve user email based on userID from session
        int userID = Convert.ToInt32(HttpContext.Current.Session["userID"]);
        string userEmail = GetUserEmail(userID, con);

        // Insert cancellation request into the database
        string query = @"INSERT INTO CancellationRequests (OrderID, RequestDate, RequesterEmail, Reason, Status)
                         VALUES (@OrderID, GETDATE(), @RequesterEmail, @Reason, 'Pending')";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@OrderID", orderID);
        cmd.Parameters.AddWithValue("@RequesterEmail", userEmail);
        cmd.Parameters.AddWithValue("@Reason", reason);
        cmd.ExecuteNonQuery();
    }
}

        // Helper method to retrieve user email by userID
        private static string GetUserEmail(int userID, SqlConnection con)
        {
            string query = "SELECT userEmail FROM [User] WHERE userID = @userID";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@userID", userID);
            object result = cmd.ExecuteScalar();
            if (result != null)
            {
                return result.ToString();
            }
            return string.Empty;
        }



    }
}
