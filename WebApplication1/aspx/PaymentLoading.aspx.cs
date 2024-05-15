using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.aspx;
using static WebApplication1.aspx.product;

namespace WebApplication1.aspx
{
    public partial class PaymentLoading : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if session variables are present
                if (Session["totalAmount"] != null && Session["cartItems"] != null && Session["userAddress"] != null)
                {
                    string totalAmountFormatted = Session["totalAmount"].ToString();
                    List<CartItem> cartItems = (List<CartItem>)Session["cartItems"];
                    Address userAddress = (Address)Session["userAddress"];

                    int paymentID = (int)Session["paymentID"];

                    if (paymentID > 0)
                    {
                        int orderID = createOrder(totalAmountFormatted, paymentID); // Create order and get order ID

                        if (orderID > 0)
                        {
                            // Save order items
                            foreach (CartItem item in cartItems)
                            {
                                int productID = int.Parse(item.ProdID);
                                addOrderItem(orderID, productID, item.Qty, item.Price);
                            }

                            // Save delivery information
                            addDelivery(orderID, userAddress);

                            // Clear session variables after successful processing
                            Session.Remove("totalAmount");
                            Session.Remove("cartItems");
                            Session.Remove("userAddress");


                            hiddenOrderID.Value = orderID.ToString();

                        }
                        else
                        {
                            // Handle order creation failure
                            // Display an error message or redirect to an error page
                        }
                    }
                    else
                    {
                        // Handle payment record creation failure
                        // Display an error message or redirect to an error page
                    }
                }
                else
                {
                    // Handle missing or invalid session variables
                    // Redirect to an error page or display an error message
                }
            }
        }

        private int createOrder(string orderAmount, int paymentID)
        {
            DateTime currentDT = DateTime.Now;

            string sql = "INSERT INTO [dbo].[Order] (orderDate, totalAmt, paymentID) VALUES (@orderDate, @totalAmount, @paymentID); SELECT CAST(scope_identity() AS int);";

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@orderDate", currentDT);
                cmd.Parameters.AddWithValue("@totalAmount", orderAmount);
                cmd.Parameters.AddWithValue("@paymentID", paymentID);
                int orderID = (int)cmd.ExecuteScalar();

                return orderID;
            }
        }

        private void addOrderItem(int orderID, int productID, int quantity, float unitPrice)
        {
            string sql = "INSERT INTO [dbo].[OrderItem] (orderID, prodID, orderQty, unitPrice) VALUES (@orderID, @productID, @quantity, @unitPrice);";

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@orderID", orderID);
                cmd.Parameters.AddWithValue("@productID", productID);
                cmd.Parameters.AddWithValue("@quantity", quantity);
                cmd.Parameters.AddWithValue("@unitPrice", unitPrice);
                cmd.ExecuteNonQuery();
            }
        }

        private void addDelivery(int orderID, Address userAddress)
        {
            string deliveryStatus = "Pending"; // You can set initial status here
            DateTime deliveryDate = DateTime.Now;
            string courierType = "Standard"; // Example: Standard delivery type

            string sql = "INSERT INTO Delivery (orderID, deliveryAddress, deliveryStatus, courierType) " +
                         "VALUES (@orderID, @deliveryAddress, @deliveryStatus, @courierType)";

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@orderID", orderID);
                cmd.Parameters.AddWithValue("@deliveryAddress", FormatDeliveryAddress(userAddress));
                cmd.Parameters.AddWithValue("@deliveryStatus", deliveryStatus);
                cmd.Parameters.AddWithValue("@courierType", courierType);
                cmd.ExecuteNonQuery();
            }
        }

        private string FormatDeliveryAddress(Address address)
        {
            return $"{address.StreetAddress1}, {address.StreetAddress2}, {address.City}, {address.State}, {address.Postcode}, {address.Country}";
        }

    }
}