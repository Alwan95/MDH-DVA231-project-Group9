using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                LoggedIn();
            }
            else
            {
                loggedOut();
            }                          
        }

        protected void logInButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginPage.aspx");
        }

        protected void logOutButton_Click(object sender, EventArgs e)
        {
            loggedOut();
            Session["userID"] = null;
            Response.Redirect("homPage.aspx");

        }

        protected void profileButton_Click(object sender, EventArgs e)
        {
           if (Convert.ToInt32(Session["is_Admin"]) == 0)
            {
                Response.Redirect("user.aspx");
            }
           else if (Convert.ToInt32(Session["is_Admin"]) == 1)
            {
                Response.Redirect("Admin.aspx");
            }
           else
            {
                Response.Redirect("LoginPage.aspx");

            }
        }

        protected void signUpButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUpPage.aspx");
        }
        private void LoggedIn()
        {
            logInButton.Visible = false;
            signUpButton.Visible = false;
            logOutButton.Visible = true;
            profileButton.Visible = true;
        }
        private void loggedOut()
        {
            logInButton.Visible = true;
            signUpButton.Visible = true;
            logOutButton.Visible = false;
            profileButton.Visible = false;
        }
    }
}