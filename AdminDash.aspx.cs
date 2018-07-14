using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class AdminDash : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserLogin"] != null)
        {
            Label1.Text = "Welcome   " + Session["UserLogin"].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session.Remove("UserLogin");
        Response.Redirect("~/index.aspx");
    }
}