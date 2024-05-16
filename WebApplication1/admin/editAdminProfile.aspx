<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="editAdminProfile.aspx.cs" Inherits="WebApplication1.admin.editAdminProfile" %>

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

        <!-- Single pro tab start-->
        <div class="single-product-tab-area mg-b-30">
            <!-- Single pro tab review Start-->
            <div class="single-pro-review-area">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="review-tab-pro-inner">
                                <ul id="myTab3" class="tab-review-design">
                                    <li class="active"><a href="#description"><i class="fa fa-edit" aria-hidden="true"></i>Edit Profile</a></li>
                                    <asp:Button ID="toChangePass" Style="background-color: black; border-color: white;" runat="server" Text="Change My Password" CssClass="btn btn-ctl-bt waves-effect waves-light m-r-10" Width="200px" OnClick="toChangePass_Click" Font-Bold="True" ForeColor="White" />

                                </ul>

                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="lblName" runat="server" Text="Admin Username: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="editAdminName" runat="server" CssClass="form-control" Text="<%= adminName %>" MaxLength="50"></asp:TextBox>
                                                    </div>
                                                    <div>
                                                        <asp:RequiredFieldValidator ID="rfvAdminName" runat="server" ErrorMessage="Please fill up your [Username]" ControlToValidate="editAdminName" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revAdminName" runat="server" ErrorMessage="Please enter alphabet only" ControlToValidate="editAdminName" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                                                        <asp:CustomValidator ID="cvAdminName" runat="server" ErrorMessage="This [Username] has been used" Display="Dynamic" ControlToValidate="editAdminName" Font-Bold="True" ForeColor="Red" OnServerValidate="cvAdminName_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:Label ID="lblEmail" runat="server" Text="Admin Email: " CssClass="input-group-addon"></asp:Label>
                                                        <asp:TextBox ID="editAdminEmail" runat="server" CssClass="form-control" Text="<%= adminEmail %>" MaxLength="50"></asp:TextBox>
                                                    </div>
                                                    <div>
                                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please fill up your [Email]" ControlToValidate="editAdminEmail" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter [Email] with &quot;@&quot;" ControlToValidate="editAdminEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                                                        <asp:CustomValidator ID="cvEmail" runat="server" ErrorMessage="This [Email] has been used" ControlToValidate="editAdminEmail" Display="Dynamic" Font-Bold="True" ForeColor="Red" OnServerValidate="cvEmail_ServerValidate"></asp:CustomValidator>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="text-center custom-pro-edt-ds">
                                                            <asp:Button ID="updateBtn" runat="server" Text="Update" CssClass="btn btn-ctl-bt waves-effect waves-light m-r-10" Width="100px" OnClick="updateBtn_Click" />
                                                        </div>
                                                        <br />
                                                        <div class="text-center custom-pro-edt-ds">
                                                            <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="btn btn-ctl-bt waves-effect waves-light m-r-10" Width="100px" OnClick="cancelBtn_Click" />
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
