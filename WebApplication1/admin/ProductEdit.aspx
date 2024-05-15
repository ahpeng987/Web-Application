﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductEdit.aspx.cs" Inherits="WebApplication1.admin.ProductEdit" %>

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
                                    <li class="active"><a href="#description"><i class="fa fa-edit" aria-hidden="true"></i>Edit Product</a></li>

                                </ul>

                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <%-- Product Image --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <%-- Product Image 1 --%>
                                                        <asp:Image ID="Image1" runat="server" />
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                            <asp:FileUpload ID="fupProd1" runat="server" ForeColor="White" CssClass="form-control" />
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <asp:RegularExpressionValidator ID="revProd1" runat="server" ControlToValidate="fupProd1" CssClass="" Display="Dynamic" ErrorMessage="Only JPG and PNG are allowed for [Photo]" ValidationExpression=".+\.(png|jpg)" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <%-- Product Image 2 --%>
                                                        <asp:Image ID="Image2" runat="server" />
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                            <asp:FileUpload ID="fupProd2" runat="server" ForeColor="White" CssClass="form-control" />
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <asp:RegularExpressionValidator ID="revProd2" runat="server" ControlToValidate="fupProd2" CssClass="" Display="Dynamic" ErrorMessage="Only JPG and PNG are allowed for [Photo]" ValidationExpression=".+\.(png|jpg)" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-content-section">
                                                    <div class="input-group mg-b-pro-edt">
                                                        <%-- Product Image 3 --%>
                                                        <asp:Image ID="Image3" runat="server" />
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                            <asp:FileUpload ID="fupProd3" runat="server" ForeColor="White" CssClass="form-control" />
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <asp:RegularExpressionValidator ID="revProd3" runat="server" ControlToValidate="fupProd3" CssClass="" Display="Dynamic" ErrorMessage="Only JPG and PNG are allowed for [Photo]" ValidationExpression=".+\.(png|jpg)" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <%-- Product Image 4  --%>
                                                        <asp:Image ID="Image4" runat="server" />
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                            <asp:FileUpload ID="fupProd4" runat="server" ForeColor="White" CssClass="form-control" />
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <asp:RegularExpressionValidator ID="revProd4" runat="server" ControlToValidate="fupProd4" CssClass="" Display="Dynamic" ErrorMessage="Only JPG and PNG are allowed for [Photo]" ValidationExpression=".+\.(png|jpg)" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="review-content-section">
                                                    <div class="input-group mg-b-pro-edt">
                                                        <%-- Product Image 5 --%>
                                                        <asp:Image ID="Image5" runat="server" />
                                                        <div class="input-group mg-b-pro-edt">
                                                            <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                            <asp:FileUpload ID="fupProd5" runat="server" ForeColor="White" CssClass="form-control" />
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt">
                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="fupProd5" CssClass="" Display="Dynamic" ErrorMessage="Only JPG and PNG are allowed for [Photo]" ValidationExpression=".+\.(png|jpg)" ForeColor="Red"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <div class="input-group mg-b-pro-edt"></div>
                                                        <div class="input-group mg-b-pro-edt"></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <%-- Product ID --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label1" runat="server" Text="Product ID: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="txtProdID" runat="server" Enabled="false" Height="35px" Width="60px"></asp:TextBox>
                                                    </div>


                                                    <%-- Product Name --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label2" runat="server" Text="Name: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="txtProdName" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvProdName" runat="server" ErrorMessage="Please enter [Product Name]" ControlToValidate="txtProdName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <%-- Product Color --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label3" runat="server" Text="Color: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" MaxLength="20"></asp:TextBox>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvColor" runat="server" ErrorMessage="Please enter [Product Color]" ControlToValidate="txtColor" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <%--<asp:RegularExpressionValidator ID="revColor" runat="server" ErrorMessage="Please enter valid color name." ControlToValidate="txtColor" ValidationExpression="^[a-zA-Z]+(\s[a-zA-Z]+)?$" ForeColor="Red"></asp:RegularExpressionValidator>--%>
                                                    </div>
                                                    <%-- Product Quantity --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label4" runat="server" Text="Quantity: " CssClass="input-group-addon"></asp:Label>

                                                        <asp:Button ID="btnMinus" runat="server" CssClass="input-group-addon" Width="49px" Height="33px" Text="-" OnClick="btnMinus_Click" />
                                                        <asp:TextBox ID="txtQty" runat="server" Width="49px" Height="32px"></asp:TextBox>
                                                        <asp:Button ID="btnPlus" runat="server" CssClass="input-group-addon" Width="49px" Height="33px" Text="+" OnClick="btnPlus_Click" />
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvQty" runat="server" ErrorMessage="Please enter [Product Quantity]" ControlToValidate="txtQty" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvQty" runat="server" ErrorMessage="Invalid input. Enter digits only." ControlToValidate="txtQty" Operator="DataTypeCheck" Type="Integer" ForeColor="Red"></asp:CompareValidator>
                                                    </div>
                                                    <%-- Product Price --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label5" runat="server" Text="Unit Price (RM): " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" MaxLength="20">RM </asp:TextBox>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="Please enter [Product Unit Price]" ControlToValidate="txtQty" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cvPrice" runat="server" ErrorMessage="Invalid input. Enter digits only." ControlToValidate="txtPrice" Operator="DataTypeCheck" Type="Double" ForeColor="Red"></asp:CompareValidator>
                                                    </div>
                                                    <%-- Product Description --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label6" runat="server" Text="Description: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control" MaxLength="1000"></asp:TextBox>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvDesc" runat="server" ErrorMessage="Please enter [Product Description]" ControlToValidate="txtDesc" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <%-- Product Size --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label7" runat="server" Text="Size (UK): " CssClass="input-group-addon"></asp:Label>
                                                        <asp:Button ID="btnMinusSize" runat="server" CssClass="input-group-addon" Width="49px" Height="32px" Text="-" OnClick="btnMinusSize_Click" />
                                                        <asp:TextBox ID="txtSize" runat="server" Width="49px" Height="32px"></asp:TextBox>
                                                        <asp:Button ID="btnPlusSize" runat="server" CssClass="input-group-addon" Width="49px" Height="32px" Text="+" OnClick="btnPlusSize_Click" />
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvSize" runat="server" ErrorMessage="Please enter [Product Size in (UK)]" ControlToValidate="txtSize" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                        <asp:RangeValidator ID="rvSize" runat="server" ErrorMessage="Please enter size range from 3 to 15 only." MinimumValue="3" MaximumValue="15" Type="Double" ControlToValidate="txtSize" ForeColor="Red"></asp:RangeValidator>
                                                        <asp:CompareValidator ID="cvSize" runat="server" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtSize" ErrorMessage="Size must be a digit." ForeColor="Red"></asp:CompareValidator>
                                                    </div>
                                                    <%-- Product Category --%>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="Label8" runat="server" Text="Category: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:DropDownList ID="ddlCat" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                                                            <asp:ListItem>Mens</asp:ListItem>
                                                            <asp:ListItem>Womens</asp:ListItem>
                                                            <asp:ListItem>Juniors</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="rfvCat" runat="server" ErrorMessage="Please select a category" ControlToValidate="ddlCat" InitialValue="0" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">

                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                <div class="text-center custom-pro-edt-ds">
                                                    <asp:Button ID="btnEdit" runat="server" Text="Update" CssClass="btn btn-ctl-bt waves-effect waves-light m-r-10" Width="100px" OnClick="btnEdit_Click" OnClientClick="return confirmUpdate();" />

                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="100px" CssClass="btn btn-ctl-bt waves-effect waves-light" OnClick="btnDelete_Click" OnClientClick="return confirmDelete();" />


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
    <script type="text/javascript" language="javascript">
        function confirmDelete() {
            return confirm("Are you sure you want to Delete this product?");
        }
        function confirmUpdate() {
            return confirm("Are you sure you want to Update this product?");
        }
    </script>


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

</asp:Content>