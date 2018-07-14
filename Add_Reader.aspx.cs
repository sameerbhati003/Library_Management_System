using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Add_Reader : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome " + Session["UserLogin"].ToString();
        }
        con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT TOP 1 * FROM Users ORDER BY UserID DESC";
        SqlDataReader reader = cmd.ExecuteReader();
        reader.Read();
        txtstudent_id.Text = (reader.GetInt32(0) + 1).ToString();
        con.Close();

    }

    protected void btnaddrdr_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO Users VALUES ('" + txtReader_Username.Text 
            + "', '" + txtReader_Password.Text + "', '"
            + txtReader_Fname.Text + "', '" + txtReader_Lname.Text + "', '"
            + txtReader_Address.Text + "', '" + txtReader_Phone.Text + "', '1', '" + txtReader_Email.Text + "')";
        cmd.ExecuteNonQuery();
        con.Close();

        Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>if(!alert('Alert For your User!')){window.location = window.location.href;}</script>");

    }

    protected void btnclrrdr_Click(object sender, EventArgs e)
    {
        txtstudent_id.Text = "";
        txtReader_Fname.Text = "";
        txtReader_Lname.Text = "";
        txtReader_Address.Text = "";
        txtReader_Phone.Text = "";
        txtReader_Email.Text = "";
        txtReader_Username.Text = "";
        txtReader_Password.Text = "";
        txtroleid.Text = "";
    }
}