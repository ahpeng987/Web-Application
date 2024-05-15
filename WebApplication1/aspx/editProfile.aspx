<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="editProfile.aspx.cs" Inherits="WebApplication1.aspx.editProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../css/userProfile.css" rel="stylesheet" />

    <!-- Profile starts -->
    <div class="usercontainer mt-4 mb-4 p-3 d-flex justify-content-center">
        <div class="usercard p-4">
            <div class=" userimage d-flex flex-column justify-content-center align-items-center">
                <button class="userbtn btn-secondary">
                    <img src="../img/user.jpg" height="100" width="100" /></button>

                <div class=" userd-flex mt-2" style="text-align: center">
                    <asp:Label ID="lblEditProfile" runat="server" Text="Edit Profile" CssClass="username mt-3"></asp:Label>
                </div>

                <div class=" userd-flex mt-2" style="text-align: center">
                    <asp:Label ID="lblName" runat="server" Text="Username" CssClass="useridd"></asp:Label>
                    <asp:TextBox ID="editName" runat="server" Text="<%= userName %>" CssClass="username mt-3" Style="text-align: center"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Please Fill Up Your Username !!" ControlToValidate="editName" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revUsername" runat="server" ErrorMessage="Please Enter Alphabet Only !!" ControlToValidate="editName" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvUsername" runat="server" ErrorMessage="This [Username] has been used !!" Display="Dynamic" ControlToValidate="editName" Font-Bold="True" ForeColor="Red" OnServerValidate="cvUsername_ServerValidate"></asp:CustomValidator>
                </div>
                <div class=" userd-flex mt-2" style="text-align: center">
                    <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="useridd"></asp:Label>
                    <asp:TextBox ID="editEmail" runat="server" Text="<%= userEmail %>" CssClass="username mt-3" Style="text-align: center"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Please Fill Up Your [Email] !!" ControlToValidate="editEmail" ForeColor="Red" Display="Dynamic" Font-Bold="True"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter [Email] with &quot;@&quot; !!" ControlToValidate="editEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" Display="Dynamic" Font-Bold="True"></asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="cvEmail" runat="server" ErrorMessage="This [Email] has been used !!" ControlToValidate="editEmail" Display="Dynamic" Font-Bold="True" ForeColor="Red" OnServerValidate="cvEmail_ServerValidate"></asp:CustomValidator>
                </div>
                <div class=" userd-flex mt-2">
                    <asp:Button ID="updateBtn" runat="server" CssClass="userbtn1 btn-dark" Text="Update" OnClick="updateBtn_Click" />
                </div>
                <div class=" userd-flex mt-2">
                    <asp:Button ID="cancelBtn" runat="server" CssClass="userbtn1 btn-dark" Text="Cancel" OnClick="cancelBtn_Click" />
                </div>

            </div>

        </div>
    </div>
</asp:Content>
