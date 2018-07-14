using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



    public partial class index : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] != null)
            //{
            //    Response.Redirect("~/AdminDash.aspx");
            //}
        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            DataSet ds=new DataSet();

            SqlConnection con = new SqlConnection("Data Source=DESKTOP-VPEVBIA;Initial Catalog=library_backup;Integrated Security=True");
            con.Open();
            string query = "select * from Users where UserLogin='" + username.Text + "' and UserPassword='" + password.Text + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adp=new SqlDataAdapter(cmd);
            adp.Fill(ds);

            if (ds.Tables[0].Rows.Count>0)
            {
                if(ds.Tables[0].Rows[0]["UserRole"].ToString()=="3"){//superadmin         

                    Session["UserLogin"] = username.Text;
                Response.Redirect("~/extra.aspx"); 

                }
                else if(ds.Tables[0].Rows[0]["UserRole"].ToString()=="2"){//admin

                    Session["UserLogin"] = username.Text;
                Response.Redirect("~/AdminDash.aspx"); 

                }
                else if(ds.Tables[0].Rows[0]["UserRole"].ToString()=="1"){//user
                    Session["UserLogin"] = username.Text;
                Response.Redirect("~/StudentDash.aspx"); 

                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Login Failed');</script>");
           }

        }




    }

    
