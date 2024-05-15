<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="changeAdminPass.aspx.cs" Inherits="WebApplication1.admin.changeAdminPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- favicon
============================================ -->
    <link rel="shortcut icon" type="admin/image/x-icon" href="admin/img/favicon.ico">
    <!-- Google Fonts
============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
============================================ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Bootstrap CSS
============================================ -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- nalika Icon CSS
============================================ -->
    <link rel="stylesheet" href="css/nalika-icon.css">
    <!-- owl.carousel CSS
============================================ -->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.theme.css">
    <link rel="stylesheet" href="css/owl.transitions.css">
    <!-- animate CSS
============================================ -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- normalize CSS
============================================ -->
    <link rel="stylesheet" href="css/normalize.css">
    <!-- meanmenu icon CSS
============================================ -->
    <link rel="stylesheet" href="css/meanmenu.min.css">
    <!-- main CSS
============================================ -->
    <link rel="stylesheet" href="css/main.css">
    <!-- morrisjs CSS
============================================ -->
    <link rel="stylesheet" href="css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
============================================ -->
    <link rel="stylesheet" href="css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
============================================ -->
    <link rel="stylesheet" href="css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
============================================ -->
    <link rel="stylesheet" href="css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="css/calendar/fullcalendar.print.min.css">
    <!-- style CSS
============================================ -->
    <link rel="stylesheet" href="css/style.css">
    <!-- responsive CSS
============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>

    <!--- main content -->

    <div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="../admin/dashboard.aspx">
                <img class="main-logo" src="img/logo/logo.png" alt="" />
                </asp:HyperLink>
                <strong>
                    <img src="img/logo/logosn.png" alt="" /></strong>
            </div>
            <div class="nalika-profile">
                <div class="profile-dtl">
                    <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="editAdminProfile.aspx" title="Edit Profile">
                    <img src="img/profile.jpg" alt=""/>
                    </asp:HyperLink>
                    <%--<h2>Lakian <span class="min-dtn">Das</span></h2>--%>
                    <br />
                    <asp:Label ID="lblWelcomeMessage" runat="server" Text="<%= adminName %>" Font-Bold="True" Font-Italic="False" Font-Names="Georgia" Font-Size="Larger"></asp:Label>
                </div>
                <div class="profile-social-dtl">
                    <ul class="dtl-social">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="left-custom-menu-adp-wrap comment-scrollbar">
                <nav class="sidebar-nav left-sidebar-menu-pro">
                    <ul class="metismenu" id="menu1">
                        <li class="active">

                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/admin/dashboard.aspx"><span class="mini-click-non">Dashboard</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/admin/ProductAdmin.aspx"><span class="mini-click-non">Product Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/admin/PromotionAdmin.aspx"><span class="mini-click-non">Promotion Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/admin/AdminFeedBack.aspx"><span class="mini-click-non">Feedback Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/admin/Delivery.aspx"><span class="mini-click-non">Delivery Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/admin/OrderAdmin.aspx"><span class="mini-click-non">Order Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/admin/productReport.aspx"><span class="mini-click-non">Product Report</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/admin/feedbackReport.aspx"><span class="mini-click-non">Feedback Report</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/admin/PaymentReport.aspx"><span class="mini-click-non">Payment Report</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/admin/paymentMethodReport.aspx"><span class="mini-click-non">Payment Method Report</span></asp:HyperLink>



                        </li>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>

    <div class="all-content-wrapper">
        <div class="breadcome-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcome-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="breadcomb-wp">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Single pro tab start-->
        <div class="single-product-tab-area mg-b-30">
            <!-- Single pro tab review Start-->
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#description"><i class="fa fa-edit" aria-hidden="true"></i>Change Password</a></li>
                                </ul>

                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="lblPass" runat="server" Text="New Password: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="editAdminPass" type="password" runat="server" CssClass="form-control" placeholder="Enter New Password"></asp:TextBox>
                                                    </div>
                                                    <div>
                                                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Please Fill Up Your [Password] !!" ControlToValidate="editAdminPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revPass" runat="server" ErrorMessage="Please enter [Password] with 6-10 characters (at least 1 upper case &amp;amp, lower case, digit and a special character) !!" ControlToValidate="editAdminPass" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&amp;*()_+.])[A-Za-z\d!@#$%^&amp;*()_+.]{6,10}$"></asp:RegularExpressionValidator>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="editAdminConfirmPass" type="password" runat="server" CssClass="form-control" placeholder="Confirm Password"></asp:TextBox>
                                                    </div>
                                                    <div>
                                                        <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ErrorMessage="Please Fill Up Your [Password] !!" ControlToValidate="editAdminConfirmPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Passwords not match !!" ControlToCompare="editAdminPass" ControlToValidate="editAdminConfirmPass" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:CompareValidator>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="text-center custom-pro-edt-ds">
                                                            <asp:Button ID="changePassBtn" runat="server" Text="Change Password" CssClass="btn btn-ctl-bt waves-effect waves-light m-r-10" Width="200px" OnClick="changePassBtn_Click" />
                                                        </div>
                                                        <br />
                                                        <div class="text-center custom-pro-edt-ds">
                                                            <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="btn btn-ctl-bt waves-effect waves-light m-r-10" Width="200px" CausesValidation="false" OnClick="cancelBtn_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
