using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminbookIssue : System.Web.UI.Page
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
            txtrdrstudentid.Text = readerID.ToString();
            con.Close();
        }
        if (!Page.IsPostBack)
        {
            populateBookCombo();
        }
       
        initDates();
    }
    protected void btnsrcbook_Click(object sender, EventArgs e)
    {
        //int i = 0;
        //SqlCommand cmd = con.CreateCommand();
        //cmd.CommandType = CommandType.Text;
        //cmd.CommandText = "select * from Add_Reader_login where Reader_Studentid='"+ txtrdrstudentid.Text +"'";
        //cmd.ExecuteNonQuery();
        //DataTable dt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter(cmd);
        //da.Fill(dt);
        //i = Convert.ToInt32(dt.Rows.Count.ToString());

        //if (i == 0)
        //{
        //    Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Not Found');</script>");
        //}
        //else
        //{
        //    foreach (DataRow dr in dt.Rows)
        //    {
        //        txtrdrfname.Text = dr["Reader_FName"].ToString();
        //        txtrdrlname.Text = dr["Reader_LName"].ToString();
        //        txtrdrphone.Text = dr["Reader_Phone"].ToString();
        //        txtredemail.Text = dr["Reader_Email"].ToString();
        //        txtrdrusername.Text = dr["Reader_Username"].ToString();

        //    }
        //}
    }
    protected void btnsrcauthor_Click(object sender, EventArgs e)
    {
        int bookID = Convert.ToInt32(bookCombo.SelectedItem.Value);
        int branchID = Convert.ToInt32(DropDownList1.SelectedItem.Value);
        int readerID = Convert.ToInt32(txtrdrstudentid.Text);
        if(checkReaderLimit(readerID) >= 10)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Borrow and Reserve Limit Reached'); window.location.href = window.location.href;</script>");
            return;
        }
        DateTime current = DateTime.Now.Date;
        DateTime due = current.AddDays(20);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE BranchBooks SET Total = Total - 1 WHERE BBookID=" +
                                bookID + " AND BBranchID=" + branchID;
        cmd.ExecuteNonQuery();
        cmd.CommandText = "INSERT INTO Borrow (BorrowReaderID, BorrowBranchID, BorrowBookID, " +
                               "IssueDate, DueDate) VALUES (" + readerID + "," + branchID + "," +
                               bookID + ",GETDATE(),DATEADD(day,20,GETDATE()))";
        cmd.ExecuteNonQuery();
        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Books Added Successfully'); window.location.href = window.location.href;</script>");
        
        
    }
    protected int checkReaderLimit(int readerID)
    {
        int total = 0;
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT COUNT(BorrowID) FROM Borrow WHERE BorrowReaderID=" +
                            readerID + " AND ReturnDate IS NULL";
        total += Convert.ToInt32(cmd.ExecuteScalar());
        cmd.CommandText = "SELECT COUNT(ReserveID) FROM Reserve WHERE ReserveReaderID=" +
                            readerID;
        total += Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return total;
    }
    protected void populateBookCombo()
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Books, BranchBooks WHERE BookID=BBookID AND Total > 0";
        SqlDataReader reader = cmd.ExecuteReader();
        bookCombo.DataSource = reader;
        bookCombo.DataValueField = "BookID";
        bookCombo.DataTextField = "BookName";
        bookCombo.DataBind();
        con.Close();
    }
    protected void combo_textChanged(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Books WHERE BookName LIKE '" + 
            bookCombo.Text + "%'";
        SqlDataReader reader = cmd.ExecuteReader();
        bookCombo.DataSource = reader;
        bookCombo.DataValueField = "BookID";
        bookCombo.DataTextField = "BookName";
        bookCombo.DataBind();
        con.Close();
    }
    //protected void bookList_TextChanged(object sender, EventArgs e)
    //{
    //    String text = bookList.Text;
    //    con.Open();
    //    SqlCommand cmd = con.CreateCommand();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "SELECT * FROM Books WHERE BookName LIKE " + text + "%";
    //    SqlDataReader reader = cmd.ExecuteReader();
    //    bookList.DataSource = reader;
    //    bookList.DataValueField = "BookID";
    //    bookList.DataTextField = "BookName";
    //    bookList.DataBind();
    //    con.Close();
    //}
    //protected void populateBookList()
    //{
    //    con.Open();
    //    SqlCommand cmd = con.CreateCommand();
    //    cmd.CommandType = CommandType.Text;
    //    cmd.CommandText = "SELECT * FROM Books";
    //    SqlDataReader reader = cmd.ExecuteReader();
    //    bookList.DataSource = reader;
    //    bookList.DataValueField = "BookID";
    //    bookList.DataTextField = "BookName";
    //    bookList.DataBind();
    //    con.Close();
    //}
    protected void btnsearch_click(object sender, EventArgs e)
    {
        DropDownList1.Visible = true;
        int bookID = Convert.ToInt32(bookCombo.SelectedItem.Value);
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM BranchBooks, Branches WHERE BBookID=" + bookID +
            " AND BBranchID=BranchID AND Total > 0";
        SqlDataReader reader = cmd.ExecuteReader();
        DropDownList1.DataSource = reader;
        DropDownList1.DataValueField = "BBranchID";
        DropDownList1.DataTextField = "BranchName";
        DropDownList1.DataBind();       
        con.Close();
    }
    protected void initDates()
    {
        DateTime current = DateTime.Now.Date;
        DateTime due = current.AddDays(20);
        txtbookissuedate.Text = current.ToShortDateString();
        txtbookduedate.Text = due.ToShortDateString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("user_name");
        Response.Redirect("~/index.aspx");
    }

   
    
    
}