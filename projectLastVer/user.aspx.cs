using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
namespace projectLastVer
{
    public partial class user : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString;
        int userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("LoginPage.aspx");
            }
            else
            {
                if (Convert.ToInt32(Session["is_Admin"]) != 0)
                {
                    Response.Redirect("homPage.aspx");
                }
                 userID = Convert.ToInt32(Session["userID"]) ;
                getUserInformation(userID);
                getUserRecipes();
                fillCategoryList();
                fillUnitsDropDown();
            }
        }
        private void getUserInformation(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("getUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", id);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                DataRow dr = dt.Rows[0];
                userName.InnerText = dr["username"].ToString();
                userCountry.InnerText = dr["countryName"].ToString();
                userEmail.InnerText = dr["email"].ToString();
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            string imgPath = "";
            if (imagedUploaded.HasFile)
            {
                string fileName = Path.Combine(Server.MapPath("~/images"), userName.InnerText+ imagedUploaded.FileName);
                imagedUploaded.SaveAs(fileName);
                imgPath = "images/" + userName.InnerText + imagedUploaded.FileName;

            }
            string title = nameInput.Text.ToString();
            int category = Convert.ToInt32( selectCategory.SelectedValue);
            string description = descriptionInput.Text.ToString();
            string img= imgPath;
            string ingredients = showIngList.Text.ToString();
            string instruction = InstructionsTxt.Text.ToString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("insertRecipe", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@descrition", description);
                cmd.Parameters.AddWithValue("@instruction", instruction);
                cmd.Parameters.AddWithValue("@userId", userID);
                cmd.Parameters.AddWithValue("@categoryId", category);
                cmd.Parameters.AddWithValue("@imgUrl", img);
                cmd.Parameters.AddWithValue("@ingredients", ingredients);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            Response.Redirect(Request.RawUrl);

        }
        private void fillCategoryList( )
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                selectCategory.DataSource = dt;
                selectCategory.DataBind();
                selectCategory.DataTextField = "name";
                selectCategory.DataValueField = "id";
                selectCategory.DataBind();

                editRecipe_selectCategory.DataSource = dt;
                editRecipe_selectCategory.DataBind();
                editRecipe_selectCategory.DataTextField = "name";
                editRecipe_selectCategory.DataValueField = "id";
                editRecipe_selectCategory.DataBind();
                con.Close();
            }
        }
        private void fillUnitsDropDown()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("select * from unit", con);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                selectUnits.DataSource = dt;
                selectUnits.DataBind();
                selectUnits.DataTextField = "name";
                selectUnits.DataValueField = "id";
                selectUnits.DataBind();
                UnitsEditRecipes.DataSource = dt;
                UnitsEditRecipes.DataBind();
                UnitsEditRecipes.DataTextField = "name";
                UnitsEditRecipes.DataValueField = "id";
                UnitsEditRecipes.DataBind();
                con.Close();
            }
        }
        private void getUserRecipes()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("getUserRecipes", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userId", userID);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                con.Close();
                userRecipesRepeater.DataSource = dt;
                userRecipesRepeater.DataBind();
            }
        }
      
    }

}