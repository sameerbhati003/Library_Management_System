using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Adminreturnbook : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
    int readerID;
    int bookID;
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
        if (!IsPostBack)
        {
            populateBookList();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }

    protected void btnsrcbook_click(object sender, EventArgs e)
    {
        bookID = Convert.ToInt32(ddbookname.SelectedItem.Value);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BorrowID ,BookName,AuthorName, BranchName, DueDate,Fine FROM Books, Authors, Borrow, Branches WHERE BorrowReaderID=" +
            readerID + " AND BookID=BorrowBookID AND AuthorID=BookAuthorID AND BorrowBranchID=BranchID AND ReturnDate IS NULL AND "+
            "BookID=" + bookID;
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }
    protected void btnreturn_click(object sender, EventArgs e)
    {
        if(bookID == 0)
        {
            bookID = Convert.ToInt32(ddbookname.SelectedItem.Value);
        }
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE Borrow SET ReturnDate=GETDATE() WHERE BorrowID=" +
                                "(SELECT TOP 1 BorrowID FROM Borrow WHERE BorrowBookID=" +
                                bookID + " AND BorrowReaderID=" + readerID + ")";
        cmd.ExecuteNonQuery();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Book Returned Successfully'); window.location.href = window.location.href;</script>");
        con.Close();
    }
    protected void populateBookList()
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BookName, BookID FROM Books, Borrow WHERE BookID=BorrowBookID AND ReturnDate IS NULL AND "+
                                "BorrowReaderID=" + readerID;
        SqlDataReader reader = cmd.ExecuteReader();
        ddbookname.DataSource = reader;
        ddbookname.DataValueField = "BookID";
        ddbookname.DataTextField = "BookName";
        ddbookname.DataBind();
        con.Close();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gr = GridView1.SelectedRow;
        txtborrowid.Text = gr.Cells[1].Text;
    }
}