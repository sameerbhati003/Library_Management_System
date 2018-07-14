using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SearchCopy : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }

        if (!IsPostBack)
        {
            //DataBindGrid();
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }
    protected void btnsrcbook_Click(object sender, EventArgs e)
    {
        String bookName = txtsrbook.Text;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BookID, BookName, AuthorName, BranchName, Total, COUNT(BorrowID) AS Out " +
                            "FROM BranchBooks INNER JOIN Books ON BBookID = BookID INNER JOIN Authors ON AuthorID = BookAuthorID " +
                            "INNER JOIN Branches ON BBranchID = BranchID LEFT JOIN Borrow ON BorrowBookID = BookID AND BorrowBranchID = BranchID " +
                            "WHERE BookName LIKE '%" + bookName + "%' " +
                            "GROUP BY BookID, BookName, AuthorName, BranchName, Total ORDER BY BookName";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
        txtsrid.Text = "";
        txtsrbook.Text = "";
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //if (dt.Rows.Count > 0)
        //{
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();

        //}
    }

    protected void btnsrcid_Click(object sender, EventArgs e)
    {
        int bookID = 0;
        if(txtsrid.Text != "")
        {
            bookID = Convert.ToInt32(txtsrid.Text);
        }
        
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
       
        cmd.CommandText = "SELECT BookID, BookName, AuthorName, BranchName, Total, COUNT(BorrowID) AS Out " +
                            "FROM BranchBooks INNER JOIN Books ON BBookID = BookID INNER JOIN Authors ON AuthorID = BookAuthorID " +
                            "INNER JOIN Branches ON BBranchID = BranchID LEFT JOIN Borrow ON BorrowBookID = BookID AND BorrowBranchID = BranchID " +
                            "WHERE BookID=" + bookID +
                            " GROUP BY BookID, BookName, AuthorName, BranchName, Total ORDER BY BranchName";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
        txtsrid.Text = "";
        txtsrbook.Text = "";
        //SqlCommand cmd = new SqlCommand("selectdatasrcbookar", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@pBook_Author_Name", txtsrauthor.Text);
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //DataTable dt = new DataTable();
        //da.Fill(dt);
        //if (dt.Rows.Count > 0)
        //{
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();

        //}
    }
}