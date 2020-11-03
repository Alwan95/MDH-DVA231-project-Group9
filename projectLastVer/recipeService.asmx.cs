using projectLastVer;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace project
{
    /// <summary>
    /// Summary description for recipeService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX. 
    [System.Web.Script.Services.ScriptService]
    public class recipeService : System.Web.Services.WebService
    {
        string connectionString = ConfigurationManager.ConnectionStrings["Databse1"].ConnectionString;
        [WebMethod]
        public void getRecipes(int pageNumber, int numberOfRecipes)
        {
            List<recipe> recipesList = new List<recipe>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetRecipesForAPage", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PageNumber", pageNumber);
                cmd.Parameters.AddWithValue("@RecipesNumber", numberOfRecipes);

                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    recipe reci = new recipe();
                    reci.ID = Convert.ToInt32(rdr["id"]);
                    reci.title = rdr["title"].ToString();
                    reci.userName = rdr["username"].ToString();
                    reci.description = rdr["description"].ToString();
                    reci.likes = Convert.ToInt32(rdr["likes"]);
                    reci.imgUrl = rdr["imageUrl"].ToString();
                    recipesList.Add(reci);
                    if (reci.description.Length > 150)
                    {
                        reci.description = reci.description.Remove(150) + "..";
                    }
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(recipesList));
        }
        [WebMethod(EnableSession = true)]
        public void likePost(int postId) //add like 
        {
            if (HttpContext.Current.Session["userID"] != null)
            {
                int userid = Convert.ToInt32(HttpContext.Current.Session["userID"]);
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string commandString = "insert into likes values (" + userid + "," + postId + ")";
                    SqlCommand cmd = new SqlCommand(commandString, con);
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch { }

                }
            }
        }
        [WebMethod(EnableSession = true)]
        public void unLikePost(int postId) // remove like
        {
            if (HttpContext.Current.Session["userID"] != null)
            {
                int userid = Convert.ToInt32(HttpContext.Current.Session["userID"]);
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string commandString = "delete  from likes where user_id=" + userid + " and " + "recipe_id= " + postId;
                    SqlCommand cmd = new SqlCommand(commandString, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        [WebMethod(EnableSession = true)]
        public void getRecipesByCountry(string country)
        {
            if (true)
            {
                country = country.Trim();
                List<recipe> recipesList = new List<recipe>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetRecipesByCountry", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@countryName", country);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        recipe reci = new recipe();
                        reci.ID = Convert.ToInt32(rdr["id"]);
                        reci.title = rdr["title"].ToString();
                        reci.userName = rdr["username"].ToString();
                        reci.description = rdr["description"].ToString();
                        reci.likes = Convert.ToInt32(rdr["likes"]);
                        reci.imgUrl = rdr["imageUrl"].ToString();
                        recipesList.Add(reci);
                        if (reci.description.Length > 150)
                        {
                            reci.description = reci.description.Remove(150) + "..";
                        }
                    }
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(recipesList));

            }
        }
        [WebMethod(EnableSession = true)]
        public void getRecipesByCategory(string category)
        {
            if (true)
            {
                category = category.Trim();
                List<recipe> recipesList = new List<recipe>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetRecipesByCategory", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryName", category);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        recipe reci = new recipe();
                        reci.ID = Convert.ToInt32(rdr["id"]);
                        reci.title = rdr["title"].ToString();
                        reci.userName = rdr["username"].ToString();
                        reci.description = rdr["description"].ToString();
                        reci.likes = Convert.ToInt32(rdr["likes"]);
                        reci.imgUrl = rdr["imageUrl"].ToString();
                        recipesList.Add(reci);
                        if (reci.description.Length > 150)
                        {
                            reci.description = reci.description.Remove(150) + "..";
                        }
                    }
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(recipesList));
            }
        }
        [WebMethod(EnableSession = true)]
        public void getRecipesByCategoryAndCountry(string country, string category)
        {
            if (true)
            {
                category = category.Trim();
                List<recipe> recipesList = new List<recipe>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetRecipesByCountryAndCategory", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@categoryName", category);
                    cmd.Parameters.AddWithValue("@countryName", country);

                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        recipe reci = new recipe();
                        reci.ID = Convert.ToInt32(rdr["id"]);
                        reci.title = rdr["title"].ToString();
                        reci.userName = rdr["username"].ToString();
                        reci.description = rdr["description"].ToString();
                        reci.likes = Convert.ToInt32(rdr["likes"]);
                        reci.imgUrl = rdr["imageUrl"].ToString();
                        recipesList.Add(reci);
                        if (reci.description.Length > 150)
                        {
                            reci.description = reci.description.Remove(150) + "..";
                        }
                    }
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(recipesList));
            }
        }


        [WebMethod(EnableSession = true)]
        public void getUsersLikes()
        {
            if (HttpContext.Current.Session["userID"] != null)
            {
                DataTable dt = new DataTable();
                int userid = Convert.ToInt32(HttpContext.Current.Session["userID"]);
                string commandString = " select recipe_id from likes where user_id=" + userid;
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(commandString, con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        da.Fill(dt);
                        JavaScriptSerializer serializer = new JavaScriptSerializer();
                        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                        Dictionary<string, object> row;
                        foreach (DataRow dr in dt.Rows)
                        {
                            row = new Dictionary<string, object>();
                            foreach (DataColumn col in dt.Columns)
                            {
                                row.Add(col.ColumnName, dr[col]);
                            }
                            rows.Add(row);
                        }

                        Context.Response.Write(serializer.Serialize(rows));
                    }
                }
            }
        }

        [WebMethod(EnableSession = true)]
        public void getHint(string searchWord)
        {
            List<searchHint> hintList = new List<searchHint>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spGetHints", con);
                searchWord = searchWord.Trim();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@numberOfHints", 20);
                cmd.Parameters.AddWithValue("@searchWord", searchWord);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    searchHint hint = new searchHint();
                    hint.id = Convert.ToInt32(rdr["id"]);
                    hint.description = rdr["description"].ToString();
                    hint.title = rdr["title"].ToString();
                    hint.ingrecients = rdr["ingredients"].ToString();
                    hintList.Add(hint);
                }
            }
            searchWord = searchWord.ToLower();
            string title = "";
            foreach (searchHint hin in hintList)
            {
                if (title.IndexOf(searchWord)!=-1)
                {
                    if (hin.description.Length > 100)
                    {
                        hin.description = hin.description.Remove(100);
                    }
                }
                else if (hin.description.IndexOf(searchWord) != -1)
                {
                    string description = hin.description.ToLower();
                    int indexofWord = description.IndexOf(searchWord);
                    if (indexofWord + 50 <= description.Length)
                    {
                        description = description.Remove(indexofWord + 50);

                    }
                    if (description.Length > 100)
                    {
                        description = description.Remove(0, description.Length - 100);
                    }
                    hin.description = description;
                }
                else
                {
                    string ingredient = hin.ingrecients.ToLower();
                    int indexofWord = ingredient.IndexOf(searchWord);
                    if (indexofWord + 50 <= ingredient.Length)
                    {
                        ingredient = ingredient.Remove(indexofWord + 50);

                    }
                    if (ingredient.Length > 100)
                    {
                        ingredient = ingredient.Remove(0, ingredient.Length - 100);
                    }
                    hin.description = ingredient;
                }
            }
            //searchWord = searchWord.ToLower();
            //foreach (searchHint hin in hintList)
            //{
            //    string description = hin.description.ToLower();
            //    int indexofWord = description.IndexOf(searchWord);
            //    if (indexofWord + 50 <= description.Length)
            //    {
            //        description = description.Remove(indexofWord + 50);

            //    }
            //    if (description.Length > 100)
            //    {
            //        description = description.Remove(0, description.Length - 100);
            //    }
            //    hin.description = description;
            //}
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(hintList));
        }

        [WebMethod(EnableSession = true)]
        public void IsUserLoggedIn()
        {
            if (HttpContext.Current.Session["userID"] != null)
            {
                Context.Response.Write("true");
            }
            else
            {
                Context.Response.Write("false");

            }
        }
        [WebMethod(EnableSession = true)]
        public void getRecipeToEdit(int recipeId)
        {

            recipeToEdit recipe = new recipeToEdit();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("select * from recipe where id=" + recipeId, con);

                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DataRow dr = dt.Rows[0];
                recipe.title = dr["title"].ToString();
                recipe.categoryId = Convert.ToInt32(dr["category_id"]);
                recipe.description = dr["description"].ToString();
                recipe.instruction = dr["instructions"].ToString();
                recipe.ingredients = dr["Ingredients"].ToString();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(recipe));
        }
        [WebMethod(EnableSession = true)]
        public void UpdateRecipe(int recipeId, string NewTitle, string newsDescrition, string newIngredients, string newInstruction, int NewCategoryId)
        {
            int userid = Convert.ToInt32(HttpContext.Current.Session["userID"]);
            if (HttpContext.Current.Session["userID"] != null)
            {

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spUpdateRecipe", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@recipeId", recipeId);
                    cmd.Parameters.AddWithValue("@userId", userid);
                    cmd.Parameters.AddWithValue("@title", NewTitle);
                    cmd.Parameters.AddWithValue("@descrition", newsDescrition);
                    cmd.Parameters.AddWithValue("@instruction", newInstruction);
                    cmd.Parameters.AddWithValue("@categoryId", NewCategoryId);
                    cmd.Parameters.AddWithValue("@ingredients", newIngredients);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            Context.Response.Write(userid);
        }
        [WebMethod(EnableSession = true)]
        public void getRecipeByUserName(string userName)
        {
            if (true)
            {
                userName = userName.Trim();
                List<recipe> recipesList = new List<recipe>();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetRecipesByUserName", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", userName);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        recipe reci = new recipe();
                        reci.ID = Convert.ToInt32(rdr["id"]);
                        reci.title = rdr["title"].ToString();
                        reci.userName = userName;
                        reci.description = rdr["description"].ToString();
                        reci.likes = Convert.ToInt32(rdr["likes"]);
                        reci.imgUrl = rdr["imageUrl"].ToString();
                        recipesList.Add(reci);
                        if (reci.description.Length > 150)
                        {
                            reci.description = reci.description.Remove(150) + "..";
                        }
                    }
                }
                JavaScriptSerializer js = new JavaScriptSerializer();
                Context.Response.Write(js.Serialize(recipesList));

            }
        }
        [WebMethod(EnableSession = true)]
        public void getUserImformation(string userName)
        {
            if (true)
            {
                userName = userName.Trim();
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("spGetUserInfo", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", userName);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    con.Close();
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }

                    Context.Response.Write(serializer.Serialize(rows));

                }
            }
        }

        [WebMethod(EnableSession = true)]
        public  void deleteUser(string userName)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", userName);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        [WebMethod(EnableSession = true)]
        public void getUsersHint(string searchWord)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DataTable dt = new DataTable();
                int userid = Convert.ToInt32(HttpContext.Current.Session["userID"]);
                
                using (SqlCommand cmd = new SqlCommand("spGetUserNameForHints", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@searchWord", searchWord);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    foreach (DataRow dr in dt.Rows)
                    {
                        row = new Dictionary<string, object>();
                        foreach (DataColumn col in dt.Columns)
                        {
                            row.Add(col.ColumnName, dr[col]);
                        }
                        rows.Add(row);
                    }

                    Context.Response.Write(serializer.Serialize(rows));
                }
            }
        }
        [WebMethod(EnableSession = true)]
        public void deleteRecipe(int recipeId)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                int userId = Convert.ToInt32(Session["userID"]);
                SqlCommand cmd = new SqlCommand("spDeleteRecipe", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@recipeId", recipeId);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        [WebMethod(EnableSession = true)]
        public void getUserStatics(string userName)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                DataTable dt = new DataTable();

                using (SqlCommand cmd = new SqlCommand("spGetUserStatics", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", userName);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    JavaScriptSerializer serializer = new JavaScriptSerializer();
                    List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
                    Dictionary<string, object> row;
                    row = new Dictionary<string, object>();

                    row.Add("recipes", dt.Rows[0][0].ToString());
                    row.Add("likes", dt.Rows[1][0].ToString());
                    Context.Response.Write(serializer.Serialize(row));
                }
            }
        }
    }
}

