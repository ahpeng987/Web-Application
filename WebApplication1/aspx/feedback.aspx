<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="WebApplication1.aspx.feedback"  enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <link href="../css/style.css" rel="stylesheet" />
<link href="../css/style.min.css" rel="stylesheet" />
    <div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Big Sales !!</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">FeedBack</p>
        </div>
    </div>
</div>
    
    <!-- Page Header Start -->
  
    
    <div class="card-body">
        <div class="col-md-8">
            <div class="card mb-4">
                <div class="card-header">
                    <h4 class="card-title"><strong>Feedback</strong></h4>
                    </div>
                    <!-- Product Information Section -->
                    <div class="card-body">
                        <h5 class="card-title"><strong>User Information</strong></h5>
                        <div>
                            <div class="form-group">
                                <label for="userId"><strong><i class="fa fa-user" aria-hidden="true"></i> User ID: </strong></label>
                                <asp:TextBox ID="txtUserID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="productName"><i class="fa fa-shopping-bag" aria-hidden="true"></i> <strong>Product Name:</strong></label>
                               
                                    
                               
                                <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="orderId"><strong><i class="fa fa-id-card" aria-hidden="true"></i> Payment ID:</strong></label>
                                <asp:TextBox ID="txtPaymentID" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <!-- Your Rating and Review Section -->
                   <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><strong>Rating and Review <i class="fa fa-comments" aria-hidden="true"></i></strong></h5>
                        <div class="form-group">
                            <label for="ratingDropDown"><strong>Your Rating :</strong> <i class="fa fa-star" aria-hidden="true"></i></label>
                            <asp:DropDownList ID="ratingDropDown" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                                <asp:ListItem Text="Select Rating &#9734;" Value="" Disabled="true" Selected="true"></asp:ListItem>
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ratingDropDown" runat="server" ErrorMessage="Please select an item" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                        <div class="form-group">
                            <label for="message"><strong>Your Review </strong><i class="fa fa-comment" aria-hidden="true"></i></label>
                            <asp:TextBox ID="message1" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Leaving a comment"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="message1" runat="server" ErrorMessage="Review Cannot Be Empty" ForeColor="#FF5050"></asp:RequiredFieldValidator>
                        </div>
                       
                        <!-- Submit button -->
                        <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" OnClick="btnSubmitFeedback_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
            </div>
                 </div>
                </div>
            </div>
        </div>
    
    
</asp:Content>

