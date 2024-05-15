using System;
using static WebApplication1.aspx.product;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace WebApplication1.aspx
{
    public partial class Payment : System.Web.UI.Page
    {
        static string cs = Global.CS;
        static SqlConnection con = new SqlConnection(cs);

        //public class Address
        //{
        //    public string StreetAddress1 { get; set; }
        //    public string StreetAddress2 { get; set; }
        //    public string City { get; set; }
        //    public string Postcode { get; set; }
        //    public string State { get; set; }
        //    public string Country { get; set; }

        //    //public Address(string streetAddress1, string streetAddress2, string city, string postcode, string state, string country)
        //    //{
        //    //    StreetAddress1 = streetAddress1;
        //    //    StreetAddress2 = streetAddress2;
        //    //    City = city;
        //    //    Postcode = postcode;
        //    //    State = state;
        //    //    Country = country;
        //    //}
        //}

        public Address userAddress;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // put session here
                if (Session["userID"] == null)
                {
                    // redirect to login page
                   Response.Write("<script>alert('Oops, seems like you have not login. Please login first.'); window.location.href='login.aspx';</script>");
                }
                else // not null
                {
                    int userID = int.Parse(Session["userID"].ToString());
                    //get session variable
                    string errFormValue = (string)Session["errForm"];

                    // set value of errForm hidden field (YES BY DEFAULT)
                    errForm.Value = errFormValue;

                    List<CartItem> cartItems = (List<CartItem>)Session["cart"];
                    if (cartItems != null && cartItems.Count > 0)
                    {


                        dlItems.DataSource = cartItems;
                        dlItems.DataBind();

                        // calculate subtotal
                        float subtotal = 0;

                        foreach (CartItem item in cartItems)
                        {
                            subtotal += item.Price * item.Qty;
                        }
                        string subtotalString = subtotal.ToString("F2");
                        this.subtotal.Text = subtotalString;

                        // calculate total (added with delivery Fee)
                        float totalPayable = 0;
                        float deliveryFee = float.Parse(totalDeliveryFee.Text);
                        totalPayable = subtotal + deliveryFee;
                        string totalPayableString = totalPayable.ToString("F2");
                        this.totalPayment.Text = totalPayableString;

                        // to be pass into paypal api
                        double exchangeRateMYR = 0.23838;
                        double paymentTotalMYR = (double)totalPayable * exchangeRateMYR;
                        string paymentTotalString = paymentTotalMYR.ToString("F2");
                        this.totalPaymentTotal.Value = paymentTotalString;

                        userAddress = new Address();
                    }
                    else
                    {
                        // redirect to home page
                        Response.Redirect("~/aspx/index.aspx");
                    }
                }

            }
        }

        protected void payBtn_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                if (validatePaymentDetails())
                {
                    try
                    {
                        // payment
                        string totalStr = totalPayment.Text.ToString();
                        float totalAmount = float.Parse(totalStr);
                        string totalAmountFormatted = totalAmount.ToString("0.00");
                        string subtotalStr = subtotal.Text.ToString();
                        float subtotalPrice = float.Parse(subtotalStr);
                        string subtotalFormatted = subtotalPrice.ToString("0.00");

                        // customer
                        if (Session["userID"] != null)
                        {
                            int customerID = int.Parse(Session["userID"].ToString());

                            // add new address
                            userAddress = new Address();
                            userAddress.StreetAddress1 = tbAddress1.Text;
                            userAddress.StreetAddress2 = tbAddress2.Text;
                            userAddress.City = tbCity.Text;
                            userAddress.State = tbState.Text;
                            userAddress.Postcode = tbPostcode.Text;
                            userAddress.Country = tbCountry.Text;

                            //// add payment record
                            string paymentMethod = rblPaymentMethod.SelectedValue.ToString();
                            int paymentID = addPayment(totalAmountFormatted, paymentMethod);

                            List<CartItem> cartItems = (List<CartItem>)Session["cart"];

                            UpdateProductQuantities(cartItems);

                            string emailRemarks = "";
                            foreach (CartItem cartItem in cartItems)
                            {

                                emailRemarks += cartItem.ProdName + " (X " + cartItem.Qty + ") = RM " + cartItem.Price + "\n";

                            }
                            Session["totalAmount"] = totalAmountFormatted; // Store total amount
                            Session["cartItems"] = cartItems; // Store cart items
                            Session["userAddress"] = userAddress;
                            Session["paymentID"] = paymentID;

                            Session.Remove("cart");

                            Session["errForm"] = "no";
                            Response.Redirect("~/aspx/PaymentLoading.aspx");
                        }
                    }
                    catch (SqlException ex)
                    {
                        MsgDialog("ERROR: " + "sql Sorry, an error occurred while processing your request, please try again later" + ex.Message + ". ", this.Page, this);
                        //Response.Redirect("CustomerHome.aspx");
                    }
                    catch (Exception ex)
                    {
                        MsgDialog("ERROR: " + "ex Sorry, an error occurred while processing your request, please try again later" + ex.Message + ". ", this.Page, this);
                        //Response.Redirect("CustomerHome.aspx");
                    }
                }
                else
                {
                    // invalid input
                    Session["errForm"] = "yes";
                }


            }
            else
            {
                MsgDialog("ERROR: " + "isvalid Sorry, an error occurred while processing your request, please try again later" + ". ", this.Page, this);
                //Response.Redirect("CustomerHome.aspx");
            }
        }

        private void UpdateProductQuantities(List<CartItem> cartItems)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                foreach (CartItem item in cartItems)
                {
                    // Update product quantity in the database
                    string sql = "UPDATE Product SET prodQty = prodQty - @qty WHERE prodID = @prodID";

                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@qty", item.Qty);
                    cmd.Parameters.AddWithValue("@prodID", item.ProdID);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void MsgDialog(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }

        public int addPayment(string paymentAmount, string paymentMethod)
        {
            DateTime currentDateTime = DateTime.Now;
            string id = Session["userID"].ToString();
            int userID = Int32.Parse(id);
            string sql = "INSERT INTO Payment (userID, amount, paymentMethod, paymentDate) VALUES (@userID, @amount, @paymentMethod, @paymentDate); SELECT CAST(scope_identity() AS int)";

            // sql connection
            SqlConnection con = new SqlConnection(cs);

            // sql command
            SqlCommand cmd = new SqlCommand(sql, con);

            // supply parameter to the sql
            cmd.Parameters.AddWithValue("@userID", userID);
            cmd.Parameters.AddWithValue("@amount", paymentAmount);
            cmd.Parameters.AddWithValue("@paymentMethod", paymentMethod);
            cmd.Parameters.AddWithValue("@paymentDate", currentDateTime);
            //mopen connection
            con.Open();

            // execute sql
            int paymentID = (int)cmd.ExecuteScalar();

            // close connection
            con.Close();
            return paymentID;
        }

        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/aspx/cart.aspx"); // or shopping cart page
        }

        public bool validatePaymentDetails()
        {
            bool isValid = true;
            string selectedPayment = rblPaymentMethod.SelectedValue;
            if (selectedPayment == "card")
            {
                // name
                string errName = validateNameOnCard(tbNameOnCard.Text);
                if (errName != "")
                {
                    nameOnCardErr.Visible = true;
                    nameOnCardErr.Text = errName;
                    isValid = false;
                }
                else
                {
                    nameOnCardErr.Visible = false;
                    nameOnCardErr.Text = "";

                }

                // card number
                string errCardNo = validateCardNo(tbCardNo.Text);
                if (errCardNo != "")
                {
                    cardNoErr.Visible = true;
                    cardNoErr.Text = errCardNo;
                    isValid = false;
                }
                else
                {
                    cardNoErr.Visible = false;
                    cardNoErr.Text = "";
                }

                // cvv
                string errCVV = validateCVV(tbCVV.Text);
                if (errCVV != "")
                {
                    cvvErr.Visible = true;
                    cvvErr.Text = errCVV;
                    isValid = false;
                }
                else
                {
                    cvvErr.Visible = false;
                    cvvErr.Text = "";
                }

                // expiry date
                string errExpirydate = validateExpiryDate(tbCardExpiryDate.Text);
                if (errExpirydate != "")
                {
                    expiryDateErr.Visible = true;
                    expiryDateErr.Text = errExpirydate;
                    isValid = false;
                }
                else
                {
                    expiryDateErr.Visible = false;
                    expiryDateErr.Text = "";
                }
            }
            return isValid;
        }

        // name as on card
        public string validateNameOnCard(string name)
        {
            string err = "";
            string pattern = @"^[A-Za-z\s]+$";
            bool isMatch = Regex.IsMatch(name, pattern);

            if (name == "")
                err += "Required field.\n";
            else if (!isMatch)
                err += "Name shall only consists of alphabetic data.\n";

            return err;
        }

        // card number
        public string validateCardNo(string cardNo)
        {
            string pattern = @"^[0-9]{16}$";
            bool isMatch = Regex.IsMatch(cardNo, pattern);
            string err = "";

            if (cardNo == "")
                err += "Required field.\n";
            else if (!isMatch)
                err += "Card number shall consists of 16 digits.\n";

            return err;
        }

        // cvv
        public string validateCVV(string cvv)
        {
            string pattern = @"^[0-9]{3}$";
            bool isMatch = Regex.IsMatch(cvv, pattern);
            string err = "";

            if (cvv == "")
                err += "Required field.\n";
            else if (!isMatch)
                err += "CVV shall consists of 3 digits.\n";

            return err;
        }

        // expiry date
        public String validateExpiryDate(string date)
        {
            string pattern = @"^(0[1-9]|1[0-2])\/[0-9]{2}$";
            bool isMatch = Regex.IsMatch(date, pattern);

            string err = "";
            if (date == "")
                err += "Required field.\n";
            else
            {
                if (!isMatch)
                    err += "Please follow the format: (MM/YY).\n";
                else if (validateExpired(date))
                    err += "Please make payment with active card.\n";
            }

            return err;
        }
        public bool validateExpired(string date)
        {
            string expiryDate = date;
            string[] parts = expiryDate.Split('/'); // split the string into month and year parts
            int month = Convert.ToInt32(parts[0]);
            int year = Convert.ToInt32(parts[1]);

            DateTime currentDate = DateTime.Now;
            int currentMonth = currentDate.Month;
            int currentYear = currentDate.Year % 100; // get the last two digits of the year

            bool isExpired = false;

            if (year < currentYear || (year == currentYear && month < currentMonth))
            {
                // the expiry date is in the past (expired)
                isExpired = true;
            }

            return isExpired;
        }

        protected void tbDeliveryRemarks_TextChanged(object sender, EventArgs e)
        {
            ViewState["remarks"] = tbDeliveryRemarks.Text.ToString();
        }


    }
}