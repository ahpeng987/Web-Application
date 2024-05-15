using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class productReport : System.Web.UI.Page
    {
        DatabaseEntities db = new DatabaseEntities();

        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminName"] != null)
            {
                string adminname = Session["adminName"].ToString();
                lblWelcomeMessage.Text = adminname;
            }
        }

        protected void btnPerformAction_Click(object sender, EventArgs e)
        {
            string action = ddlAction.SelectedValue;

            switch (action)
            {
                case "TopSales":
                    DrawChart(GetTopSalesProducts(), "Top Sales");
                    break;
                case "LeastSales":
                    DrawChart(GetLeastSalesProducts(), "Least Sales");
                    break;
                default:
                    actionResult.InnerText = "Invalid action selected.";
                    break;
            }
        }

        private void DrawChart(Dictionary<string, int> data, string chartTitle)
        {
            string script = "<script type='text/javascript'>" +
                            "google.charts.load('current', { 'packages': ['corechart'] });" +
                            "google.charts.setOnLoadCallback(drawChart);" +
                            "function drawChart() {" +
                            "var data = new google.visualization.DataTable();" +
                            "data.addColumn('string', 'Product');" +
                            "data.addColumn('number', 'Count');" +
                            "data.addRows([";

            foreach (var item in data)
            {
                script += "['" + item.Key + "', " + item.Value + "],";
            }

            script = script.TrimEnd(',') + "]);";

            script += "var options = {" +
                      "'title': '" + chartTitle + "'," +
                      "'width': 800," +
                      "'height': 600," +
                      "'vAxis': {format: '0'}" + // Format y-axis labels as integers
                      "};" +
                      "var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));" +
                      "chart.draw(data, options);" +
                      "}" +
                      "</script>";

            actionResult.InnerHtml = "<div id='chart_div'></div>" + script;
        }


        private Dictionary<string, int> GetTopSalesProducts()
        {
            Dictionary<string, int> products = new Dictionary<string, int>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "SELECT Top 5 prodName, COUNT(prodName) AS SalesCount FROM Product " +
                               "INNER JOIN OrderItem ON Product.prodID = OrderItem.prodID " +
                               "GROUP BY Product.prodName " +
                               "ORDER BY SalesCount DESC";

                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string productName = dr["prodName"].ToString();
                    int salesCount = Convert.ToInt32(dr["SalesCount"]);
                    products.Add(productName, salesCount);
                }

            }

            return products;
        }

        private Dictionary<string, int> GetLeastSalesProducts()
        {
            Dictionary<string, int> products = new Dictionary<string, int>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "SELECT Top 5 prodName, COUNT(prodName) AS SalesCount FROM Product " +
                               "INNER JOIN OrderItem ON Product.prodID = OrderItem.prodID " +
                               "GROUP BY Product.prodName " +
                               "ORDER BY SalesCount ASC";

                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string productName = dr["prodName"].ToString();
                    int salesCount = Convert.ToInt32(dr["SalesCount"]);
                    products.Add(productName, salesCount);
                }

            }

            return products;
        }

    }
}