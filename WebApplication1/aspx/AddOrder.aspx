<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="WebApplication1.admin.AddOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- LINK -->
    <!-- favicon
	============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
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

    <!-- style CSS
	============================================ -->
    <link rel="stylesheet" href="css/style.css">
    <!-- responsive CSS
	============================================ -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- modernizr JS
	============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <!-- main content --> 
    <div class="left-sidebar-pro">
        <nav id="sidebar" class="">
            <div class="sidebar-header">
                <a href="index.html">
                    <img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                <strong>
                    <img src="img/logo/logosn.png" alt="" /></strong>
            </div>
            <div class="nalika-profile">
                <div class="profile-dtl">
                    <a href="#">
                        <img src="img/notification/4.jpg" alt="" /></a>
                    <h2>Lakian <span class="min-dtn">Das</span></h2>
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
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/admin/feedback.aspx"><span class="mini-click-non">Feedback Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/admin/Delivery.aspx"><span class="mini-click-non">Delivery Management</span></asp:HyperLink>
                            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/admin/OrderAdmin.aspx"><span class="mini-click-non">Order Management</span></asp:HyperLink>
                        </li>

                        <li id="removable">
                            <a class="has-arrow" href="#" aria-expanded="false"><span class="mini-click-non">User management</span></a>
                            <ul class="submenu-angle" aria-expanded="false">
                                <li><a title="Lock" href="lock.html"><span class="mini-sub-pro">Lock</span></a></li>
                                <li><a title="Password Recovery" href="password-recovery.html"><span class="mini-sub-pro">Password Recovery</span></a></li>
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

         <h2 style="color: white;">Add New Order</h2>

        <div class="form-group">
            <label for="ddlProducts" style="color: white;">Select Product:</label>
           <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label for="ddlProducts" style="color: white;">Select User:</label>
        <asp:DropDownList ID="ddlUsers" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
<div class="form-group">
    <label for="txtPaymentMethod" style="color: white;">Payment Method:</label>
    <asp:TextBox ID="txtPaymentMethod" runat="server" CssClass="form-control"></asp:TextBox>
</div>
        <div class="form-group">
            <label for="txtOrderQty" style="color: white;">Order Quantity:</label>
            <asp:TextBox ID="txtOrderQty" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        
        <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" CssClass="btn btn-primary" />
<br /><br />
        <div class="form-group">
            <label for="lblUnitPrice" style="color: white;">Unit Price:</label>
            <asp:Label ID="lblUnitPrice" runat="server" CssClass="form-control"></asp:Label>
        </div>
        <div class="form-group">
            <label for="lblTotalAmt" style="color: white;">Total Amount:</label>
            <asp:Label ID="lblTotalAmt" runat="server" CssClass="form-control"></asp:Label>
        </div>
        <asp:Button ID="btnAddOrder" runat="server" Text="Add Order" OnClick="btnAddOrder_Click" CssClass="btn btn-primary" />
        <br />





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
    <script src="admin/js/jquery.scrollUp.min.js"></script>
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
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</asp:Content>
