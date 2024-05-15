using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class paymentMethodReport : System.Web.UI.Page
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
                case "PaymentFrequency":
                    DrawChart(GetPaymentMethodFrequency(), "Payment Method Frequency");
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



        private Dictionary<string, int> GetPaymentMethodFrequency()
        {
            Dictionary<string, int> paymentMethods = new Dictionary<string, int>();

            using (SqlConnection con = new SqlConnection(cs))
            {
                string sql = "SELECT paymentMethod, COUNT(paymentMethod) AS Frequency FROM Payment " +
                             "GROUP BY paymentMethod";

                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    string paymentMethod = dr["paymentMethod"].ToString();
                    int frequency = Convert.ToInt32(dr["Frequency"]);
                    paymentMethods.Add(paymentMethod, frequency);
                }
            }

            return paymentMethods;
        }
    }
}