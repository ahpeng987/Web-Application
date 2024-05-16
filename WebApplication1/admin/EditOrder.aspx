<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditOrder.aspx.cs" Inherits="WebApplication1.admin.EditOrder" %>

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
                        </li>
                        <li class="inactive">
                            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="#"><span class="mini-click-non">Management     </span><i class="fa fa-angle-down"></i></asp:HyperLink>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li>
                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/admin/ProductAdmin.aspx"><span class="mini-click-non">Product Management</span></asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/admin/PromotionAdmin.aspx"><span class="mini-click-non">Promotion Management</span></asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/admin/AdminFeedBack.aspx"><span class="mini-click-non">Feedback Management</span></asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/admin/Delivery.aspx"><span class="mini-click-non">Delivery Management</span></asp:HyperLink></li>
                                <li>
                                    <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/admin/OrderAdmin.aspx"><span class="mini-click-non">Order Management</span></asp:HyperLink></li>
                            </ul>
                        </li>
                        <li class="inactive">
                            <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="#"><span class="mini-click-non">Report     </span><i class="fa fa-angle-down"></i></asp:HyperLink>
                            <ul class="submenu-angle" aria-expanded="false">
                                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/admin/productReport.aspx"><span class="mini-click-non">Product Report</span></asp:HyperLink>
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/admin/feedbackReport.aspx"><span class="mini-click-non">Feedback Report</span></asp:HyperLink>
                                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/admin/PaymentReport.aspx"><span class="mini-click-non">Payment Report</span></asp:HyperLink>
                                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/admin/paymentMethodReport.aspx"><span class="mini-click-non">Payment Method Report</span></asp:HyperLink>
                            </ul>
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

        <!-- Main content area -->
        <div class="single-product-tab-area mg-b-30">
            <!-- Single pro tab review Start-->
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2 style="color: white;">Edit Order</h2>
                            <div class="form-group">
                                <label for="txtOrderDate" style="color: white;">Order Date:</label>
                                <asp:TextBox ID="txtOrderDate" runat="server" CssClass="form-control" ReadOnly="true" Style="background-color: transparent;"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="txtTotalAmount" style="color: white;">Total Amount:</label>
                                <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:HiddenField ID="hdnOrderID" runat="server" />
                            <asp:Button ID="btnUpdate" runat="server" Text="Update Order" OnClick="btnUpdate_Click" OnClientClick="return confirm('Confirm Edit?');" CssClass="btn btn-primary" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- jquery
	============================================ -->
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <!-- bootstrap JS
	============================================ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- wow JS
	============================================ -->
        <script src="js/wow.min.js"></script>
        <!-- price-slider JS
	============================================ -->
        <script src="js/jquery-price-slider.js"></script>
        <!-- meanmenu JS
	============================================ -->
        <script src="js/jquery.meanmenu.js"></script>
        <!-- owl.carousel JS
	============================================ -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- sticky JS
	============================================ -->
        <script src="js/jquery.sticky.js"></script>
        <!-- scrollUp JS
	============================================ -->
        <script src="js/jquery.scrollUp.min.js"></script>
        <!-- mCustomScrollbar JS
	============================================ -->
        <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/scrollbar/mCustomScrollbar-active.js"></script>
        <!-- metisMenu JS
	============================================ -->
        <script src="js/metisMenu/metisMenu.min.js"></script>
        <script src="js/metisMenu/metisMenu-active.js"></script>
        <!-- morrisjs JS
	============================================ -->
        <script src="js/sparkline/jquery.sparkline.min.js"></script>
        <script src="js/sparkline/jquery.charts-sparkline.js"></script>
        <!-- calendar JS
	============================================ -->
        <script src="js/calendar/moment.min.js"></script>
        <script src="js/calendar/fullcalendar.min.js"></script>
        <script src="js/calendar/fullcalendar-active.js"></script>
        <!-- plugins JS
	============================================ -->
        <script src="js/plugins.js"></script>
        <!-- main JS
	============================================ -->
        <script src="js/main.js"></script>
    </div>
</asp:Content>
