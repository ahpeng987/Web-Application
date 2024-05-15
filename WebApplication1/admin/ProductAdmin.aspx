<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductAdmin.aspx.cs" Inherits="WebApplication1.admin.ProductAdmin" %>

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
        <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
            <div class="header-top-menu tabl-d-n">

                <div class="breadcome-heading">

                    <asp:TextBox ID="searchProd" runat="server" CssClass="form-control" placeholder="Search by name" ForeColor="WhiteSmoke" BorderColor="WhiteSmoke"></asp:TextBox>
                    <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
                </div>

            </div>
        </div>
        <div class="product-status mg-b-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Product Management</h4>
                            <div class="add-product">
                                <a href="../admin/ProductAdd.aspx">Add Product</a>

                            </div>

                            <table>
                                <tr>
                                    <th>Image</th>
                                    <th>Product Name</th>
                                    <th>
                                        <div style="text-align: center">Color </div>
                                    </th>
                                    <th>
                                        <div style="text-align: center">Size (UK) </div>
                                    </th>
                                    <th>
                                        <div style="text-align: center">Stock Quantity </div>
                                    </th>
                                    <th>
                                        <div style="text-align: center">Price</div>
                                    </th>
                                    <th>
                                        <div style="text-align: center">Category</div>
                                    </th>
                                    <th>
                                        <div style="text-align: center">Modification</div>
                                    </th>
                                </tr>
                                <asp:Repeater ID="rptProduct" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <img class="img-fluid w-100" src="../admin/products/<%# Eval("prodImg1") %>" /><br />
                                            </td>
                                            <td>
                                                <asp:Label ID="lblProdName" runat="server"><%# Eval("prodName") %></asp:Label>
                                            </td>
                                            <td>
                                                <div style="text-align: center">
                                                    <asp:Label ID="lblColor" runat="server"><%# Eval("prodColor") %></asp:Label>
                                                </div>
                                            </td>
                                            <td>
                                                <div style="text-align: center">
                                                    <asp:Label ID="lblSize" runat="server"><%# Eval("prodSize") %></asp:Label>
                                                </div>

                                            </td>
                                            <td>
                                                <div style="text-align: center">
                                                    <asp:Label ID="lblQty" runat="server"><%# Eval("prodQty") %></asp:Label>
                                                </div>
                                            </td>
                                            <td>
                                                <div style="text-align: center">
                                                    RM
                                                    <asp:Label ID="lblPrice" runat="server"><%# Eval("prodPrice", "{0:F2}") %></asp:Label>
                                                </div>
                                            </td>
                                            <td>
                                                <div style="text-align: center">
                                                    <asp:Label ID="lblCat" runat="server"><%# Eval("catName") %></asp:Label>'s Shoes
                                                </div>
                                            </td>

                                            <td>
                                                <%--<button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></button>--%>
                                                <div style="text-align: center">
                                                    <a href='<%# "ProductEdit.aspx?prodID=" + Eval("prodID") %>' data-toggle="tooltip" title="Edit" class="pd-setting-ed">
                                                        <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                                    </a>

                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>


                        </div>
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


