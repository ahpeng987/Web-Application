<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="WebApplication1.aspx.cart"  ViewStateMode="Enabled" EnableEventValidation="false"%>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="index.aspx">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <div class="container-fluid pt-5">
        <div class="card border-secondary mb-5">
            <asp:GridView ID="gvCart" runat="server" CssClass="table table-bordered text-center mb-0" AutoGenerateColumns="False" OnRowDataBound="gvCart_ItemDataBound">
                <Columns>
                    <asp:ImageField DataImageUrlField="ProdImg" HeaderText="Product" ControlStyle-Width="100px">
                    </asp:ImageField>
                    <asp:BoundField DataField="ProdName" HeaderText="Name" ControlStyle-Width="10px"></asp:BoundField>

                    <asp:BoundField DataField="Price" HeaderText="Price" ItemStyle-CssClass="price-field"
                        DataFormatString="{0:C2}" ControlStyle-Width="10px">
                        <ItemStyle CssClass="price-field"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" runat="server" Type="number" min="1" max="10" CssClass="quantity-field"
                                onchange="if(parseInt(this.value) > 10) { this.value = '10'; } updateSubtotal(this); updateSubAmount(); updateTotal();" AutoPostBack="false" onkeypress="return (event.keyCode != 13);"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Sub Total" DataField="SubPrice" DataFormatString="{0:C}"
                        ItemStyle-CssClass="sub-price" ControlStyle-Width="10px">
                        <ItemStyle CssClass="sub-price"></ItemStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Remove">
                        <ItemTemplate>
                            <asp:Button ID="btnRemoveItem" runat="server" Text="Remove" CommandArgument="Delete" CssClass="btn btn-sm btn-primary" OnClick="btnRemoveItem_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="bg-secondary text-dark" />

            </asp:GridView>
            <table class="table table-bordered text-center mb-0">
                <tbody class="align-middle">

                    <tr>
                        <td>
                            <asp:Label ID="lblEmptyCartMessage" runat="server" Text="Your cart is empty." Visible="False"
                                Style="position: absolute; left: 50%; transform: translate(-50%, -50%);"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%--<div class="col-lg-3">--%>
        <div class="card border-secondary mb-5">
            <div class="card-header bg-secondary border-0">
                <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
            </div>
            <div class="card-body">
                <div class="d-flex justify-content-between mb-3 pt-1">
                    <h6 class="font-weight-medium">Subtotal</h6>
                    <h6 class="font-weight-medium">
                        <asp:Label ID="lblSubTotalAmount" runat="server" Text="Total: RM 0.00" Visible="false" CssClass="font-weight-medium"></asp:Label>
                    </h6>
                </div>
                <div class="d-flex justify-content-between">
                    <h6 class="font-weight-medium">Shipping</h6>
                    <h6 class="font-weight-medium">
                        <asp:Label ID="lblShipping" runat="server" Text="Total: RM 10.00" Visible="false" CssClass="font-weight-medium"></asp:Label>

                    </h6>
                </div>
            </div>
            <div class="card-footer border-secondary bg-transparent">
                <div class="d-flex justify-content-between mt-2">
                    <h5 class="font-weight-bold">Total</h5>
                    <h5 class="font-weight-bold">
                        <asp:Label ID="lblTotalAmount" runat="server" Text="Total: RM 0.00" Visible="false" CssClass="font-weight-medium"></asp:Label>

                    </h5>
                </div>
                <asp:Button ID="checkOutBtn" runat="server" CssClass="btn btn-block btn-primary my-3 py-3" Text="Proceed To Checkout" OnClick="CheckoutBtn_Click" />

            </div>
        </div>
        <%--</div>--%>
    </div>

    <script type="text/javascript">
        function updateSubtotal(txtQuantity) {
            var row = txtQuantity.parentNode.parentNode;
            var price = row.getElementsByClassName('price-field')[0].textContent.replace(/[^0-9.-]+/g, '');
            var subtotal = parseFloat(price) * parseInt(txtQuantity.value);
            row.getElementsByClassName('sub-price')[0].textContent = 'RM ' + subtotal.toFixed(2);
        }

        function updateSubAmount() {
            var subtotalFields = document.getElementsByClassName('sub-price');
            var total = 0;
            for (var i = 0; i < subtotalFields.length; i++) {
                total += parseFloat(subtotalFields[i].textContent.replace(/[^0-9.-]+/g, ''));
            }
            var lblSubTotalAmount = document.getElementById('<%= lblSubTotalAmount.ClientID %>');
            lblSubTotalAmount.textContent = 'RM ' + total.toFixed(2);
        }

        function updateTotal() {
            var lblSubTotalAmount = document.getElementById('<%= lblSubTotalAmount.ClientID %>');
            var lblShipping = document.getElementById('<%= lblShipping.ClientID %>');
            var lblTotalAmount = document.getElementById('<%= lblTotalAmount.ClientID %>');

            var subTotal = parseFloat(lblSubTotalAmount.textContent.replace(/[^0-9.-]+/g, ''));
            var shipping = parseFloat(lblShipping.textContent.replace(/[^0-9.-]+/g, ''));

            var total = subTotal + shipping;

            lblTotalAmount.textContent = 'Total: RM ' + total.toFixed(2);
        }

        window.onload = function () {
            var txtQuantities = document.querySelectorAll('.quantity-field');
            txtQuantities.forEach(function (txtQuantity) {
                updateSubtotal(txtQuantity);
            });

            updateSubAmount();
            updateTotal();
        };

    </script>
</asp:Content>
