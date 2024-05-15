<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="WebApplication1.aspx.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/payment.css" rel="stylesheet" />
    <section class="checkout">
        <div class="container pe-5 ps-5">
            <div class="row">
                <div class="col-md-12 col-md-12">
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    <!-- delivery details -->
                    <div class="billingForm mt-4">
                        <h4>Delivery Details</h4>
                        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
                    </div>
                    <div class="form-row">
                        <div class="delivery-container">
                            <h5>Address</h5>

                            <div class="checkout__input col-md-12 form-group">
                                <asp:Label ID="lbAddress1" runat="server" Text="Address Line 1"></asp:Label>
                                <asp:TextBox ID="tbAddress1" runat="server" CssClass="mt-2" MaxLength="100"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvAdd1" runat="server" ErrorMessage="*Required Field" ControlToValidate="tbAddress1" ForeColor="Red"></asp:RequiredFieldValidator>

                            </div>
                            <div class="checkout__input col-md-12 form-group">
                                <asp:Label ID="lbAddress2" runat="server" Text="Address Line 2"></asp:Label>
                                <asp:TextBox ID="tbAddress2" runat="server" CssClass="mt-2" MaxLength="100"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvAdd2" runat="server" ErrorMessage="*Required Field" ControlToValidate="tbAddress2" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row1 justify-content-between">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <asp:Label ID="lbPostcode" runat="server" Text="Postcode"></asp:Label>
                                        <asp:TextBox ID="tbPostcode" runat="server" CssClass="mt-2" MaxLength="6"></asp:TextBox>
                                        <span >
                                            <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="*Required Field" ControlToValidate="tbPostcode" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revPostCode" runat="server" ErrorMessage="Please enter valid post code" ControlToValidate="tbPostcode" ValidationExpression="^[0-9]{6}$" ForeColor="Red"></asp:RegularExpressionValidator>
                                        </span>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <asp:Label ID="lbCity" runat="server" Text="City"></asp:Label>
                                        <asp:TextBox ID="tbCity" runat="server" CssClass="mt-2" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="*Required Field" ControlToValidate="tbCity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revCity" runat="server" ErrorMessage="City should consists only alphabetical value." ValidationExpression="^[A-Za-z\s]+$" ControlToValidate="tbCity" ForeColor="Red"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="row1 justify-content-between">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <asp:Label ID="lbState" runat="server" Text="State"></asp:Label><br />
                                        <asp:TextBox ID="tbState" runat="server" CssClass="mt-2" ReadOnly="true">Penang</asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <asp:Label ID="lbCountry" runat="server" Text="Country"></asp:Label>
                                        <asp:TextBox ID="tbCountry" runat="server" CssClass="mt-2" ReadOnly="true">Malaysia</asp:TextBox>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <!-- select payment methods -->
            <div class="billingForm mt-5">
                <h4>Billing Details</h4>
            </div>
            <div class="row">
                <div class="col-md-7 col-md-7">
                    <div class="form-row">
                        <div class="col-md-12 form-group rbpayment-list">
                            <asp:Label ID="lbPaymentMethod" runat="server" Text="Payment Methods">Payment Methods</asp:Label>
                            <asp:RadioButtonList ID="rblPaymentMethod" runat="server" CssClass="mt-2 rblpayment-design">
                                <asp:ListItem ID="rbPaypal" Value="payPal" Text="PayPal" Selected="True"></asp:ListItem>
                                <asp:ListItem ID="rbCard" Value="card" Text="Credit / Debit Card"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <!-- change dynamically according to user selection on payment methods -->
                    <!-- credit card div -->
                    <div id="payWithCardDiv" class="form-row" style="display: none">
                        <div class="col-lg-12 checkoutHead">
                            <p>
                                WE ACCEPT <span class="osahan-card font-weight-bold">( Master Card / Visa Card / Rupay )</span>
                            </p>
                        </div>
                        <div class="checkout__input col-md-12 form-group">
                            <asp:Label ID="lbCardNo" runat="server" Text="Card Number"></asp:Label>
                            <asp:TextBox ID="tbCardNo" runat="server" CssClass="mt-2" MaxLength="16"></asp:TextBox>
                            <span style="color:red">
                                <asp:Literal ID="cardNoErr" runat="server"></asp:Literal></span>
                        </div>
                        <div class="checkout__input col-md-6 form-group">
                            <asp:Label ID="lbCardExpiryDate" runat="server" Text="Card Expiry Date">Valid through(MM/YY)</asp:Label>
                            <asp:TextBox ID="tbCardExpiryDate" runat="server" CssClass="mt-2" MaxLength="5"></asp:TextBox>
                            <span style="color:red">
                                <asp:Literal ID="expiryDateErr" runat="server"></asp:Literal></span>

                        </div>
                        <div class="checkout__input col-md-6 form-group">
                            <asp:Label ID="lbCVV" runat="server" Text="CVV">CVV</asp:Label>
                            <asp:TextBox ID="tbCVV" runat="server" CssClass="mt-2" MaxLength="3"></asp:TextBox>
                            <span style="color:red">
                                <asp:Literal ID="cvvErr" runat="server"></asp:Literal></span>

                        </div>
                        <div class="checkout__input col-md-12 form-group">
                            <asp:Label ID="lbNameOnCard" runat="server" Text="Name on card">Name on card</asp:Label>
                            <asp:TextBox ID="tbNameOnCard" runat="server" CssClass="mt-2" MaxLength="60"></asp:TextBox>
                            <span style="color:red">
                                <asp:Literal ID="nameOnCardErr" runat="server"></asp:Literal></span>
                        </div>
                    </div>

                    <!-- paypal div -->
                    <asp:HiddenField ID="errForm" runat="server" Value="yes" />
                    <div id="payWithPayPalDiv">
                        <div class="col-lg-12 checkoutHead">
                            <p>
                                WE WILL REDIRECT YOU TO <span class="osahan-card font-weight-bold">Pay Pal</span>
                            </p>
                            <div class="col" id="paypal-payment-button">
                                <script src="https://www.paypal.com/sdk/js?client-id=AXtdNnBwZ8_zPJAXOIakrpUYlUrrPTeJmyEAFVOQqq7xrrOHbI-QhX51WZU3fMwlI9HoOt5Mtjv6CnEC&disable-funding=credit,card"></script>
                                <asp:HiddenField ID="totalPaymentTotal" runat="server" Value="" />
                                <script>
                                    paypal.Buttons(
                                        {

                                            createOrder: function (data, actions) {
                                                return actions.order.create({
                                                    purchase_units: [{
                                                        amount: {
                                                            currency: 'MYR',
                                                            value: <%= this.totalPaymentTotal.Value %>
                                                        },
                                                    }]
                                                });
                                            },
                                            onApprove: function (data, actions) {
                                                return actions.order.capture().then(function (details) {
                                                    console.log(details)
                                                    alert("You has successfully made payment! Thank you!")
                                                    /*window.location.href = "https://localhost:44359/payment.aspx";*/
                                                    localStorage.setItem('paypalSuccess', 'yes');
                                                    var cancelBtn = $('#<%= cancelBtn.ClientID %>');
                                                    cancelBtn.prop('disabled', true);
                                                    cancelBtn.css('pointer-events', 'none');

                                                    var rbToHide = $('#<%= rblPaymentMethod.ClientID %> input[value="card"]');
                                                    rbToHide.prop('checked', false);
                                                    rbToHide.parent().text("");
                                                    rbToHide.remove();

                                                    var rbToSelected = $('#<%= rblPaymentMethod.ClientID %> input[value="payPal"]');
                                                    rbToSelected.prop('checked', true);

                                                    var submitBtn = $('#<%= payBtn.ClientID %>');
                                                    submitBtn.prop('disabled', false);
                                                })
                                            },
                                            onCancel: function (data) {
                                                localStorage.setItem('paypalSuccess', 'no');
                                                alert("Your payment has cancelled, redirecting to home page.")
                                                window.location.replace("https://localhost:44359/CustomerHome.aspx")
                                            }
                                        }).render('#paypal-payment-button');
                                </script>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Order summary details -->
                <div class="col-lg-5 col-md-5">
                    <div class="checkout__order">
                        <h4>Your Order</h4>
                        <div class="checkout__order__products">Products <span>Total</span></div>
                        <asp:DataList ID="dlItems" CssClass="dlItemsDesign" runat="server" Width="100%">
                            <HeaderTemplate>
                                <ul class="dlItemsList">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li class="dlItemRow">
                                    <div class="d-flex justify-content-between">
                                        <div class="col">
                                            <asp:Label ID="Name" runat="server" Text='<%# Eval("ProdName") %>' />
                                            X 
                                <asp:Label ID="qty" runat="server" Text='<%# Eval("Qty") %>' />
                                        </div>
                                        <div class="col text-right justify-content-end align-content-end text-md-end">
                                            <span class="moneySymbol" style="text-align: right;">RM 
                                                <asp:Label ID="price" runat="server" CssClass="itemPrice" Style="text-align: right;" Text='<%# Eval("Price") %>' />
                                            </span>
                                        </div>
                                    </div>

                                </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                            </FooterTemplate>
                        </asp:DataList>
                        <div class="checkout__order__productTotal">
                            Products total <span>RM
                            <asp:Label ID="subtotal" runat="server" Text=""></asp:Label></span>
                        </div>
                        <!-- delivery fee -->
                        <div class="checkout__order__deliveryFee">
                            Delivery Fee <span>RM
                            <asp:Label ID="totalDeliveryFee" runat="server" Text="10.00"></asp:Label></span>
                        </div>
                        <div class="checkout__order__total">
                            Total <span>RM 
                                <asp:Label ID="totalPayment" runat="server" Text=""></asp:Label></span>
                        </div>
                        <!-- delivery remarks -->
                        <div class="checkout__input form-group">
                            <asp:Label ID="lbDeliveryRemarks" runat="server" Text="Delivery Remarks"></asp:Label>
                            <asp:TextBox ID="tbDeliveryRemarks" runat="server" CssClass="mt-2" OnTextChanged="tbDeliveryRemarks_TextChanged" AutoPostBack="true" ClientMode="Static"></asp:TextBox>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="payBtn" runat="server" CssClass="checkout-btn w-100" Text="PROCEED PAYMENT" OnClick="payBtn_Click" />
                            </div>

                            <div class="col" id="cancelBtnContainer">
                                <asp:Button ID="cancelBtn" runat="server" CssClass="cancel-btn w-100" Text="CANCEL" CausesValidation="false" OnClick="cancelBtn_Click"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("[id*=rblPaymentMethod] input").on("click", function () {
                var submitBtn = $('#<%= payBtn.ClientID %>');
                paymentMethodsSelected = $(this).val();
                if (paymentMethodsSelected == "card") {
                    $('#payWithCardDiv').show(700);
                    $('#payWithPayPalDiv').hide();
                    submitBtn.prop('disabled', false);
                }
                else if (paymentMethodsSelected == "payPal") {
                    $('#payWithCardDiv').hide();
                    $('#payWithPayPalDiv').show(700);
                    submitBtn.prop('disabled', true);
                }
            });

            paymentMethodsSelected = $("[id*=rblPaymentMethod] input:checked").val();
            if (paymentMethodsSelected == "card") {
                $('#payWithCardDiv').show(700);
                $('#payWithPayPalDiv').hide();
                var submitBtn = $('#<%= payBtn.ClientID %>');
                submitBtn.prop('disabled', false);
            }
            else if (paymentMethodsSelected == "payPal") {
                $('#payWithCardDiv').hide();
                $('#payWithPayPalDiv').show(700);
            }

            //alert(errMsg.value);
            var err = '<%= Session["errForm"] %>';
            //alert("got error " + err);
            if (err == "no" || err == null || err == "") {
                localStorage.setItem('paypalSuccess', 'no');
                localStorage.removeItem('paypalSuccess');
            }

            // check whether paypal has success
            var isPayPalSuccess = localStorage.getItem('paypalSuccess');
            var submitBtn = $('#<%= payBtn.ClientID %>');
            //alert(isPayPalSuccess);
            // alert("paypal success1 " + isPayPalSuccess);
            if (isPayPalSuccess == "yes") {
                var cancelBtn = $('#<%= cancelBtn.ClientID %>');
                cancelBtn.prop('disabled', true);
                cancelBtn.css('pointer-events', 'none');

                submitBtn.prop('disabled', false);
                //alert("paypal success2 " + isPayPalSuccess);

                var rbToHide = $('#<%= rblPaymentMethod.ClientID %> input[value="card"]');
                rbToHide.prop('checked', false);
                rbToHide.parent().text("");
                rbToHide.remove();

                var rbToSelected = $('#<%= rblPaymentMethod.ClientID %> input[value="payPal"]');
                rbToSelected.prop('checked', true);
            }
            else {
                paymentMethodsSelected = $("[id*=rblPaymentMethod] input:checked").val();
                var submitBtn = $('#<%= payBtn.ClientID %>');
                if (paymentMethodsSelected == "payPal") {
                    submitBtn.prop('disabled', true);
                }
                else {
                    submitBtn.prop('disabled', false);
                }
            }
        });
    </script>
    <script type="text/javascript">
        var errorMessage = '<%= Session["ErrorMessage"] %>';
        if (errorMessage) {
            alert(errorMessage);
        }
    </script>
    <script>

</script>

</asp:Content>
