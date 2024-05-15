<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PaymentConfirmation.aspx.cs" Inherits="WebApplication1.aspx.PaymentConfirmation" enableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <link href="../css/style.css" rel="stylesheet" />
<link href="../css/style.min.css" rel="stylesheet" />
    <h2>Payment Confirmation</h2>
    <div>
        <p>Thank you for your purchase!</p>
        <asp:Button ID="btnConfirmPayment" runat="server" Text="Confirm Payment" OnClick="btnConfirmPayment_Click" />
    </div>

</asp:Content>
