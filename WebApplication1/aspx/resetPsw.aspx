<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPsw.aspx.cs" Inherits="WebApplication1.aspx.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
    <link rel="stylesheet" href="../css/login.css" type="text/css" />
</head>
<body>
    <script src="../js/login.js" type="text/javascript"></script>
    <div class="resetPsw">
        <div class="modal">
            <div class="innerModal" id="next">
                <div class="resetModal">
                    <br />
                    <br />
                    <br />
                    <h2>RESET PASSWORD</h2>
                    <form id="resetForm" runat="server">
                        <i class="fas fa-lock"></i>
                        <asp:TextBox type="password" ID="resetPass" runat="server" placeholder="Enter Your New Password" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Please fill up your [Password]" ControlToValidate="resetPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPass" runat="server" ErrorMessage="Please enter [Password] with 6-10 characters (at least 1 upper case &amp;amp, lower case, digit and a special character)" ControlToValidate="resetPass" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&amp;*()_+.])[A-Za-z\d!@#$%^&amp;*()_+.]{6,10}$"></asp:RegularExpressionValidator>
                        </div>
                        <i class="fas fa-check-circle"></i>
                        <asp:TextBox type="password" ID="resetConfirmPass" runat="server" placeholder="Confirm Password" CssClass="inputBox"></asp:TextBox>
                        <div>
                            <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ErrorMessage="Please fill up your [Password] again" ControlToValidate="resetConfirmPass" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Passwords not match" ControlToCompare="resetPass" ControlToValidate="resetConfirmPass" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:CompareValidator>
                        </div>
                        <asp:Button ID="resetBtn" runat="server" Text="Reset Password" CssClass="resetBtn" OnClick="resetBtn_Click"/>
                    </form>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
