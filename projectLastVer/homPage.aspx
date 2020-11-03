<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="homPage.aspx.cs" Inherits="project.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>home</title>
</asp:Content>
<asp:Content ID="mainPage" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="logInMessage">
        <p>You must be logged in to like the recipes</p>
    </div>
    <div class="homePageContainer">
        <div class="container">
            <div class="row">
                <p class="headerBestRec">Best Recipes</p>
            </div>
            <asp:Repeater ID="bestRecipesRepeater" runat="server" DataSourceID="bestRecipesDS">
                <HeaderTemplate>
                    <div id="bestRecipes" class=" row  headLine ">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class=" col-lg-2 col-md-4  col-6 hedLineRecipeContainer">
                        <div class="card ">
                            <a href="Recipe.aspx?recipeId=<%# Eval("id") %>" target="_blank">
                                     <i class='fas fa-medal'></i>
                                    <img src="<%# Eval("imageUrl") %>" class="card-img-top" alt="...">
                                    <div class="card-body">
                                       <h5 class="card-title text-lg-center"><%# Eval("title") %></h5>
                                  </div>

                            </a>
                                <div class="recipe-footer">
                                    <div>
                                        <i class="far fa-user"></i>
                                        <span class="recipe-userName"><%#Eval("username") %></span>
                                    </div>
                                    <i class="fa fa-heart"></i>
                                    <div>
                                        <i class="fa fa-users"></i>
                                        <span class="likes"><%# Eval("likes") %></span> Liked this
                                          <span class="recipeID" style="display: none"><%# Eval("id") %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            <div class="row filterContainer">
                 <span class="m-2"> Filter by</span>
                <div class="filterCountry">
                    <div class="select-container">
                        <p class="selected-option-country">Country</p>
                        <div class="search-box-country">
                            <input id="countrySearchInput" type="text" placeholder="Start Typing..." />
                        </div  >
                        <div  class="countries-container">
                            <asp:Repeater ID="countriesRep" runat="server" DataSourceID="coutrisDS">
                                <HeaderTemplate>
                                     <ul  id="countriesList">
                                         <li>All Countries</li>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <%# Eval("name") %>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                </div>
                <div class="filterCategory">
                    <div class="select-container">
                        <p class="selected-option-Category">Category</p>
                        <div  class="categories-container">
                            <asp:Repeater ID="categoriesRep" runat="server" DataSourceID="CategoriesDS">
                                <HeaderTemplate>
                                     <ul  id="CategoryList">
                                         <li>All Categories</li>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <%# Eval("name") %>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="coutrisDS" runat="server" ConnectionString="<%$ ConnectionStrings:Databse1 %>"  SelectCommand="select * from country"></asp:SqlDataSource>
            <asp:SqlDataSource ID="CategoriesDS" runat="server" ConnectionString="<%$ ConnectionStrings:Databse1 %>"  SelectCommand="select * from category"></asp:SqlDataSource>

            <asp:SqlDataSource ID="bestRecipesDS" runat="server" ConnectionString="<%$ ConnectionStrings:Databse1 %>" SelectCommand="spGetBestRecipes" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="numberOfRecipes" Type="Int32" DefaultValue="6" />
                </SelectParameters>
            </asp:SqlDataSource>

            <div class=" row NoRecipeForCountry">
                no recipe found for&nbsp <span></span>
            </div>
            <asp:Repeater ID="recipesRepeater" runat="server" DataSourceID="RecipesDS">
                <HeaderTemplate>
                    <div id="mainRecipesContainer" class="row">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class=" col-lg-4 col-md-6  col-sm-12 recipeContainer ">
                        <div class="card ">
                            <a href="Recipe.aspx?recipeId=<%# Eval("id") %>" target="_blank">
                                <img src="<%# Eval("imageUrl") %>" class="card-img-top recipeImage" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title text-lg-center"><%# Eval("title") %></h5>
                                    <p class="card-text">
                                        <%# Eval("description") %>
                                    </p>
                                </div>
                            </a>
                            <div class="recipe-footer">
                                <span>
                                    <i class="far fa-user"></i>
                                    <span class="recipe-userName"><%#Eval("username") %></span>
                                </span>
                                <i class="fa fa-heart"></i>
                                <div>
                                    <i class="fa fa-users"></i>
                                    <span class="likes"><%# Eval("likes") %></span> <span>Liked this</span>
                                </div>
                                <span class="recipeID" style="display: none"><%# Eval("id") %></span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
            <asp:SqlDataSource ID="RecipesDS" runat="server" ConnectionString="<%$ ConnectionStrings:Databse1 %>" SelectCommand="spGetRecipesForAPage" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:Parameter Name="PageNumber" Type="Int32" DefaultValue="1" />
                    <asp:Parameter Name="RecipesNumber" Type="Int32" DefaultValue="5" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>





