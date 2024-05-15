<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WebApplication1.aspx.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/style.min.css" rel="stylesheet" />

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="index.aspx">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Contact</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Contact For Any Queries</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <div id="success"></div>
                    <div class="control-group">

                        <asp:TextBox ID="txtCustName" runat="server" CssClass="form-control" placeholder="Your Name" BorderColor="Black" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCustName" runat="server" ErrorMessage="*Please enter your name" ControlToValidate="txtCustName" ForeColor="Red"></asp:RequiredFieldValidator>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Your Email" BorderColor="Black"  MaxLength="60"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="*Please enter your email" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Subject" BorderColor="Black"  MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="*Please enter subject" ControlToValidate="txtSubject" ForeColor="Red"></asp:RequiredFieldValidator>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <asp:TextBox ID="txtArea" runat="server" CssClass="form-control" placeholder="Please enter your message" TextMode="MultiLine" BorderColor="Black" MaxLength="500"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvArea" runat="server" ErrorMessage="*Please enter subject" ControlToValidate="txtArea" ForeColor="Red"></asp:RequiredFieldValidator>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div>
                        <asp:Button ID="btnSend" runat="server" Text="Send Message" CssClass="btn btn-primary py-2 px-4" OnClick="btnSend_Click"/>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                <h5 class="font-weight-semi-bold mb-3">Get In Touch</h5>
                <p>Please provide some advice and suggestion for us. So that we can do better.</p>
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">Store 1</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>1-9/9A, Plaza Gurney, 170, Gurney Dr, 10250 George Town, Penang</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>customercare@jdsports.my</p>
                    <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>+04-295 7864</p>
                </div>
                <div class="d-flex flex-column">
                    <h5 class="font-weight-semi-bold mb-3">Store 2</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Sunway Carnival Mall 3068, Jalan Todak,Pusat Bandar Seberang Jaya, Seberang Jaya, 13700 Perai, Penang</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>customercare@jdsports.my</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+04-384 2129</p>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->

</asp:Content>
