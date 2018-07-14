using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class AddCopy : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }
        con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
        if (!Page.IsPostBack)
        {
            populateBranchDropdown();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }
    protected void btnsrcbook_Click(object sender, EventArgs e)
    {
        con.Open();
        int bookID = Convert.ToInt32(bookidtxt.Text);
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BookName, AuthorName FROM Books, Authors WHERE BookID=" + bookID +
            " AND BookAuthorID=AuthorID";
        SqlDataReader reader = cmd.ExecuteReader();
        if(!reader.HasRows)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Book Does Not Exist');</script>");
        }else
        {
            reader.Read();
            booktitletxt.Text = reader["BookName"].ToString();
            bookauthortxt.Text = reader["AuthorName"].ToString();
        }
        con.Close();
    }
    protected void btnaddcopy_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BookID FROM Books, Authors WHERE BookName='" +
            booktitletxt.Text + "' AND AuthorID=BookAuthorID AND AuthorName='" +
            bookauthortxt.Text + "'";
        int bookID = Convert.ToInt32(cmd.ExecuteScalar());
        int branchID = Convert.ToInt32(ddbranch.SelectedItem.Value);
        int quantity = Convert.ToInt32(quantitytxt.Text);
        cmd.CommandText = "SELECT * FROM BranchBooks WHERE BBranchID=" + branchID +
            " AND BBookID=" + bookID + "";
        var bbFound = cmd.ExecuteScalar();
        if (bbFound == null)
        {
            addBranchBook(bookID, branchID, quantity);
        }
        else
        {
            updateBranchBook(bookID, branchID, quantity);
        }
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Copy Added');</script>");
        bookidtxt.Text = "";
        booktitletxt.Text = "";
        bookauthortxt.Text = "";
        con.Close();
    }
    protected void populateBranchDropdown()
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Branches";
        SqlDataReader reader = cmd.ExecuteReader();
        ddbranch.DataSource = reader;
        ddbranch.DataValueField = "BranchID";
        ddbranch.DataTextField = "BranchName";
        ddbranch.DataBind();
        con.Close();
    }
    protected void addBranchBook(int book, int branch, int q)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO BranchBooks VALUES (" + branch + "," + book + "," + q + ")";
        cmd.ExecuteNonQuery();
    }
    protected void updateBranchBook(int book, int branch, int q)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT Total FROM BranchBooks WHERE BBranchID=" + branch + " AND BBookID=" + book + ")";
        int currentTotal = Convert.ToInt32(cmd.ExecuteScalar());
        cmd.CommandText = "UPDATE Branch_Books SET Total=" + (currentTotal + q) + ")";
        cmd.ExecuteNonQuery();
    }
}