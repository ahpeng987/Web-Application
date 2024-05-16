
using iTextSharp.text;
using iTextSharp.text.pdf;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace WebApplication1.aspx
{

    public partial class DownloadPDF : System.Web.UI.Page
    {

        private string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["orderID"]) && int.TryParse(Request.QueryString["orderID"], out int orderID))
            {
                byte[] pdfData = GeneratePDF(orderID);

                if (pdfData != null)
                {
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", $"attachment; filename=OrderDetails_{orderID}.pdf");
                    Response.BinaryWrite(pdfData);
                    Response.End();
                }
            }
        }

        private byte[] GeneratePDF(int orderID)
        {
            byte[] pdfBytes = null;

            try
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    Document document = new Document();
                    PdfWriter writer = PdfWriter.GetInstance(document, ms);
                    document.Open();

                    // Font settings for the document
                    Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLACK);
                    Font headingFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);
                    Font contentFont = FontFactory.GetFont(FontFactory.HELVETICA, 10, BaseColor.BLACK);

                    // Title
                    Paragraph title = new Paragraph("Order Details", titleFont);
                    title.Alignment = Element.ALIGN_CENTER;
                    document.Add(title);
                    document.Add(Chunk.NEWLINE);

                    // Order Items table
                    PdfPTable table = new PdfPTable(4);
                    table.WidthPercentage = 100;
                    table.SetWidths(new float[] { 50f, 30f, 10f, 30f }); // Column widths

                    PdfPCell cell = new PdfPCell(new Phrase("Product", headingFont));
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    table.AddCell(cell);

                    cell = new PdfPCell(new Phrase("Color", headingFont));
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    table.AddCell(cell);

                    cell = new PdfPCell(new Phrase("Qty", headingFont));
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    table.AddCell(cell);

                    cell = new PdfPCell(new Phrase("Price", headingFont));
                    cell.HorizontalAlignment = Element.ALIGN_CENTER;
                    table.AddCell(cell);

                    // Fetch order items from database and populate table
                    DataTable orderItems = GetOrderItems(orderID);

                    if (orderItems != null && orderItems.Rows.Count > 0)
                    {
                        foreach (DataRow row in orderItems.Rows)
                        {
                            string productName = row["prodName"].ToString();
                            string productColor = row["prodColor"].ToString();
                            int orderQty = Convert.ToInt32(row["orderQty"]);
                            decimal unitPrice = Convert.ToDecimal(row["unitPrice"]);

                            table.AddCell(new Phrase(productName, contentFont));
                            table.AddCell(new Phrase(productColor, contentFont));
                            table.AddCell(new Phrase(orderQty.ToString(), contentFont));
                            table.AddCell(new Phrase(unitPrice.ToString("C"), contentFont));
                        }

                        document.Add(table);
                        document.Add(Chunk.NEWLINE);

                        // Total Amount
                        decimal totalAmount = GetOrderTotal(orderID);
                        Paragraph totalParagraph = new Paragraph($"Total Amount: {totalAmount:C}", headingFont);
                        totalParagraph.Alignment = Element.ALIGN_RIGHT;
                        document.Add(totalParagraph);
                    }
                    else
                    {
                        // No items found
                        Paragraph noItemsParagraph = new Paragraph("No items found for this order.", contentFont);
                        document.Add(noItemsParagraph);
                    }

                    document.Close();
                    pdfBytes = ms.ToArray();
                }
            }
            catch (Exception ex)
            {
                Response.Write($"Error generating PDF: {ex.Message}");
            }

            return pdfBytes;
        }

        private DataTable GetOrderItems(int orderID)
        {
            // Fetch order items from database based on orderID
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT prodName, prodColor, orderQty, unitPrice FROM OrderItem INNER JOIN Product ON OrderItem.prodID = Product.prodID WHERE orderID = @OrderID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@OrderID", orderID);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            return dt;
        }

        private decimal GetOrderTotal(int orderID)
        {
            // Calculate total amount for the order based on orderID
            decimal totalAmount = 0;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT totalAmt FROM [Order] WHERE orderID = @OrderID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@OrderID", orderID);

                con.Open();
                object result = cmd.ExecuteScalar();

                if (result != null && result != DBNull.Value)
                {
                    totalAmount = Convert.ToDecimal(result);
                }
            }

            return totalAmount;
        }
    }

}