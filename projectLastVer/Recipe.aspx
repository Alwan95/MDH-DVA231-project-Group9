<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="Recipe.aspx.cs" Inherits="projectLastVer.Recipe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="show-recipe" >


            <div class="row d-flex justify-content-center m-3">
                <h1 id="recipe" class="recipe-title" runat="server"></h1>

            </div>
        <div class="row img-DescRow">
            <div class="col-4">
                <img src="#" class="RecipeImage" id="image" runat="server"/>
            </div>
            <div class="col-6">
                <div class="row Description">
                   <b>Description</b>
                    <p id="recipeDescription" runat="server"></p>
                </div>
                <div class="row Ingredients">
                  <b >Ingredients:</b>
                  <p id="recipeIngredients" runat="server"></p>
                </div>
            </div>

        </div>
        <div class="row Instruction">
            <b class="m-2">Instructions:</b>
            <p id="recipeInstructions" runat="server"></p>
        </div>
   </div>

</asp:Content>
