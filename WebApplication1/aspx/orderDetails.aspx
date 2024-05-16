<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="orderDetails.aspx.cs" Inherits="WebApplication1.aspx.orderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Thank you!</h1>
            <div class="d-inline-flex">
                <p class="m-0">Your order has been placed.</p>
            </div>
        </div>
    </div>
    <section class="h-100 h-custom" style="background-color: #eee;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-8 col-xl-6">
                    <div class="card border-top border-bottom border-3" style="border-color: #6F6F6F !important;">
                        <div class="card-body p-5">
                            <p class="lead fw-bold mb-5 text-center" style="color: #D19C97;">ORDER DETAILS</p>

                            <!-- Display Order Items -->
                            <div>
                                <asp:Literal ID="litOrderItems" runat="server"></asp:Literal>
                            </div>
                            <br />

                            <div class="text-center">
                                 <p class="m-0">Scan QR Code to download your reciept.</p>
                                <img id="imgQRCode" runat="server" style="max-width: 100px; height: auto;" />
                            </div>

                            <!-- Display Total Amount -->
                            <div class="row my-4">
                                <div class="col-md-12">
                                    <p class="lead fw-bold mb-0 text-center" style="color: #D19C97;">
                                        <asp:Label ID="lblTotalAmount" runat="server" CssClass="mb-0"></asp:Label>
                                    </p>
                                </div>
                            </div>

                            <!-- Track Order Button -->
                            <div class="row">
                                <div class="col-lg-6">
                                    <asp:Button ID="btnTrackOrder" runat="server" CssClass="btn btn-block btn-primary my-3 py-3" Text="Back to order" OnClick="btnTrackOrder_Click" />
                                </div>
                                <div class="col-lg-6">
                                    <asp:Button ID="btnConfirmPayment" runat="server" CssClass="btn btn-block btn-primary my-3 py-3" Text="Give a Feedback" OnClick="btnConfirmPayment_Click" />
                                </div>
                            </div>

                            <!-- Contact Us Link -->
                            <p class="mt-4 pt-2 mb-0 text-center">Want any help? <a href="#!" style="color: #D19C97;">Please contact us</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
