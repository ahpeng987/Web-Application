using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using System.Web.UI.WebControls;
using QRCoder;

namespace WebApplication1.aspx
{
    public partial class orderDetails : System.Web.UI.Page
    {
        private string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is authenticated (logged in)
                if (Session["userID"] == null)
                {
                    // Redirect to login page if user is not authenticated
                    Response.Redirect("~/aspx/login.aspx");
                }
                else
                {
                    // Get the user ID from session
                    int userID = Convert.ToInt32(Session["userID"]);

                    // Check if the 'orderID' query string parameter is present and valid
                    if (!string.IsNullOrEmpty(Request.QueryString["orderID"]) && int.TryParse(Request.QueryString["orderID"], out int orderID))
                    {
                        // 'orderID' is successfully parsed as an integer
                        PopulateOrderDetails(orderID);


                        // Generate QR code for this order ID
                        GenerateQRCode(orderID);



                    }
                    else
                    {
                        // Invalid or missing 'orderID' in query string
                        Response.Write("Invalid order ID specified.");
                    }
                }
            }
        }

        protected void btnConfirmPayment_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

                // Establish connection
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Open the connection
                    con.Open();

                    // Query to retrieve the latest payment made
                    string query = @"
                SELECT TOP 1 P.prodName, PM.userID, PM.paymentID
                FROM OrderItem OI
                INNER JOIN [Order] O ON OI.orderID = O.orderID
                INNER JOIN Payment PM ON O.paymentID = PM.paymentID
                INNER JOIN Product P ON OI.prodID = P.prodID
                ORDER BY O.orderDate DESC";

                    // Create a command
                    SqlCommand cmd = new SqlCommand(query, con);

                    // Execute the query
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        // Retrieve values from the reader
                        string productName = reader["prodName"].ToString();
                        string userID = reader["userID"].ToString();
                        string paymentID = reader["paymentID"].ToString();

                        // Store the values in session
                        Session["productName"] = productName;
                        Session["userID"] = userID;
                        Session["paymentID"] = paymentID;

                        // Redirect the user to the feedback page with parameters
                        Response.Redirect("feedback.aspx");
                        Response.End();
                    }
                    else
                    {
                        // No payment found
                        // Handle accordingly
                    }

                    // Close the reader
                    reader.Close();
                }
            }
            catch (Exception ex)
            {

            }
        }

        private void PopulateOrderDetails(int orderID)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"
                SELECT o.orderDate, o.orderID AS orderNumber, oi.prodID, oi.orderQty, p.prodName, p.prodColor, oi.unitPrice, pm.amount AS paymentAmount
                FROM [Order] o
                INNER JOIN OrderItem oi ON o.orderID = oi.orderID
                INNER JOIN Product p ON oi.prodID = p.prodID
                INNER JOIN Payment pm ON o.paymentID = pm.paymentID
                WHERE o.orderID = @OrderID";

                    SqlCommand command = new SqlCommand(query, con);
                    command.Parameters.AddWithValue("@OrderID", orderID);

                    con.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    System.Text.StringBuilder orderItemsHtml = new System.Text.StringBuilder();

                    while (reader.Read())
                    {
                        // Retrieve item details for each row
                        string prodName = reader["prodName"].ToString();
                        string prodColor = reader["prodColor"].ToString();
                        int orderQty = Convert.ToInt32(reader["orderQty"]);
                        decimal unitPrice = Convert.ToDecimal(reader["unitPrice"]);

                        // Append HTML markup for each item
                        orderItemsHtml.Append($@"
                    <div class='row mb-3'>
                        <div class='col-md-8'>
                            <p><strong>{prodName}</strong> - {prodColor}</p>
                            <p>Quantity: {orderQty}</p>
                        </div>
                        <div class='col-md-4'>
                            <p class='text-end'>{unitPrice:C}</p>
                        </div>
                    </div>");
                    }

                    // Set generated HTML content to the Literal control
                    litOrderItems.Text = orderItemsHtml.ToString();


                    // Read other details (e.g., order date, order number, total amount) from the first row
                    if (reader.HasRows)
                    {


                        // Calculate total amount based on all items (assuming fixed shipping cost)
                        decimal shippingCost = 10.00m;
                        decimal totalAmount = (decimal)reader["paymentAmount"]; // Assuming payment amount includes shipping
                        lblTotalAmount.Text = totalAmount.ToString("C");
                    }
                    else
                    {
                        // No data found for the specified orderID
                        Response.Write("Order details not found.");
                    }

                    reader.Close();
                }
            }
            catch (Exception ex)
            {
                // Handle database exception
                Response.Write("Error retrieving order details: " + ex.Message);
            }
        }

        private void GenerateQRCode(int orderID)
        {
            try
            {
                string url = $"{Request.Url.GetLeftPart(UriPartial.Authority)}/aspx/downloadPDF.aspx?orderID={orderID}";

                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode(url, QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);

                // Generate QR code image
                using (MemoryStream stream = new MemoryStream())
                {
                    qrCode.GetGraphic(10).Save(stream, System.Drawing.Imaging.ImageFormat.Png);

                    // Convert to base64 string to display in <img> tag
                    string base64Image = Convert.ToBase64String(stream.ToArray());
                    imgQRCode.Src = $"data:image/png;base64,{base64Image}";
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error generating QR code: {ex.Message}");
            }
        }

        protected void btnTrackOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Order.aspx");
        }
    }
}