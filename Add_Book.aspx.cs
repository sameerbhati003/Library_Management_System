using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Add_Book : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }
        con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
        //if (!Page.IsPostBack)
        //{
        //    populateBranchDropdown();
        //}
    }

    protected void btnaddbook_Click(object sender, EventArgs e)
    {

        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;

        String author = txtBook_Author_Name.Text;
        cmd.CommandText = "SELECT * FROM Authors WHERE AuthorName ='" + author + "'";
        var authorFound = cmd.ExecuteScalar();
        int authorID;
        if (authorFound == null)
        {
            authorID = insertAuthor(author);
        }
        else
        {
            Console.Write(author + " found");
            authorID = Convert.ToInt32(authorFound);
        }


        String publisher = txtBook_Publisher_name.Text;
        cmd.CommandText = "SELECT * FROM Publishers WHERE PublisherName ='" + publisher + "'";
        var publisherFound = cmd.ExecuteScalar();
        int publisherID;
        if (publisherFound == null)
        {
            publisherID = insertPublisher(publisher);
        }
        else
        {
            Console.Write(publisher + " found");
            publisherID = Convert.ToInt32(publisherFound);
        }

        cmd.CommandText = "SELECT * FROM Books WHERE BookName='" + txtBook_Name.Text +
            "' AND BookAuthorID=" + authorID + " AND BookISBN='" + txtBook_ISBN.Text +
            "' AND BookPublisherID=" + publisherID + " AND BookPublishDate='" +
            txtBook_Publication_date.Text + "'";
        var bookExist = cmd.ExecuteScalar();
        int bookID;
        if(bookExist == null)
        {
            cmd.CommandText = "INSERT INTO Books OUTPUT Inserted.BookID VALUES ('" +
            txtBook_Name.Text + "'," + authorID + ",'" + txtBook_ISBN.Text + "'," +
            publisherID + ",'" + txtBook_Publication_date.Text + "','" + txtpublicationaddress.Text+ "')";
            bookID = Convert.ToInt32(cmd.ExecuteScalar());
        }else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Book Already Exist');</script>");
        }
        //Error when string has '
        //cmd.CommandText = "INSERT INTO Books OUTPUT Inserted.BookID VALUES ('" +
        //    txtBook_Name.Text + "'," + authorID + ",'" + txtBook_ISBN.Text + "'," +
        //    publisherID + ",'" + txtBook_Publication_date.Text + "')";
        //int bookID = Convert.ToInt32(cmd.ExecuteScalar());


        //int branchID = Convert.ToInt32(ddBook_Branch.SelectedItem.Value);
        //int quantity = Convert.ToInt32(txtBook_Quantity.Text);
        //cmd.CommandText = "SELECT * FROM Branch_Books WHERE BBranchID=" + branchID +
        //    " AND BBookID=" + bookID + "";
        //var bbFound = cmd.ExecuteScalar();
        //if (bbFound == null)
        //{
        //    addBranchBook(bookID, branchID, quantity);
        //}
        //else
        //{
        //    updateBranchBook(bookID, branchID, quantity);
        //}
        con.Close();
        txtBook_Name.Text = "";
        txtBook_Author_Name.Text = "";
        txtBook_ISBN.Text = "";
        txtBook_Publisher_name.Text = "";
        txtBook_Publication_date.Text = "";
        txtpublicationaddress.Text = "";
        //txtBook_Quantity.Text = "";
        statusLabel.Text = "Book Added Successfully!";
        //int val = Convert.ToInt32(ddBook_Branch.SelectedItem.Value);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Book Added Successfully" + val + "');</script>");
       
        
    }

    protected int insertAuthor(String authorName)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO Authors OUTPUT Inserted.AuthorID VALUES ('" + authorName +"')";
        Console.Write(authorName + " inserted");
        return Convert.ToInt32(cmd.ExecuteScalar());
    }
    protected int insertPublisher(String publisherName)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        Console.Write(publisherName + " inserted");
        cmd.CommandText = "INSERT INTO Publishers (PublisherName) OUTPUT Inserted.PublisherID VALUES ('" + publisherName + "')";
        return Convert.ToInt32(cmd.ExecuteScalar());
    }
    //protected void populateBranchDropdown()
    //{
    //    con.Open();
    //    SqlCommand cmd = con.CreateCommand();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "SELECT * FROM Branches";
    //    SqlDataReader reader = cmd.ExecuteReader();
    //    ddBook_Branch.DataSource = reader;
    //    ddBook_Branch.DataValueField = "BranchID";
    //    ddBook_Branch.DataTextField = "BranchName";
    //    ddBook_Branch.DataBind();
    //    con.Close();

    //}
    protected void addBranchBook(int book, int branch, int q)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO BranchBooks VALUES (" + branch+ "," + book + "," + q + ")";
        cmd.ExecuteNonQuery();
    }
    protected void updateBranchBook(int book, int branch, int q)
    {
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT Total FROM BranchBooks WHERE BBranchID=" + branch + " AND BBookID=" + book + ")";
        int currentTotal = Convert.ToInt32(cmd.ExecuteScalar());
        cmd.CommandText = "UPDATE BranchBooks SET Total=" + (currentTotal + q) + ")";
        cmd.ExecuteNonQuery();
    }
    protected void btnclr_Click(object sender, EventArgs e)
    {
        //int val = Convert.ToInt32(ddBook_Branch.SelectedItem.Value);
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Book Added Successfully" + val + "');</script>");

        txtBook_Name.Text = "";
        txtBook_Author_Name.Text = "";
        txtBook_ISBN.Text = "";
        txtBook_Publisher_name.Text = "";
        txtBook_Publication_date.Text = "";
        txtpublicationaddress.Text = "";
        //txtBook_Quantity.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }

}