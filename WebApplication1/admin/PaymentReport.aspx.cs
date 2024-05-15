using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.admin
{
    public partial class PaymentReport : System.Web.UI.Page
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
            else
            {

            }

            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void BindGridView()
        {

            string query = "SELECT p.paymentID, u.userName, p.amount, p.paymentMethod, p.paymentDate FROM Payment p INNER JOIN [User] u ON p.userID = u.userID";

            using (SqlConnection connection = new SqlConnection(cs))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();

                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        GridView1.DataSource = dataTable;
                        GridView1.DataBind();
                    }
                    else
                    {
                        // Display a message if no data is found
                        // e.g., lblMessage.Text = "No data found.";
                    }
                }
            }
        }




    }
}