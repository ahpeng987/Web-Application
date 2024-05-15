<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetPass.aspx.cs" Inherits="WebApplication1.aspx.forgetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
</head>
<body>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />
    <div class="form-gap"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                            <h3><i class="fa fa-lock fa-4x"></i></h3>
                            <h2 class="text-center">Forgot Password?</h2>
                            <p>Enter your email to reset your password.</p>
                            <div class="panel-body">

                                <form id="forgetForm" runat="server" role="form" autocomplete="off" class="form">

                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                            <asp:TextBox ID="fgtEmail" runat="server" placeholder="Email Address" CssClass="form-control" type="email"></asp:TextBox>

                                        </div>
                                        <div>
                                            <asp:CustomValidator ID="cvEmail" runat="server" ErrorMessage="This [Email] is not registered !!" ControlToValidate="fgtEmail" Display="Dynamic" Font-Bold="True" ForeColor="Red" OnServerValidate="cvEmail_ServerValidate"></asp:CustomValidator>
                                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter [Email} with &quot;@&quot; !!" ControlToValidate="fgtEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <asp:Button ID="verifyEmail" runat="server" Text="Verify Email" CssClass="btn btn-lg btn-primary btn-block" OnClick="verifyEmail_Click" />
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .form-gap {
            padding-top: 70px;
        }
    </style>
</body>



</html>
