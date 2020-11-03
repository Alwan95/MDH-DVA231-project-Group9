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
    public partial class Recipe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string recipeId = Request.QueryString["recipeId"].ToString();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from recipe where id=@idRecipe", con);
            cmd.Parameters.AddWithValue("@idRecipe", recipeId);
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.HasRows)
            {
                sdr.Read();
                //                  adjust code here 
                // ======================================================
                // adjust column number for title from 1 to other if needed
                string title = sdr.GetString(1);
                // adjust column description, ingr, instr, imgurl for title from 2,3,4,5 to other if needed
                string description = sdr["description"].ToString();
                string ingredients = sdr["ingredients"].ToString();
                string instructions = sdr["instructions"].ToString();
                string imgurl = sdr["imageUrl"].ToString();
                // ======================================================
                recipe.InnerHtml = title;
                recipeDescription.InnerHtml = description;
                recipeIngredients.InnerHtml = ingredients;
                recipeInstructions.InnerText = instructions;
                image.Src = imgurl;
            }
        }
    }
}