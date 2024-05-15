    <%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebApplication1.aspx.Order" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Page</title>
        <!-- Include jQuery library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

       <script>
           function showCancelModal(orderID) {
               $('#cancelOrderModal').modal('show');  // Show the modal with ID 'cancelOrderModal'
               $('#orderIDHidden').val(orderID);     // Set the value of hidden field 'orderIDHidden'
           }

           function submitCancellationRequest() {
               var orderID = $('#orderIDHidden').val();
               var reason = $('#txtCancellationReason').val();

               $.ajax({
                   type: "POST",
                   url: "Order.aspx/SubmitCancellationRequest",
                   contentType: "application/json; charset=utf-8",
                   data: JSON.stringify({ orderID: orderID, reason: reason }),
                   success: function (response) {
                       alert('Cancellation request submitted successfully!');
                       $('#cancelOrderModal').modal('hide');
                   },
                   error: function (error) {
                       console.log(error);
                       alert('Failed to submit cancellation request.');
                   }
               });
           }



       </script>
    </asp:Content>


    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container">
            <h2 class="my-4">Your Orders</h2>
            <div class="row">
                <div class="col-md-8">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Order ID</th>
                                <th scope="col">Date</th>
                                <th scope="col">Total Amount</th>
                                <th scope="col">Delivery Status</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder runat="server" ID="ordersPlaceholder" />
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5">
                                    <button type="button" class="btn btn-secondary" onclick="window.location.href='index.aspx';">
                                        Back to Home Page
                                    </button>
                                    
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

       <!-- Add the modal for cancellation -->
     <!-- Cancel Order Modal -->
    <div class="modal fade" id="cancelOrderModal" tabindex="-1" role="dialog" aria-labelledby="cancelOrderModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="cancelOrderModalLabel">Cancel Order</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="cancelReason">Reason for Cancellation:</label>
                        <textarea class="form-control" id="txtCancellationReason" rows="3"></textarea>
                        <asp:HiddenField ID="orderIDHidden" runat="server" ClientIDMode="Static" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnSubmitCancellation" runat="server" Text="Submit" CssClass="btn btn-primary" OnClientClick="submitCancellationRequest(); return false;" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>



        

    </asp:Content>
