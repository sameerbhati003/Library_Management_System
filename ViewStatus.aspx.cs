using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class ViewStatus : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
    int readerID;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT UserID FROM Users WHERE UserLogin='" + Session["UserLogin"].ToString()
                + "'";
            readerID = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
        }
        getBorrowed();
        getReserved();
    }
    protected void getBorrowed()
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE Borrow SET Fine = DATEDIFF(day,DueDate,GETDATE()) * .20 " +
                                "WHERE DATEDIFF(day,DueDate,GETDATE()) > 0 ";
        cmd.ExecuteNonQuery();
        cmd.CommandText = "SELECT BookName,AuthorName, BranchName, DueDate,Fine FROM Books, Authors, Borrow, Branches WHERE BorrowReaderID=" + 
            readerID + " AND BookID=BorrowBookID AND AuthorID=BookAuthorID AND BorrowBranchID=BranchID AND ReturnDate IS NULL";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }
    protected void getReserved()
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BookName,AuthorName,BranchName FROM Branches,Books, Authors, Reserve WHERE ReserveReaderID=" +
            readerID + " AND BookID=ReserveBookID AND AuthorID=BookAuthorID AND ReserveBranchID=BranchID";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView2.DataSource = reader;
        GridView2.DataBind();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }
    
}