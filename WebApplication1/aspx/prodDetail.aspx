<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="prodDetail.aspx.cs" Inherits="WebApplication1.aspx.prodDetail1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shop Detail</h1>
            <div class="d-inline-flex">
                <p class="m-0">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="index.aspx">Home</asp:HyperLink>
                </p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop Detail</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

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
                    <button type="button" class="btn btn-primary" data-dismiss="modal">ok</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">

                        <div class="carousel-item active">
                            <asp:Image ID="prodImg1" runat="server" CssClass="img-fluid w-100" />

                        </div>
                        <div class="carousel-item">
                            <asp:Image ID="prodImg2" runat="server" CssClass="img-fluid w-100" />
                        </div>
                        <div class="carousel-item">
                            <asp:Image ID="prodImg3" runat="server" CssClass="img-fluid w-100" />
                        </div>
                        <div class="carousel-item">
                            <asp:Image ID="prodImg4" runat="server" CssClass="img-fluid w-100" />
                        </div>
                        <div class="carousel-item">
                            <asp:Image ID="prodImg5" runat="server" CssClass="img-fluid w-100" />
                        </div>

                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold">
                    <asp:Label ID="lblProdName" runat="server"></asp:Label>
                    <asp:Label ID="lblCatName" runat="server"></asp:Label>'s
                </h3>
                
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(50 Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">RM
                    <asp:Label ID="lblPrice" runat="server"></asp:Label></h3>
                <p class="mb-4">
                    <asp:Label ID="lblDesc" runat="server"></asp:Label>
                </p>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>

                    <asp:Repeater ID="rptSizes" runat="server">
                        <ItemTemplate>

                            <div class="custom-control custom-radio custom-control-inline">
                                <input type="radio" class="custom-control-input" id='<%# "rbSize_" + Container.ItemIndex %>' name="size" checked>
                                <label class="custom-control-label" for='<%# "rbSize_" + Container.ItemIndex %>'>
                                    <asp:Label ID="lblSize" runat="server"></asp:Label><%# "UK " + Eval("prodSize") %></label>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
                    <asp:Label ID="lblColor" runat="server"></asp:Label>
                </div>
                <p class="text-dark font-weight-medium mb-0 mr-3">Quantity:</p>
                <div class="d-flex align-items-center mb-4 pt-2">

                    <asp:Button ID="btnMinus" runat="server" CssClass="btn btn-primary btn-minus" Text="-" OnClick="btnMinus_Click" />
                    <asp:TextBox ID="txtQty" runat="server" Width="49px" Height="35px"></asp:TextBox>
                    <asp:Button ID="btnPlus" runat="server" CssClass="btn btn-primary btn-plus" Text="+" OnClick="btnPlus_Click" />
                    &nbsp;
                    <asp:Button runat="server" ID="AddToCartButton" CssClass="btn btn-primary px-3" Text="Add To Cart" OnClick="AddToCartButton_Click" />

                </div>


            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Information</a>
                    <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (0)</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Product Description</h4>
                        <p>
                            <asp:Label ID="lblDesc2" runat="server"></asp:Label>

                        </p>
                        <h5>Care & Material:</h5>
                        <p>Synthetic/Textile</p>
                        <h5>Color:</h5>
                        <p>
                            <asp:Label ID="lblColor2" runat="server"></asp:Label>
                        </p>
                    </div>
                    <div class="tab-pane fade" id="tab-pane-2">
                        <h4 class="mb-3">Additional Information</h4>
                        <h5>Delivery</h5>
                        <p>Standard Delivery: 2-3 business days for West Malaysia and 2-5 business days for East Malaysia respectively.</p>
                        <p>Orders shipped from the UK will take 7-14 business days.</p>
                        <p>Free Delivery Sitewide</p>
                        <h5>Returns</h5>
                        <p>If you change your mind on a purchase, please return your goods to us within 30 days of receiving your order.</p>
                        <p>All returns must be unworn and unopened, unwashed and undamaged, in their original condition with all original tags attached and/or in their original packaging which must also be undamaged in its original condition.</p>
                        <p>The original packaging must also be returned in its original condition and must not be marked, labelled, damaged, or taped.</p>
                        <p>Due to health and hygiene, we do not offer refunds on underwear, swimwear and jewellery piercing products unless faulty. JD Sports Malaysia reserves the right to reject your return should the item, its box or packaging be marked, damaged, or not returned in a saleable condition.</p>
                        <p>
                            The following products are classified as Non-Returnable Products:<br />
                            a. Nike Dunk and Nike Air Force 1<br />
                            b. All Jordan Footwear<br />
                            c. New Balance 550, New Balance 530, New Balance 990V6<br />
                            d. All Yeezy Products<br />
                            e. All Raffle Products<br />
                            f. Sport Bra(s)<br />
                            g. Undergarment(s)<br />
                            h. Sock(s)<br />
                            i. Swimwear(s)<br />
                            j. Bikini(s).<br />
                        </p>
                        <p>JD Sports Malaysia reserves the right to modify or include products classified as Non-Refundable including limited time-based restrictions at any time.</p>
                        <p>With effect from 15 February 2023, JD Sports Malaysia will no longer accept physical returns to the warehouse.</p>

                    </div>
                                       <div class="tab-pane fade" id="tab-pane-3">
<div class="row">
    <div class="col-md-6">
        <h4 class="mb-4">Leave a review</h4>
        <small>Your email address will not be published. Required fields are marked *</small>
        <div class="d-flex my-3">
            <p class="mb-0 mr-2">Your Rating * :</p>
            <div class="text-primary">
                <!-- Star rating input here -->
             <asp:DropDownList ID="ratingDropDown" runat="server" CssClass="form-control" AppendDataBoundItems="true" Enabled="false">
            <asp:ListItem Text="Select Rating &#9734;" Value="" Disabled="true" Selected="true"></asp:ListItem>
            <asp:ListItem Text="1" Value="1"></asp:ListItem>
            <asp:ListItem Text="2" Value="2"></asp:ListItem>
            <asp:ListItem Text="3" Value="3"></asp:ListItem>
            <asp:ListItem Text="4" Value="4"></asp:ListItem>
            <asp:ListItem Text="5" Value="5"></asp:ListItem>
        </asp:DropDownList>
                
            </div>
        </div>
           
    <div class="form-group">
        <label for="message">Your Review *</label>
        <asp:TextBox ID="message1" runat="server" TextMode="MultiLine" CssClass="form-control" ReadOnly="true" placeholder="Need to purchase before leaving a comment"></asp:TextBox>
    </div>
    <div class="form-group">
        <label for="name">Your Name *</label>
        <asp:TextBox ID="message2" runat="server" CssClass="form-control" ReadOnly="true" placeholder=""></asp:TextBox>
    </div>
    <div class="form-group mb-0">
        <asp:Button ID="submitReviewBtn" runat="server" Text="Leave Your Review" CssClass="btn btn-primary px-3"  Enabled="false"/>
    </div>

    </div>

              
                 <div class="col-md-6">
 <h4 class="mb-4">View Feedback</h4>
 <small>Let's view the feedback of this product</small>
 <div class="form-group mb-0">
<asp:Button ID="Button1" runat="server" Text="View Feedback" CssClass="btn btn-primary px-3"  OnClick="Feedback_Click"/>
    </div>
     
    </div>
    </div>
                
 </div>
     </div>
    </div>

    <!-- Shop Detail End -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <asp:ListView ID="lvOtherProd" runat="server">
                <ItemTemplate>
                    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                                <img class="img-fluid w-100" src="../admin/products/<%# Eval("prodImg1") %>" /><br />
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3"><%# Eval("prodName") %></h6>
                                <div class="d-flex justify-content-center">
                                    <h6>RM <%# Eval("prodPrice") %></h6>
                                    <h6 class="text-muted ml-2"></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <a href='<%# string.Format("prodDetail.aspx?prodID={0}&prodName={1}", Eval("prodID"), Eval("prodName")) %>' class="btn btn-sm text-dark p-0">
                                    <i class="fas fa-eye text-primary mr-1"></i>View Detail
                                </a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
    
</asp:Content>
