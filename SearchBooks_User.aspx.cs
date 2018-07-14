using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SearchBooks_User : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }


    void DataBindGrid()
    {
        SqlCommand cmd = new SqlCommand("selectdata", con);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
    protected void btnsrcbook_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BookName, AuthorName, PublisherName, BookISBN FROM " +
            "Books, Authors, Publishers WHERE BookName LIKE '%" + txtsrbook.Text + "%'" +
            " AND AuthorID=BookAuthorID AND PublisherID=BookPublisherID";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
        txtsrauthor.Text = "";
        txtsrbook.Text = "";
    }

    protected void btnsrcauthor_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT AuthorName, BookName, PublisherName, BookISBN FROM " +
            "Books, Authors, Publishers WHERE AuthorName LIKE '%" + txtsrauthor.Text + "%'" +
            " AND AuthorID=BookAuthorID AND PublisherID=BookPublisherID";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
        txtsrauthor.Text = "";
        txtsrbook.Text = "";
    }
    protected void btnsrcpublisher_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT PublisherName, BookID, BookName, AuthorName, BookISBN FROM " +
            "Books, Authors, Publishers WHERE PublisherName LIKE '%" + txtsrpublisher.Text + "%'" +
            " AND AuthorID=BookAuthorID AND PublisherID=BookPublisherID ORDER BY PublisherName";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
        txtsrauthor.Text = "";
        txtsrbook.Text = "";
    }
}