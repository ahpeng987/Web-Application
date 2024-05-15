<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentLoading.aspx.cs" Inherits="WebApplication1.aspx.PaymentLoading" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Processing</title>
<style>
  body {
    font-family: Arial, sans-serif;
    text-align: center;
  }
  .hidden {
    display: none;
  }
</style>
</head>
<body>
    <form runat="server">
    <asp:HiddenField ID="hiddenOrderID" runat="server" />
        </form>
<div id="loading">
  <img src="../assets_1/time.gif" alt="Loading">
  <p>Please wait while the payment is being processed...</p>
</div>
<div id="success" class="hidden">
  <img src="../assets_1/loading-the-truck.gif" alt="Success">
  <p>Your payment has been completed. You will be redirected to the Order Page in <span id="countdown">5</span> seconds.</p>
</div>
<script>
     // Retrieve orderID from hidden field
     var orderID = document.getElementById('<%= hiddenOrderID.ClientID %>').value;
     var redirectUrl = 'orderDetails.aspx?orderID=' + orderID;

     setTimeout(function () {
         // Hide loading, show success
         document.getElementById('loading').classList.add('hidden');
         document.getElementById('success').classList.remove('hidden');
         countdown();
         // Redirect after 10 seconds
         setTimeout(function () {
             window.location.href = redirectUrl;
         }, 10000);
     }, 5000);

     // Countdown function
     function countdown() {
         var seconds = 10;
         var countdownElement = document.getElementById('countdown');
         var countdownInterval = setInterval(function () {
             seconds--;
             countdownElement.textContent = seconds;
             if (seconds <= 0) {
                 clearInterval(countdownInterval);
             }
         }, 1000);
     }
</script>
</body>
</html>