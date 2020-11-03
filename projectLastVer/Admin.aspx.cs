using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace projectLastVer
{
    public partial class Admin : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
           if ( Session["userID"]==null )
            {
                Response.Redirect("LoginPage.aspx");
            }
           else
            {
                if (Convert.ToInt32(Session["is_Admin"]) == 0)
                {
                    Response.Redirect("user.aspx");
                }
            }
        }
    }
}