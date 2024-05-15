<%@ Page Title="JD Sports - Home" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication1.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Favicon -->

    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/style.min.css" rel="stylesheet" />
    <!-- Featured Start -->
    <div style="text-align: center;">
        <asp:Label ID="lblWelcomeMessage" runat="server" Text="Welcome, <%= userName %>" Font-Bold="True" Font-Italic="False" Font-Names="Georgia" Font-Size="Larger"></asp:Label>
    </div>
    <br />

    <div id="header-carousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="height: 410px;">
                <img class="img-fluid" src="../img/JDcarousel-1.png" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 700px;">
                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Fashionable Equipment</h3>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/aspx/product.aspx" Text="Shop Now" CssClass="btn btn-light py-2 px-3" />
                    </div>
                </div>
            </div>
            <div class="carousel-item" style="height: 410px;">
                <img class="img-fluid" src="../img/JDcarousel-2.png" alt="Image">
                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3" style="max-width: 700px;">
                        <h4 class="text-light text-uppercase font-weight-medium mb-3">10% Off Your First Order</h4>
                        <h3 class="display-4 text-white font-weight-semi-bold mb-4">Reasonable Price</h3>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/aspx/product.aspx" Text="Shop Now" CssClass="btn btn-light py-2 px-3" />
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                <span class="carousel-control-prev-icon mb-n2"></span>
            </div>
        </a>
        <a class="carousel-control-next" href="#header-carousel" data-slide="next">
            <div class="btn btn-dark" style="width: 45px; height: 45px;">
                <span class="carousel-control-next-icon mb-n2"></span>
            </div>
        </a>
    </div>


    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/aspx/product.aspx" class="cat-img position-relative overflow-hidden mb-3"><img class="img-fluid" src="../img/JDmen.jpg" alt=""></asp:HyperLink>
                    <h5 class="font-weight-semi-bold m-0">Men's Shoes</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/aspx/product.aspx" class="cat-img position-relative overflow-hidden mb-3"><img class="img-fluid" src="../img/JDwomen.jpg" alt=""></asp:HyperLink>
                    <h5 class="font-weight-semi-bold m-0">Women's Shoes</h5>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 pb-1">
                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
                    <p class="text-right">15 Products</p>
                    <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/aspx/product.aspx" class="cat-img position-relative overflow-hidden mb-3"><img class="img-fluid" src="../img/JDjunior.jpg" alt=""></asp:HyperLink>
                    <h5 class="font-weight-semi-bold m-0">Junior's Shoes</h5>
                </div>
            </div>

        </div>
    </div>
    <!-- Categories End -->


    <!-- Offer Start -->
    <div class="container-fluid offer pt-5">
        <div class="row px-xl-5">
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
                    <img src="../img/offer-1.png" alt="test1">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
                        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/aspx/product.aspx" Text="Shop Now" CssClass="btn btn-outline-primary py-md-2 px-md-3" />
                    </div>
                </div>
            </div>
            <div class="col-md-6 pb-4">
                <div class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
                    <img src="../img/offer-2.png" alt="">
                    <div class="position-relative" style="z-index: 1;">
                        <h5 class="text-uppercase text-primary mb-3">20% off the all order</h5>
                        <h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
                        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/aspx/product.aspx" Text="Shop Now" CssClass="btn btn-outline-primary py-md-2 px-md-3" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->

    <!-- Added to cart Message End -->
    <div class="modal fade" id="addToCartModal" tabindex="-1" role="dialog" aria-labelledby="addToCartModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="addToCartModalLabel">Item Added to Cart!🛒</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Trending Products</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <asp:ListView ID="lvProduct" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">

                                <img class="img-fluid w-100" src="../admin/products/<%# Eval("prodImg1") %>" /><br />
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%# Eval("prodName") %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6>RM <%# String.Format("{0:F2}", Eval("prodPrice")) %></h6>
                                    <h6 class="text-muted ml-2"></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                               <a href='<%# string.Format("prodDetail.aspx?prodID={0}&prodName={1}&prodColor={2}&catName={3}", Eval("prodID"), Eval("prodName"), Eval("prodColor"), Eval("catName")) %>' class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-eye text-primary mr-1"></i>View Detail
                                </a>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    <!-- Products End -->


    <!-- Subscribe Start -->
    <div class="container-fluid bg-secondary my-5">
        <div class="row justify-content-md-center py-5 px-xl-5">
            <div class="col-md-6 col-12 py-5">
                <div class="text-center mb-2 pb-2">
                    <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">Stay Updated</span></h2>
                    <p>Enter Your Email Here So That You Can Receive Lastest and Newest Information From JD Sports.</p>
                </div>
                <div class="input-group">
                    <input type="text" class="form-control border-white p-4" placeholder="Email Goes Here">
                    <div class="input-group-append">
                        <button class="btn btn-primary px-4">Subscribe</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Subscribe End -->


    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-1.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-2.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-3.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-4.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-5.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-6.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-7.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="../img/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
