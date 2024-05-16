<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.aspx.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css" />
</head>
<body>
    <script src="../js/login.js" type="text/javascript"></script>
    <div class="login-register">
        <div class="modal">
            <div class="innerModal" id="rotate">
                <div class="loginModal">
                    <asp:HyperLink ID="toRegister" runat="server" NavigateUrl="~/aspx/register.aspx" Text="Register Now" CssClass="button" />
                    <span id="word">New here?</span>
                    <br />
                    <br />
                    <h2>LOGIN</h2>
                    <form id="loginForm" runat="server">
                        <div style="text-align: center">
                            <asp:Label ID="lblname" runat="server" Text="Username" Font-Bold="True" Font-Names="Book Antiqua" Font-Size="X-Large"></asp:Label>
                        </div>
                        <asp:TextBox ID="loginUsername" runat="server" placeholder="Enter Your Username" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Please fill up your [Username]" ControlToValidate="loginUsername" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revUsername" runat="server" ErrorMessage="Please enter alphabet only" ControlToValidate="loginUsername" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                        </div>
                        <div style="text-align: center">
                            <asp:Label ID="lblPass" runat="server" Text="Password" Font-Bold="True" Font-Names="Book Antiqua" Font-Size="X-Large"></asp:Label>
                        </div>
                        <asp:TextBox type="password" ID="loginPass" runat="server" placeholder="Enter Your Password" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Please fill up your [Password]" ControlToValidate="loginPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPass" runat="server" ErrorMessage="Please enter [Password] with 6-10 characters (at least 1 upper case &amp;amp, lower case, digit and a special character)" ControlToValidate="loginPass" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()_+.])[A-Za-z\d!@#$%^&*()_+.]{6,10}$"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cvNotMatched" runat="server" CssClass="error" Display="Dynamic" ErrorMessage="[Password] and [Username] not matched" ControlToValidate="loginPass" Font-Bold="True" ForeColor="Red"></asp:CustomValidator>
                        </div>

                        <br />
                        <div class="g-recaptcha" data-sitekey="6LfJpd0pAAAAAPXv96y3UTgSzYN11H44i2I_9Whl"></div>
                        <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red"></asp:Label>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="loginBtn" OnClick="btnLogin_Click" />
                        <br />
                        <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" Style="font-family: 'Lucida Sans', sans-serif; color: #1C1C1C;" />
                        <asp:HyperLink ID="forgotPsw" runat="server" NavigateUrl="~/aspx/forgetPass.aspx" Text="Forgot Password?" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
</html>
