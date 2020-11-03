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
    public partial class SignUpPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from country", con);

            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                while (sdr.Read())
                {
                    sigUpCountryDropDown.Items.Add(sdr.GetString(1));
                }
            }
            // Button1.Enabled = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from siteuser where username=@username", con);
            cmd.Parameters.AddWithValue("@username", TextBox3.Text);

            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.Read())
            {
                signup.InnerText = "Username taken";
                con.Close();
                return;
            }
            con.Close();

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString);
            con.Open();
            cmd = new SqlCommand("insert into siteuser (name, surname, username, email, password, country_id, is_Admin) values (@name, @surname, @username, @email, @password,@country,0);", con);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@surname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@username", TextBox3.Text);
            cmd.Parameters.AddWithValue("@email", TextBox4.Text);
            cmd.Parameters.AddWithValue("@password", TextBox5.Text);
            cmd.Parameters.AddWithValue("@country", sigUpCountryDropDown.SelectedIndex);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("LoginPage.aspx");
        }
    }
}