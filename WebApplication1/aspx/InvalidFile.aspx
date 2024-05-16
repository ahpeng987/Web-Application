<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvalidFile.aspx.cs" Inherits="WebApplication1.aspx.InvalidFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>404 Error</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" integrity="sha512-cMFn+ZuU7/T57gT1TlJH9ShcQe+7sCf3yLd7IG0JcDDvB6j+Y0QJxtZmnX9r1Mwm0+DRE6J0UxVhU8AmCJcz4w==" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.syncfusion.com/ej2/21.1.35/fluent.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-lg-6 text-center">
                <h1 style="margin-top: 150px;">OOPS, PAGE NOT FOUND. </h1>
                <p class="mt-5" style="text-align: center;">Apologies !! We cannot find the page that you requested.</p>
                <p style="margin-top: -15px;">You may have mis-typed the URL.</p>
                <p style="margin-top: -15px;">Or the page has been removed.</p>
                <p style="margin-top: -15px;">Click on the button below to go back to home page, Thanks!</p>
                <asp:Button ID="btnHome" CssClass="btn btn-outline-dark" Style="width: 100px;" runat="server" Text="Home" OnClick="btnHome_Click" />
            </div>
            <div class="col-lg-6">
                <asp:Image ImageUrl="~/admin/img/404.png" Style="width: 500px; height: 450px;" runat="server" />
            </div>
        </div>
    </form>
    </body>
</html>
