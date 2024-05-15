<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="viewFeedback.aspx.cs" Inherits="WebApplication1.aspx.viewFeedback"  enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <link href="../css/style.css" rel="stylesheet" />
<link href="../css/style.min.css" rel="stylesheet" />
    <div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="form-group">
    <label for="ddlProducts">Select Product:</label>
    <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control" AutoPostBack="true"
        OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
    </asp:DropDownList>
</div>
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Feedback</h4>
                </div>

                <div class="card-body">
                    
                    
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="card mb-4">
                                <div class="card-body">
                                    <h5 class="card-title">User ID: <%# Eval("userID") %></h5>
                                    <h5 class="card-title">User Name: <%# Eval("userName") %></h5>
                                    <p class="card-text">Product Name: <span class="text-primary"><%# Eval("prodName") %></span></p>
                                    <p class="card-text">Rating: <span class="ml-2"><%# Eval("ratingValue") %><i class="far fa-star"></i></span>
                                    <p class="card-text">
                                        <label for="feedback<%# Container.ItemIndex %>">Feedback:</label>
                                        <textarea id="feedback<%# Container.ItemIndex %>" class="form-control" rows="4" readonly><%# Eval("feedBack") %></textarea>
                                    </p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                     <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center mb-3">
                                <asp:PlaceHolder ID="phPagination" runat="server"></asp:PlaceHolder>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

 