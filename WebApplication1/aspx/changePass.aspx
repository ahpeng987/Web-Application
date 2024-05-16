<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="changePass.aspx.cs" Inherits="WebApplication1.aspx.changePass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/userProfile.css" rel="stylesheet" />

    <!-- Change Password starts -->
    <div class="usercontainer mt-4 mb-4 p-3 d-flex justify-content-center">
        <div class="usercard p-4">
            <div class=" userimage d-flex flex-column justify-content-center align-items-center">
                <button class="userbtn btn-secondary">
                    <img src="../img/user.jpg" height="100" width="100" /></button>

                <div class=" userd-flex mt-2" style="text-align: center">
                    <asp:Label ID="lblChangePass" runat="server" Text="Change Password" CssClass="username mt-3"></asp:Label>
                </div>

                <div class=" userd-flex mt-2" style="text-align: center">
                    <asp:Label ID="lblPass" runat="server" Text="New Password" CssClass="useridd"></asp:Label>
                    <asp:TextBox ID="editPass" type="password" runat="server" placeholder="Enter New Password" CssClass="username mt-3" Style="text-align: center"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="Please fill up your [Password]" ControlToValidate="editPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revPass" runat="server" ErrorMessage="Please enter [Password] with 6-10 characters (at least 1 upper case &amp;amp, lower case, digit and a special character)" ControlToValidate="editPass" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&amp;*()_+.])[A-Za-z\d!@#$%^&amp;*()_+.]{6,10}$"></asp:RegularExpressionValidator>
                </div>

                <div class=" userd-flex mt-2" style="text-align: center">
                    <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password" CssClass="useridd"></asp:Label>
                    <asp:TextBox ID="editConfirmPass" type="password" runat="server" placeholder="Comfirm Password" CssClass="username mt-3" Style="text-align: center"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="rfvConfirmPass" runat="server" ErrorMessage="Please fill up your [Password] again" ControlToValidate="editConfirmPass" ForeColor="#FF3300" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="Passwords not match" ControlToCompare="editPass" ControlToValidate="editConfirmPass" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:CompareValidator>
                </div>

                <div class=" userd-flex mt-2">
                    <asp:Button ID="updateBtn" runat="server" CssClass="userbtn1 btn-dark" Text="Update" OnClick="updateBtn_Click" />
                </div>
                <div class=" userd-flex mt-2">
                    <asp:Button ID="cancelBtn" runat="server" CssClass="userbtn1 btn-dark" Text="Cancel" CausesValidation="false" OnClick="cancelBtn_Click" />
                </div>

            </div>

        </div>
    </div>
</asp:Content>
