using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class ReaderStat : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }
        populateStats();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }
    protected void populateStats()
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT UserFName,UserLName,UserLogin,COUNT(BorrowID) AS TotalBorrows, COUNT(ReserveID)AS TotalReserve, AVG(Fine) AS AvgFine " +
                            "FROM Users LEFT JOIN Borrow ON BorrowReaderID = UserID LEFT JOIN Reserve ON ReserveReaderID = UserID " +
                            "WHERE UserRole = 1 GROUP BY UserFName, UserLName, UserLogin";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }
}