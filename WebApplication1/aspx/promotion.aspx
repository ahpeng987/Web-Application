﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="promotion.aspx.cs" Inherits="WebApplication1.aspx.promotion" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <link href="../css/style.css" rel="stylesheet" />
<link href="../css/style.min.css" rel="stylesheet" />
    <!-- Page Header Start -->
 <div class="container-fluid bg-secondary mb-5">
     <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
         <h1 class="font-weight-semi-bold text-uppercase mb-3">Big Sales !!</h1>
         <div class="d-inline-flex">
             <p class="m-0"><a href="">Home</a></p>
             <p class="m-0 px-2">-</p>
             <p class="m-0">Promotion</p>
            
         </div>
         

     </div>
 </div>
 <!-- Page Header End -->
      <!-- Shop Start -->
 <div class="container-fluid pt-5">
     <div class="row px-xl-5">
         <!-- Shop Sidebar Start -->
         <div class="col-lg-3 col-md-12">

             <div class="border-bottom mb-4 pb-4">
    <h5 class="font-weight-semi-bold mb-4">Filter by categories</h5>
    <form>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" checked id="price-all">
            <label class="custom-control-label" for="price-all">All Categories</label>
            <span class="badge border font-weight-normal">1000</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-1">
            <label class="custom-control-label" for="price-all">Men's</label>
            <span class="badge border font-weight-normal">1000</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-2">
            <label class="custom-control-label" for="price-1">Women's</label>
            <span class="badge border font-weight-normal">150</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="price-3">
            <label class="custom-control-label" for="price-2">Juniors</label>
            <span class="badge border font-weight-normal">295</span>
        </div>
    </form>
</div>
             <!-- Price Start -->
             <div class="border-bottom mb-4 pb-4">
                 <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                 <form>
                     <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                         <input type="checkbox" class="custom-control-input" checked id="price-all">
                         <label class="custom-control-label" for="price-all">All Price</label>
                         <span class="badge border font-weight-normal">1000</span>
                     </div>
                     <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                         <input type="checkbox" class="custom-control-input" id="price-1">
                         <label class="custom-control-label" for="price-1">$0 - $100</label>
                         <span class="badge border font-weight-normal">150</span>
                     </div>
                     <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                         <input type="checkbox" class="custom-control-input" id="price-2">
                         <label class="custom-control-label" for="price-2">$100 - $200</label>
                         <span class="badge border font-weight-normal">295</span>
                     </div>
                     <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                         <input type="checkbox" class="custom-control-input" id="price-3">
                         <label class="custom-control-label" for="price-3">$200 - $300</label>
                         <span class="badge border font-weight-normal">246</span>
                     </div>
                     <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                         <input type="checkbox" class="custom-control-input" id="price-4">
                         <label class="custom-control-label" for="price-4">$300 - $400</label>
                         <span class="badge border font-weight-normal">145</span>
                     </div>
                     <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                         <input type="checkbox" class="custom-control-input" id="price-5">
                         <label class="custom-control-label" for="price-5">$400 - $500</label>
                         <span class="badge border font-weight-normal">168</span>
                     </div>
                 </form>
             </div>
            
             <!-- Price End -->
    <!-- Color Start -->
<div class="border-bottom mb-4 pb-4">
    <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
    <form>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" checked id="color-all">
            <label class="custom-control-label" for="price-all">All Color</label>
            <span class="badge border font-weight-normal">1000</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-1">
            <label class="custom-control-label" for="color-1">Black</label>
            <span class="badge border font-weight-normal">150</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-2">
            <label class="custom-control-label" for="color-2">White</label>
            <span class="badge border font-weight-normal">295</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-3">
            <label class="custom-control-label" for="color-3">Red</label>
            <span class="badge border font-weight-normal">246</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
            <input type="checkbox" class="custom-control-input" id="color-4">
            <label class="custom-control-label" for="color-4">Blue</label>
            <span class="badge border font-weight-normal">145</span>
        </div>
        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
            <input type="checkbox" class="custom-control-input" id="color-5">
            <label class="custom-control-label" for="color-5">Green</label>
            <span class="badge border font-weight-normal">168</span>
        </div>
    </form>
</div>
              </div>
<!-- Color End -->
         
                    <!-- Shop Product Start -->
        <div class="col-lg-9 col-md-12">
            <div class="row pb-3">
                <div class="col-12 pb-1">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                       
    <div class="input-group">
       <asp:TextBox ID="searchInput" runat="server" CssClass="form-control" placeholder="Search by name"></asp:TextBox>
        <div class="input-group-append">
            <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnSearch_Click" />
        </div>
    </div>

                      
                        <div class="dropdown ml-4">
                            <button class="btn border dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                    aria-expanded="false">
                                        Sort by
                                    </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="triggerId">
                                <a class="dropdown-item" href="#">Latest</a>
                                <a class="dropdown-item" href="#">Popularity</a>
                                <a class="dropdown-item" href="#">Best Rating</a>
                            </div>
                        </div>
                    </div>
                </div>

                  
      <div class="row">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                <div class="card product-item border-0 mb-4">
                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                        
                         <img class="img-fluid w-100" src="../admin/img/<%# Eval("promoImg") %>" /><br />
                    </div>
                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="font-weight-bold mb-2"><%# Eval("prodName") %></h6>
                        <div class="d-flex justify-content-center">
                         <span class="text-primary mb-2"> <h6><%# "RM " + Eval("disPrice") %></h6> </span>
                         <span class="text-primary"> <h6 class="text-truncate mb-3"><del><%# "RM " + Eval("oriPrice") %></del></h6>
                             
                        </div>
                        <p><small><%# Eval("startDate") %> to <%# Eval("endDate") %></small></p>
                         
                    </div>
                    <div class="card-footer d-flex justify-content-betweesn bg-light border">
                       <i class="fas fa-eye text-primary mr-1"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/aspx/promotionDetail.aspx?promoID=" + Eval("promoID") + "&prodID=" + Eval("prodID") %>' Text="Detail"/></i>
                        
                    </div>
                </div>
            </div>
            
        </ItemTemplate>
    </asp:Repeater>
</div>
    
              
            
               
                <div class="col-12 pb-1">
                    <nav aria-label="Page navigation">
                      <ul class="pagination justify-content-center mb-3">
                        <li class="page-item disabled">
                          <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                          </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                          </a>
                        </li>
                      </ul>
                    </nav>
                </div>
            </div>
        </div>
     </div>
        <!-- Shop Product End -->
        
     </div>
     
</asp:Content>
