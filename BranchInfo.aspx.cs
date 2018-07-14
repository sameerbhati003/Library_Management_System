using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class BranchInfo : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
          if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }
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
    protected void btnaddbranch_Click(object sender, EventArgs e)
    {
        if(branchnametxt.Text == "" || branchaddtxt.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Field Incomplete');</script>");
        }else
        {
            String branchName = branchnametxt.Text;
            String branchAddress = branchaddtxt.Text;
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM Branches WHERE BranchName='" +
                branchName + "' AND BranchAddress='" + branchAddress + "'";
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Close();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Branch Already Exist');</script>");
            }else
            {
                reader.Close();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "INSERT INTO Branches VALUES ('" + branchName + "','" +
                    branchAddress + "')";
                cmd.ExecuteReader();
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Branch Added Successfully');</script>");
                branchnametxt.Text = "";
                branchaddtxt.Text = "";
            }
            con.Close();
            populateBranchDropdown();
        }
    }
    protected void btnbranchprint_Click(object sender, EventArgs e)
    {
        con.Open();
        int branchID = Convert.ToInt32(ddbranch.SelectedItem.Value);
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT BranchName, BranchAddress FROM Branches WHERE BranchID=" + branchID;
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }
    protected void btnbrfreqborrower_Click(object sender, EventArgs e)
    {
        con.Open();
        int branchID = Convert.ToInt32(ddbranch.SelectedItem.Value);
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT TOP 10 UserFName AS 'First Name', UserLName AS 'Last Name', COUNT(BorrowID) AS Total FROM Borrow, Users " +
            "WHERE BorrowReaderID=UserID AND BorrowBranchID=" + branchID + " GROUP BY UserFName, UserLName";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }
    protected void btnbrmostborrowed_Click(object sender, EventArgs e)
    {
        con.Open();
        int branchID = Convert.ToInt32(ddbranch.SelectedItem.Value);
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT TOP 10 BookName, AuthorName, COUNT(BorrowID) AS Total FROM Borrow, Books, Authors " +
            "WHERE BorrowBookID=BookID AND BorrowBranchID=" + branchID + " AND AuthorID=BookAuthorID GROUP BY BookName, AuthorName";
        SqlDataReader reader = cmd.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();
        con.Close();
    }

    protected void btnprtbook_Click(object sender, EventArgs e)
    {
        
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
        //SqlCommand cmd = new SqlCommand("selectdatabranchbook", con);
        //cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.AddWithValue("@pBranch_Name", txtsrbook.Text);
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