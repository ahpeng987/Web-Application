using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class feedbackReport : System.Web.UI.Page
    {
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
                case "MostFeedback":
                    DrawChart(GetMostAppearedProducts(), "Most Feedback");
                    break;
                case "LeastFeedback":
                    DrawChart(GetLeastAppearedProducts(), "Least Feedback");
                    break;
                case "BestRating":
                    DrawChart(GetBestRatedProducts(), "Best Rating");
                    break;
                case "LeastRating":
                    DrawChart(GetLeastRatedProducts(), "Least Rating");
                    break;
                default:
                    actionResult.InnerText = "Invalid action selected.";
                    break;
            }
        }

        // Method to draw the Google Chart
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
                      "'height': 600" + 
                      "};" +
                      "var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));" +
                      "chart.draw(data, options);" +
                      "}" +
                      "</script>";

            actionResult.InnerHtml = "<div id='chart_div'></div>" + script;
        }

        // Method to retrieve most appeared products from the database
        private Dictionary<string, int> GetMostAppearedProducts()
        {
            Dictionary<string, int> products = new Dictionary<string, int>();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT prodName, COUNT(prodName) AS AppearanceCount FROM Product " +
                               "INNER JOIN Rating ON Product.prodID = Rating.prodID " +
                               "GROUP BY Product.prodName " +
                               "ORDER BY AppearanceCount DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string productName = reader["prodName"].ToString();
                    int count = Convert.ToInt32(reader["AppearanceCount"]);
                    products.Add(productName, count);
                }
            }

            return products;
        }

        // Method to retrieve least appeared products from the database
        private Dictionary<string, int> GetLeastAppearedProducts()
        {
            Dictionary<string, int> products = new Dictionary<string, int>();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT prodName, COUNT(prodName) AS AppearanceCount FROM Product " +
                               "INNER JOIN Rating ON Product.prodID = Rating.prodID " +
                               "GROUP BY Product.prodName " +
                               "ORDER BY AppearanceCount";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string productName = reader["prodName"].ToString();
                    int count = Convert.ToInt32(reader["AppearanceCount"]);
                    products.Add(productName, count);
                }
            }

            return products;
        }

        // Method to retrieve best rated products from the database
        private Dictionary<string, int> GetBestRatedProducts()
        {
            Dictionary<string, int> products = new Dictionary<string, int>();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT prodName, MAX(ratingValue) AS MaxRating FROM Product " +
                               "INNER JOIN Rating ON Product.prodID = Rating.prodID " +
                               "GROUP BY Product.prodName " +
                               "ORDER BY MaxRating DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string productName = reader["prodName"].ToString();
                    int rating = Convert.ToInt32(reader["MaxRating"]);
                    products.Add(productName, rating);
                }
            }

            return products;
        }

        // Method to retrieve least rated products from the database
        private Dictionary<string, int> GetLeastRatedProducts()
        {
            Dictionary<string, int> products = new Dictionary<string, int>();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT prodName, MIN(ratingValue) AS MinRating FROM Product " +
                               "INNER JOIN Rating ON Product.prodID = Rating.prodID " +
                               "GROUP BY Product.prodName " +
                               "ORDER BY MinRating";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    string productName = reader["prodName"].ToString();
                    int rating = Convert.ToInt32(reader["MinRating"]);
                    products.Add(productName, rating);
                }
            }

            return products;
        }
    }
}
