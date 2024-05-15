<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="WebApplication1.aspx.register1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css" />
</head>
<body>
    <div class="login-register">
        <div class="modal">
            <div class="innerModal">
                <div class="loginModal">
                    <asp:HyperLink ID="toLogin" runat="server" NavigateUrl="~/aspx/login.aspx" Text="Login Now" CssClass="button" />
                    <span id="word">Already have an account?</span>
                    <br />
                    <br />
                    <h2>REGISTER</h2>
                    <form id="registerForm" runat="server">
                        <i class="fas fa-user"></i>
                        <asp:TextBox ID="regUsername" runat="server" placeholder="Enter Your Username" CssClass="inputBox" MaxLength="20"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Please Fill Up Your [Username] !!" ControlToValidate="regUsername" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revUsername" runat="server" ErrorMessage="Please Enter Alphabet Only !!" ControlToValidate="regUsername" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cvUsername" runat="server" ErrorMessage="This [Username] has been used !!" Display="Dynamic" ControlToValidate="regUsername" Font-Bold="True" ForeColor="Red" OnServerValidate="cvUsername_ServerValidate"></asp:CustomValidator>
                        </div>
                        <i class="fas fa-envelope"></i>
                        <asp:TextBox ID="regEmail" runat="server" placeholder="Enter Your Email" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please Fill Up Your [Email] !!" ControlToValidate="regEmail" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter [Email] with &quot;@&quot; !!" ControlToValidate="regEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="cvEmail" runat="server" ErrorMessage="This [Email] has been used !!" ControlToValidate="regEmail" Display="Dynamic" Font-Bold="True" ForeColor="Red" OnServerValidate="cvEmail_ServerValidate"></asp:CustomValidator>
                        </div>
                        <i class="fas fa-lock"></i>
                        <asp:TextBox type="password" ID="regPass" runat="server" placeholder="Enter Your Password" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Please Fill Up Your [Password] !!" ControlToValidate="regPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPass" runat="server" ErrorMessage="Please enter [Password] with 6-10 characters (at least 1 upper case &amp;amp, lower case, digit and a special character) !!" ControlToValidate="regPass" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&amp;*()_+.])[A-Za-z\d!@#$%^&amp;*()_+.]{6,10}$"></asp:RegularExpressionValidator>
                        </div>
                        <i class="fas fa-check-circle"></i>
                        <asp:TextBox type="password" ID="regConfirmPass" runat="server" placeholder="Confirm Password" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ErrorMessage="Please Fill Up Your [Password] Again !!" ControlToValidate="regConfirmPass" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Passwords not match !!" ControlToCompare="regPass" ControlToValidate="regConfirmPass" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:CompareValidator>
                        </div>
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="registerBtn" OnClick="btnRegister_Click" />
                        <br />
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
