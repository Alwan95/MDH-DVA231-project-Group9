<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="projectLastVer.user" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="content/userAdminStyle.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="userContaienr" class="base_div">
        <div class="con">
            <button type="button" id="addButton" onclick="showAddNewFunction();"><i class="fas fa-plus-circle"></i></button>
            <div id="myProfile">
                <div id="coverProfile">
                 <img src="images/bbb.jpg" />
                <img src="images/bbb.jpg" />
                </div>
                <div class="imganduser">
                    <div id="imgPro">
                        <img src="images/apple-cart.jpg" alt="profile image" class="profileImg">
                    </div>
                </div>
                <div id="personalInfo">
                    <div class="conLine">
                        <div class="emailContainer">
                            <div id="email">
                                Email:&nbsp
                            </div>
                            <div id="userEmail" runat="server">
                                abc@gmail.com
                            </div>
                        </div>
                        <div class="contryContainer">
                            <div id="country">
                                Country:&nbsp
                            </div>
                            <div id="userCountry" runat="server">
                                Sweden
                            </div>
                        </div>
                    </div>
                    <div class="user-Name">
                        <p id="userName" runat="server">@User_name</p>
                    </div>
                </div>

            </div>
            <div id="myRecipes">
                <asp:Repeater ID="userRecipesRepeater" runat="server">
                    <HeaderTemplate>
                        <div class="row">
                    </HeaderTemplate>
                    <ItemTemplate>
                         <div class=" col-lg-4 col-md-6  col-sm-12 recipeContainer ">
                             <div class="card ">
                                 <a href="Recipe.aspx">
                                     <img src="<%# Eval("imageUrl") %>" class="card-img-top recipeImage" alt="...">
                                     <div class="card-body">
                                         <h5 class="card-title text-lg-center"><%# Eval("title") %></h5>
                                         <p class="card-text">
                                             <%# Eval("description") %>
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
            </div>
            <div id="backDark">
                <div id="addNewRecipe">
                    <div class="row">
                        <div class="col-12">
                            <div id="addNewTitle">
                                <p>Add new Recipe</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div id="recipeName">
                                <p>Recipe Name:</p>
                                <asp:TextBox ID="nameInput" runat="server" ></asp:TextBox>
                            </div>
                            <div id="recipeCategory">
                                <p>Category:</p>
                                <asp:DropDownList ID="selectCategory" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div id="description">
                                <p>Description:</p><br>
                                <asp:TextBox ID="descriptionInput" runat="server" MaxLength="10" TextMode="MultiLine" Rows="5" Columns="30" CssClass="description-input"></asp:TextBox>
                            </div>
                            <div id="uploadImage">
                                <p>Upload Image:</p>
                                <asp:FileUpload ID="imagedUploaded" runat="server" />
                            </div>
                        </div>
                        <div class="col-3">
                            <div id="ingredients">
                                <p>Ingredients:</p>
                                <asp:TextBox ID="ingredientsInput" runat="server"></asp:TextBox>
                            </div>
                            <div id="quantity">
                                <p>Quantity: </p>
                                <asp:TextBox ID="quantityInput" runat="server"></asp:TextBox>
                            </div>
                            <div id="units">
                                <p>Units:</p>
                                <asp:DropDownList ID="selectUnits" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="addBtnContainer">
                                 <button type="button" id="addIngBtn" onclick="getInputValue()">Add</button>
                            </div>
                        </div>
                        <div class="col-3">
                            <div id="showIngredients">
                                    <asp:TextBox ID="showIngList" runat="server" TextMode="MultiLine" Rows="10" Columns="17"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="Instructions">
                                <p>Instructions:</p>
                                <asp:TextBox ID="InstructionsTxt" runat="server" Rows="5" Columns="30" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="addnew_buttons">
                                <button type="button" id="cancelButton" class="btn btn-danger" onclick="hideAddNewFunction()">Cancel</button>
                                <asp:Button ID="submitButton" Text="sumbit" runat="server" CssClass="btn btn-success" OnClick="submitButton_Click" />
                            </div>

                        </div>

                    </div>
                </div>
            </div>
            <div id="editRecipeBackDark">
                <div id="editRecipe">
                    <div class="row">
                        <div class="col-12">
                            <div id="editRecipeTitle">
                                <p>Edit a Recipe</p>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div id="editRecipeName">
                                <p>Recipe Name:</p>
                                <input type="text" id="editRecipe_nameInput" name="recipeNameTxt"><br>
                            </div>
                            <div id="editRecipe_category">
                                <p>Category:</p>
                              <asp:DropDownList ID="editRecipe_selectCategory" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div id="editRecipe_description">
                                <p>Description:</p><br>
                                <textarea name="descriptionTxt" id="editRecipe_descriptionInput" rows="5" cols="30"></textarea>
                            </div>

                        </div>
                        <div class="col-3">
                            <div id="editRecipe_ingredients">
                                <p">Ingredients:</p>
                                <input type="text" id="editRecipe_ingredientsInput" name="ingredientsTxt">
                            </div>
                            <div id="editRecipe_quantity">
                                <p>Quantity: </p>
                                <input type="text" id="editRecipe_quantityInput" name="quantityTxt" maxlength="6" size="6">
                            </div>
                            <div id="editRecipe_units">
                                <p>Units:</p>
                                 <asp:DropDownList ID="UnitsEditRecipes" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="addBtnContainer">
                                 <button type="button" id="editRecipe_addIngBtn"  onclick="getInputValueEdit();">Add</button>

                            </div>

                        </div>
                        <div class="col-3">
                             <div id="editRecipe_showIngredients">
                                  <textarea  ID="editRecipe_showIngList"   Rows="10" Cols="17"></textarea>
                            </div>
                        </div>


                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="editRecipe_Instructions">
                                <p>Instructions:</p>
                                <textarea name="InstructionsTxt" id="editRecipe_InstructionsInput" rows="5" cols="30"></textarea>
                            </div>
                        </div>
                    </div>
                        <div class="row ">
                            <div class="col-12">
                                <div class="addnew_buttons">
                                    <button type="button" id="editRecipe_cancelButton" class="btn btn-danger"  onclick="hideEditFunction();">Cancel<</button>
                                    
                                    <button id="editRecipe_submitButton" class="btn btn-success" type="button">Save</button>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <script src="scripts/userAdminJS.js" type="text/javascript"></script>
</asp:Content>
