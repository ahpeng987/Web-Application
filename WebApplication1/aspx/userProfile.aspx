<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="userProfile.aspx.cs" Inherits="WebApplication1.aspx.userProfile" %>

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
                <asp:Label ID="lblName" runat="server" Text="<%= userName %>" CssClass="username mt-3"></asp:Label>
                <asp:Label ID="lblEmail" runat="server" Text="<%= userEmail %>" CssClass="useridd"></asp:Label>

                <div class=" userd-flex mt-2">
                    <asp:Button ID="editProfile" runat="server" Text="Edit Profile" CssClass="userbtn1 btn-dark" OnClick="editProfile_Click" />
                </div>
                <div class=" userd-flex mt-2">
                    <asp:Button ID="changePass" runat="server" Text="Change Password" CssClass="userbtn1 btn-dark" OnClick="changePass_Click"/>
                </div>
                <div class=" userd-flex mt-2">
                    <asp:Button ID="viewOrder" runat="server" Text="My Orders" CssClass="userbtn1 btn-dark" OnClick="viewOrder_Click" />
                </div>
                <div class=" userd-flex mt-2">
                    <asp:Button ID="logoutBtn" runat="server" CssClass="userbtn1 btn-dark" Text="Log Out" OnClick="logoutBtn_Click" />
                </div>

            </div>

        </div>
    </div>
</asp:Content>
