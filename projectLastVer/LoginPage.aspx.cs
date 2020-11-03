using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectLastVer
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from siteuser where username=@username and password=@passwrd", con);
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);
            cmd.Parameters.AddWithValue("@passwrd", Pass.Text);

            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                Session["userID"] = sdr.GetInt32(0);
                Session["is_Admin"] = sdr.GetInt32(7);
                Response.Redirect("homPage.aspx");
            }
            else
            {
                TextBox1.Text = "";
                Pass.Text = "";
                login.InnerText = "Login failed";
            }

            con.Close();
        }
    }
}