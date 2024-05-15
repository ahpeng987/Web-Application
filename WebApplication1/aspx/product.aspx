<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="WebApplication1.aspx.product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Our Shop</h1>
            <div class="d-inline-flex">
                <p class="m-0">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="index.aspx">Home</asp:HyperLink>
                </p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

    <!-- Shop Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Categories -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by categories</h5>

                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="category-all">
                        <label class="custom-control-label" for="category-all">All Categories</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="cat-1">
                        <label class="custom-control-label" for="cat-1">Men's</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="cat-2">
                        <label class="custom-control-label" for="cat-2">Women's</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="cat-3">
                        <label class="custom-control-label" for="cat-3">Juniors</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>

                </div>
                <!-- Categories End -->
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by price</h5>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" checked id="price-all">
                        <label class="custom-control-label" for="price-all">All Price</label>
                        <span class="badge border font-weight-normal">1000</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-1">
                        <label class="custom-control-label" for="price-1">RM0 - RM100</label>
                        <span class="badge border font-weight-normal">150</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-2">
                        <label class="custom-control-label" for="price-2">RM100 - RM200</label>
                        <span class="badge border font-weight-normal">295</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-3">
                        <label class="custom-control-label" for="price-3">RM200 - RM300</label>
                        <span class="badge border font-weight-normal">246</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <input type="checkbox" class="custom-control-input" id="price-4">
                        <label class="custom-control-label" for="price-4">RM300 - RM400</label>
                        <span class="badge border font-weight-normal">145</span>
                    </div>
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                        <input type="checkbox" class="custom-control-input" id="price-5">
                        <label class="custom-control-label" for="price-5">RM400 - RM500</label>
                        <span class="badge border font-weight-normal">168</span>
                    </div>
                </div>
                <!-- Price End -->

                <!-- Color Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Filter by color</h5>
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
                </div>
                <!-- Color End -->
            </div>
            <!-- Shop Sidebar End -->



            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="input-group">
                                <%--<input type="text" class="form-control" placeholder="Search by name">
                                <div class="input-group-append">
                                    <span class="input-group-text bg-transparent text-primary">
                                        <i class="fa fa-search"></i>
                                    </span>
                                </div>--%>
                                <asp:TextBox ID="searchProd" runat="server" CssClass="form-control" placeholder="Search by name"></asp:TextBox>
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
                                            <h6>RM <%# string.Format("{0:F2}", Eval("prodPrice")) %></h6>
                                            <h6 class="text-muted ml-2"></h6>
                                        </div>
                                    </div>
                                    <div class="card-footer d-flex justify-content-between bg-light border">
                                        <a href='<%# string.Format("prodDetail.aspx?prodID={0}&prodName={1}&prodColor={2}&catName={3}&prodQty={4}", Eval("prodID"), Eval("prodName"), Eval("prodColor"), Eval("catName"), Eval("prodQty")) %>' class="btn btn-sm text-dark p-0">
                                            <i class="fas fa-eye text-primary mr-1"></i>View Detail
                                        </a>


                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>




                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                            <ul id="pagination" class="pagination justify-content-center mb-3">
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
    <script>
        // JavaScript function for pagination
        function showPage(pageNum) {
            var items = document.querySelectorAll('.product-item');
            var itemsPerPage = 9;
            var startIndex = (pageNum - 1) * itemsPerPage;
            var endIndex = startIndex + itemsPerPage;

            for (var i = 0; i < items.length; i++) {
                if (i >= startIndex && i < endIndex) {
                    items[i].style.display = 'block';
                } else {
                    items[i].style.display = 'none';
                }
            }
        }

        // Call showPage function with initial page number (1)
        showPage(1);

        // Generate pagination links dynamically
        var pagination = document.getElementById('pagination');
        var totalPages = Math.ceil(document.querySelectorAll('.product-item').length / 9); // Change to 9 items per page

        for (var i = 1; i <= totalPages; i++) {
            var li = document.createElement('li');
            li.className = 'page-item'; // Add class 'page-item'
            var a = document.createElement('a');
            a.className = 'page-link'; // Add class 'page-link' for default styling
            a.href = '#';
            a.textContent = i;
            a.addEventListener('click', function (event) {
                event.preventDefault();
                var pageNum = parseInt(this.textContent);
                showPage(pageNum);
            });
            li.appendChild(a);
            pagination.appendChild(li);
        }
    </script>

</asp:Content>
