<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="projectLastVer.Admin" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="content/userAdminStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="AdminMainContainer">
        <div class="mainRow">
            <div class="row">
                <div class="col-lg-4 position-fixed ">
                    <div class=" userManage  ">
                        <div class="row">
                            <div class="col-12">
                                <div class="selectUser">
                                    <div class="userRowTitle">
                                        <span>Search for a user</span>
                                    </div>
                                    <div class="searchContainer">
                                        <input type="text" id="searchUserInput" placeholder="Search..">
                                        <button type="button" id="SearchForUser"><i class="fa fa-search"></i></button>
                                        <div class=" searchUserHintsContainer display-none">
                                            <ul id="serachUserHintsList">
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="userStatistics">
                                    <div class="userRowTitle">
                                        <span>User's Statistics</span>
                                    </div>
                                    <div class="row">
                                        <p class="col-4">
                                            likes:
                                        </p>
                                        <p id="numberOfLikes" class="col-8">
                                            
                                        </p>

                                    </div>
                                    <div class="row">
                                        <p class="col-4">
                                            Recipes: 
                                        </p>
                                        <p id="numberOfRecipes" class=" col-8 numberOfRecipe">
                                            
                                        </p>
                                    </div>
                                </div>
                                </div>
                            </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="showUserInfo">
                                    <div class="userRowTitle">
                                        <span>User's Information</span>
                                    </div>
                                    <div id="userInformation">
                                        <div class="row m-2">
                                            <span class="col-3">User Name:
                                            </span>
                                            <span id="userInfoUserName" runat="server" class="col-9 "></span>
                                        </div>
                                        <div class="row m-2">
                                            <span class="col-3">Email:
                                            </span>
                                            <span id="userInfoUserEmail" class="col-9"></span>
                                        </div>
                                        <div class="row m-2">
                                            <span class="col-3">Country:
                                            </span>
                                            <span id="userInfoUserCountry" class="col-9"></span>
                                        </div>
                                        <div class="row m-2">
                                            <span class="col-4">Admin:</span>
                                            <span id="userInfoUserIsAdmin" class="col-8"></span>
                                        </div>
                                        <div class="row d-flex justify-content-around m-4">
                                            <button id="deleteUserBtn" class="btn btn-danger" type="button">Delete User</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-6 col-sm-12 userRecipes">
                    <div class="row">
                        <div class="col-12">
                            <div class="userRecipesRowTitle">
                                <span>User's recipes</span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="showUserRecipes">

                                <div id="myRecipes">
                        <div id="standardRecipe" class=" col-lg-6 col-md-6  col-sm-12 recipeContainer ">
                             <div class="card ">
                                 <a href="Recipe.aspx">
                                     <img src="#" class="card-img-top recipeImage" alt="...">
                                     <div class="card-body">
                                         <h5 class="card-title text-lg-center"></h5>
                                         <p class="card-text">
                                         </p>
                                     </div>
                                 </a>
                                 <div class="recipe-footer">
                                     <div>
                                         <button class="btn btn-primary showBtn" id="editUserRecipesBtn" type="button"       name="edit">Edit</button>
                                         <button class="btn btn-danger DeleteUserRecipesBtn"  type="button"       name="edit">Delete</button>

                                     </div>
                                     <i class="fa fa-heart"></i>
                                     <div>
                                         <i class="fa fa-users"></i>
                                         <span class="likes"><</span> <span>Liked this</span>
                                     </div>
                                     <span class="recipeID" style="display: none"></span>
                                 </div>
                             </div>
                         </div>
                                    <div class="row" id="userRecipesMainContainer">
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
