<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="PromotionEdit.aspx.cs" Inherits="WebApplication1.admin.PromotionEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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

                                        <div class="breadcomb-ctn">
                                        </div>
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
                                    <li class="active"><a href="#description"><i class="fa fa-edit" aria-hidden="true"></i>Add Promotion</a></li>

                                </ul>
                                <div id="myTabContent" class="tab-content custom-product-edit">
                                    <div class="product-tab-list tab-pane fade active in" id="description">
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="input-group ">
                                                        <span class="input-group-addon"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" Placeholder="Promotion Description"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtDescription" runat="server" ErrorMessage="Description Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>

                                                    <div class="input-group ">
                                                        <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtOriPrice" runat="server" CssClass="form-control" Placeholder="Original Price"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtOriPrice" runat="server" ErrorMessage="Price Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtOriPrice" ErrorMessage="Only Numeric Are Allowed" ValidationExpression="\d+(\.\d{1,2})?" ForeColor="#FF5050"></asp:RegularExpressionValidator>


                                                    <div class="input-group ">
                                                        <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control" Placeholder="Start Date" ValidationGroup="start"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtStartDate" runat="server" ErrorMessage="Date Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>



                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-paint-brush" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtpromoColor" runat="server" CssClass="form-control" Placeholder="Color" ValidationGroup="start"></asp:TextBox>
                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtpromoColor" runat="server" ErrorMessage="Color Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtpromoColor" ErrorMessage="Only Alphabets Are Allowed"
                                                            ValidationExpression="^[a-zA-Z\s]+$" ForeColor="#FF5050"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                                <div class="review-content-section">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-product-hunt" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" Placeholder="Product Name"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtProductName" runat="server" ErrorMessage="Name Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>


                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-usd" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control" Placeholder="Discount Price"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtDiscount" runat="server" ErrorMessage="Name Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtDiscount" ErrorMessage="Only Numeric Are Allowed" ValidationExpression="\d+(\.\d{1,2})?" ForeColor="#FF5050"></asp:RegularExpressionValidator>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" Placeholder="End Date"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtEndDate" runat="server" ErrorMessage="Name Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>

                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                        <asp:FileUpload ID="fupPromo1" runat="server" ForeColor="Red" />

                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                        <asp:FileUpload ID="fupPromo2" runat="server" ForeColor="Red" />

                                                    </div>
                                                    <div class="input-group mg-b-pro-edt">
                                                        <span class="input-group-addon"><i class="fa fa-picture-o" aria-hidden="true"></i></span>
                                                        <asp:FileUpload ID="fupPromo3" runat="server" ForeColor="Red" />

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="text-center custom-pro-edt-ds">
                                <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
                                <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>


    <!--- display image -->
    <script>
        function displaySelectedImage(input) {
            var selectedImage = document.getElementById('selectedImage');

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    selectedImage.src = e.target.result;
                    selectedImage.classList.remove('d-none'); // Display the image
                    selectedImage.classList.add('rounded', 'border', 'p-2'); // Add border and padding
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                selectedImage.src = '';
                selectedImage.classList.add('d-none'); // Hide the image
                selectedImage.classList.remove('rounded', 'border', 'p-2'); // Remove border and padding
            }
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
