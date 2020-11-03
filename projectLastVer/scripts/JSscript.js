// ****************** user page
var recipeToEdit = null;
var recipeElementEdite; // global varaibr to store recipe id that will change 
// show pop-up to add new recipe
$(".showBtn").click(function (event) {


    var y = document.getElementById("backDark");
    y.style.display = "none";
    var x = document.getElementById("editRecipe");
    var y = document.getElementById("editRecipeBackDark");

    x.style.display = "block";
    y.style.display = "flex";

    var id = $(this).parent().parent().find(".recipeID").text();
    recipeElementEdite = $(this).parent().parent().parent();
    recipeToEdit = parseInt(id);
    getSpecificRecipe(id);


});
// get recipe to edit 
const getSpecificRecipe = function (recipeId) {
    $.ajax({
        url: 'recipeService.asmx/getRecipeToEdit',
        method: 'post',
        dataType: 'json',
        data: {
            "recipeId": parseInt(recipeId)

        },
        success: function (data) {
            $("#editRecipe_descriptionInput").val(data.description);
            $("#editRecipe_nameInput").val(data.title);
            $("#editRecipe_showIngList").val(data.ingredients);
            $("#editRecipe_InstructionsInput").val(data.instruction);
            $("#editRecipe_selectCategory").val(data.categoryId);
        }
    });
}
// store recipes changes in database
$("#editRecipe_submitButton").click(function () {
    var y = document.getElementById("editRecipeBackDark");
    y.style.display = "none";
    refreshRecipes(recipeElementEdite);
    $.ajax({
        url: 'recipeService.asmx/UpdateRecipe',
        method: 'post',
        dataType: 'json',
        data: {
            "recipeId": parseInt(recipeToEdit),
            "NewTitle": $("#editRecipe_nameInput").val(),
            "newsDescrition": $("#editRecipe_descriptionInput").val(),
            "newIngredients": $("#editRecipe_showIngList").val(),
            "newInstruction": $("#editRecipe_InstructionsInput").val(),
            "NewCategoryId":$("#editRecipe_selectCategory").val(),
        },
        success: function (data) {
        }
    });
});
// change recipe information on screen instead of refreshing the page 
var refreshRecipes = function (recipe) {
    $(recipe).find(".card-title").text($("#editRecipe_nameInput").val());
    $(recipe).find(".card-text").text($("#editRecipe_descriptionInput").val());          
}
var deleteRecipes = function () {
    $(".DeleteUserRecipesBtn").click(function () {
        var id = $(this).parent().parent().find(".recipeID").text();
        $(this).parents().eq(3).remove();

        $.ajax({
            url: 'recipeService.asmx/deleteRecipe',
            method: 'post',
            dataType: 'json',
            data: {
                "recipeId": id
            },
            success: function (data) {
            }
        });
    });
}
deleteRecipes(); // add event to recipes delete button 

//************************************************* admin page 

// search box  in admin page to search for user  
$("#SearchForUser").click(function () {
    $("#userInfoUserName").text("");
    $("#userInfoUserEmail").text("");
    $("#userInfoUserCountry").text("");
    $("#userInfoUserIsAdmin").text("");
    var userNameToSearch = $("#searchUserInput").val();
    getUserRecipeByUserName(userNameToSearch);
    getUserInfo(userNameToSearch);
    getUserStatics(userNameToSearch);
});

// get user recipes to show them when admin search for a user 
var getUserRecipeByUserName = function (userName) {
    $.ajax({
        url: 'recipeService.asmx/getRecipeByUserName',
        method: 'post',
        dataType: 'json',
        data: {
            "userName": userName
        },
        success: function (data) {
            var mainContainer = $('#userRecipesMainContainer');
            mainContainer.find(".recipeContainer").remove();
            $(data).each(function (index, recipe) {
                var recipeClone = $("#standardRecipe").clone(true, true);
                recipeClone.removeAttr("id");
                $(recipeClone).find("a").attr("href", "Recipe.aspx?recipeId=" + recipe.ID);

                $(recipeClone).find("img").attr("src", recipe.imgUrl);
                $(recipeClone).find(".card-title").text(recipe.title);
                $(recipeClone).find(".card-text").text(recipe.description);
                $(recipeClone).find(".recipe-userName").text(recipe.userName);
                $(recipeClone).find(".likes").text(recipe.likes);
                $(recipeClone).find(".recipeID").text(recipe.ID);
                $(recipeClone).appendTo(mainContainer);
            });
        }
    });
    deleteRecipes();
}

// get user information 
var getUserInfo = function (username) {
    $.ajax({
        url: 'recipeService.asmx/getUserImformation',
        method: 'post',
        dataType: 'json',
        data: {
            "userName": username
        },
        success: function (data) {
            $(data).each(function (index, info) {
                $("#userInfoUserName").text(info.username);
                $("#userInfoUserEmail").text(info.email);
                $("#userInfoUserCountry").text(info.country);
                if (info.is_Admin == 1) {
                    $("#userInfoUserIsAdmin").text("yes");
                    $("#deleteUserBtn").css("display", "none");
                }
                else {
                    $("#userInfoUserIsAdmin").text("No");
                    $("#deleteUserBtn").css("display", "block");
                }
               
            });
        }
    });
};

var getUserStatics = function (username) {
    $.ajax({
        url: 'recipeService.asmx/getUserStatics',
        method: 'post',
        dataType: 'json',
        data: {
            "userName": username
        },
        success: function (data) {
            $(data).each(function (index, data) {
                $("#numberOfRecipes").text(data.recipes);
                $("#numberOfLikes").text(data.likes);
            });
        }
    });
};
//delete user 
$("#deleteUserBtn").click(function () {
    userName = $("#userInfoUserName").text();
    if (userName.length > 0) {
        $.ajax({
            url: 'recipeService.asmx/deleteUser',
            method: 'post',
            data: {
                "userName": userName
            },
            success: function (data) {
                location.reload();
            }
        });
    }
});

// hints for search user in admin page

$("#searchUserInput").keyup(function () {
    $("#serachUserHintsList").html("");
    var value = $(this).val();
    if ((value.length) > 1) {
        $(".searchUserHintsContainer").removeClass("display-none");
        var searchWord = $("#searchUserInput").val();
        $.ajax({
            url: 'recipeService.asmx/getUsersHint',
            method: 'post',
            dataType: 'json',
            data: {
                "searchWord": searchWord,
            },
            success: function (data) {
                $(data).each(function (index, hint) {
                    var newHint = $("<li></li>").text(hint.username);
                    newHint.appendTo("#serachUserHintsList");
                });
                addEventToHints();
            }
        })
    }
    else {
        $(".searchUserHintsContainer").addClass("display-none");
    }
});

// add click event to hinst 
var addEventToHints = function () {
    $("#serachUserHintsList li").click(function () {
        $("#searchUserInput").val(this.textContent);
        $(".searchUserHintsContainer").addClass("display-none");
    });
}
///////////////////////////////////////////// home page /////////////////////////

    //****************************************  increase and decrease likes 
    $(document).ready(function () {
        $(".fa-heart").click(function (e) {

            if (IsUserLoggedIn()) {
                var postid = parseInt($(this).parent().find(".recipeID").text());
                var like = 0;
                if ($(this).hasClass("recipe-liked")) {
                    $(this).removeClass("recipe-liked ");
                    like = -1;
                    unlikePost(postid)
                    colorUserLikes();// color or remove color from recipe when user like/unlike 
                }
                else {
                    $(this).addClass("recipe-liked ");
                    like = 1;
                    LikePost(postid);
                    colorUserLikes();// color or remove color from recipe when user like/unlike 
                }
                var likes = parseInt($(this).parent().find(".likes").text());
                if (likes < 0) {
                    likes = 0;
                }
                likes = likes + like;

                $(this).parent().find(".likes").text(likes);
            }
            else {
                setTimeout(function () {
                    $('.logInMessage').fadeIn('fast');
                }, 50);
                $(".logInMessage").css("top", e.clientY + $(window).scrollTop());
                $(".logInMessage").css("left", e.clientX + 20);
                setTimeout(function () {
                    $('.logInMessage').fadeOut('slow');
                }, 1300);
            }
        });
    });



    // save likes in database
    var unlikePost = function (postId) {
        $.ajax({
            url: 'recipeService.asmx/unLikePost',
            method: 'post',
            data: {
                "postId": postId,
            },
            success: function (data) {

            }
        });
    }
    // remove likes from database
    function LikePost(postId) {
        $.ajax({
            url: 'recipeService.asmx/likePost',
            method: 'post',
            data: {
                "postId": postId,
            },
            success: function (data) {

            }
        });
    }

    //                           make best recipes bigger and smaller  on timer
    var bestRecipes = $("#bestRecipes").find(".card");
    var x = bestRecipes.length - 1;
    var y = -1;
    var i;
    var medal = $("");
    for (i = 0; i <= bestRecipes; i++) {
        $($(bestRecipes)[i]).append(medal);
    }
    setInterval(function () {

        if (x == 0) {

            $($(bestRecipes)[x]).css("margin", "0");
            $($(bestRecipes)[x + 1]).css("margin", "0");
            y = 1;
        }
        else if (x >= bestRecipes.length - 1) {
            $($(bestRecipes)[x]).css("margin", "0");
            $($(bestRecipes)[x - 1]).css("margin", "0");
            y = -1;
        }
        $($(bestRecipes)[x - y]).css("margin", "0");
        $($(bestRecipes)[x]).css("margin", "-5px");
        x = x + y;
    }, 1000);

    // ***************** ************************** search box*******'**** 
    $("#searchTextBox").keyup(function () {
        $("#hintsList").html("");
        var value = $(this).val();
        if ((value.length) > 2) {
            $(".hintsContainer").removeClass("display-none");
            var searchWord = $("#searchTextBox").val();
            $.ajax({
                url: 'recipeService.asmx/getHint',
                method: 'post',
                dataType: 'json',
                data: {
                    "searchWord": searchWord,
                },
                success: function (data) {
                    $(data).each(function (index, hint) {
                        var newHint = $("<li></li>").append(
                            $('<a href=Recipe.aspx?recipeId=' + hint.id + '></a>').text(hint.title).append(
                                $("<span><span>").text(hint.description)
                            )
                        )
                        newHint.appendTo("#hintsList");
                    });
                }
            })
        }
        else {
            $(".hintsContainer").addClass("display-none");
        }
    });

    //hide search bar when clicking a hint
    $("#hintsList li").click(function () {
        $(".hintsContainer").addClass("display-none");
    });

    //********************************* ************************ scroll to load more recipes 
    $(window).scroll(function () {
        //console.log($(document).height());
        //console.log($(window).height());
        //console.log($(window).scrollTop());
        if (($(window).scrollTop()) + $(window).height() + 10 >= $(document).height()) {
            if (!recipesFoundForCountry) { /* load more recipes just when no country is selected or when country dose not have reipeces */
                var recipeCloneMain = $(".recipeContainer").first().clone(true, true)
                laodData(recipeCloneMain);
                colorUserLikes();// make new recipes green if user have liked it 
            }
        }
    });

    // load more recipes using ajax and web service 
    var currentPage = 1;
    laodData = function (clonedRecipe) {
        currentPage += 1;
        $.ajax({
            url: 'recipeService.asmx/getRecipes',
            method: 'post',
            dataType: 'json',
            data: {
                "pageNumber": parseInt(currentPage),
                "numberOfRecipes": 5,
            },
            success: function (data) {
                var mainContainer = $('#mainRecipesContainer');
                $(data).each(function (index, recipe) {
                    var recipeClone = clonedRecipe.clone(true, true);
                    $(recipeClone).find("a").attr("href", "Recipe.aspx?recipeId=" + recipe.ID);
                    $(recipeClone).find("img").attr("src", recipe.imgUrl);
                    $(recipeClone).find(".card-title").text(recipe.title);
                    $(recipeClone).find(".card-text").text(recipe.description);
                    $(recipeClone).find(".recipe-userName").text(recipe.userName);
                    $(recipeClone).find(".likes").text(recipe.likes);
                    $(recipeClone).find(".recipeID").text(recipe.ID);
                    $(recipeClone).appendTo(mainContainer);
                });
            }
        });

    }

    /* color the heart for all recipes that the user liked 
     we call this function when the user log in 
     */
    $(document).ready(function () {
        colorUserLikes = function () {

            $.ajax({
                url: 'recipeService.asmx/getUsersLikes',
                method: 'post',
                dataType: 'json',
                success: function (data) {
                    var cardList = $(".homePageContainer").find(".card");

                    for (var i = 0; i < cardList.length; i++) {
                        $(cardList[i]).find(".fa-heart").removeClass("recipe-liked");
                        $(data).each(function (index, recId) {
                            var recipesId = $(cardList[i]).find(".recipeID").text();
                            if (recipesId == recId.recipe_id) {
                                $(cardList[i]).find(".fa-heart").addClass("recipe-liked");
                            }
                        });
                    }
                }
            })
        }
        $(".recipe-userName").click(colorUserLikes);
    });

    var IsUserLoggedIn = function () {
        if ($("body").find("#logOutButton").length > 0) {
            return true;
        }
        else {
            return false;
        }
    }

    $(document).ready(function () {
        if (IsUserLoggedIn()) {
            colorUserLikes();
        }
    })


    //******* *******************************   filter by country *********************

    contriesSearchBox = document.getElementById("countrySearchInput");
    var selectedOptionCountry = document.querySelector(".selected-option-country");
    const Countryoptions = document.querySelectorAll("#countriesList li");

    selectedOptionCountry.addEventListener("click", function (event) {
        event.stopPropagation(); // stop another events which effect this event 
        selectedOptionCountry.parentElement.classList.toggle("active"); // active class show the list 
        contriesSearchBox.value = ""; // remove text in searchbox when close/open country list
        FilterCountriesList("");

    });
    if (selectedOptionCountry.parentElement.classList.contains("active")) {
        contriesSearchBox.focus(); // set focus on search box 
    }
    // ****************************************** hide dropdowns when  click somewhere in the screen


    // add event to all items in country list 
    Countryoptions.forEach(function (option) {
        option.addEventListener("click", function () {
            setTimeout(function () {
                selectedOptionCountry.innerHTML = option.innerHTML;// whem click a item set its value in selected item
            }, 300);

            selectedOptionCountry.parentElement.classList.remove("active"); // display coutries list
            var recipeCloneMain = $(".recipeContainer").first().clone(true, true)
            var category = (selectedOptionCategory.textContent.trim()).toLocaleLowerCase();
            var country = option.textContent.toLowerCase().trim();
            if (category == "all categories" || category == "category") {
                getRecipesByCountry(recipeCloneMain, country, selectedOptionCategory);

            }
            else {

                if (country == "all countries") {
                    getRecipesByCategory(recipeCloneMain, category, country);
                }
                else {
                    getRecipesByCountryAndCategory(recipeCloneMain, option.textContent, category);

                }
            }
        });
    });

    var countriesUl = document.getElementById("countriesList"); // get ul for countries 
    var countriesNames = countriesUl.getElementsByTagName("li"); // get all items in country list 
    $("#countrySearchInput").keyup(function (e) {
        FilterCountriesList(this.value.toString());
    });
    const FilterCountriesList = function (searchWord) {
        searchWord = searchWord.toLowerCase();
        for (var i = 0; i < countriesNames.length; i++) {
            var text = countriesNames[i].textContent.toLowerCase(); // if item match the word in search box show else  hide it 
            if (text.search(searchWord) != -1) {
                countriesNames[i].style.display = "block";

            }
            else {
                countriesNames[i].style.display = "none";
            }

        }
    }


    //get recipes by country 
    var recipesFoundForCountry = false;
    function getRecipesByCountry(recipeCl, country, category) {
        country = (country.trim()).toLowerCase();
        $(".NoRecipeForCountry").css("display", "none");
        if (country != "all countries") {
            $.ajax({
                url: 'recipeService.asmx/getRecipesByCountry',
                method: 'post',
                dataType: 'json',
                data: {
                    "country": country.toString()
                },
                success: function (data) {
                    var mainContainer = $('#mainRecipesContainer');
                    $(".recipeContainer").remove();
                    if (data.length > 0) { // check if the country has some recipes 

                        $(data).each(function (index, recipe) {
                            var recipeClone = recipeCl.clone(true, true);
                            $(recipeClone).find("a").attr("href", "Recipe.aspx?recipeId=" + recipe.ID);
                            $(recipeClone).find("img").attr("src", recipe.imgUrl);
                            $(recipeClone).find(".card-title").text(recipe.title);
                            $(recipeClone).find(".card-text").text(recipe.description);
                            $(recipeClone).find(".recipe-userName").text(recipe.userName);
                            $(recipeClone).find(".likes").text(recipe.likes);
                            $(recipeClone).find(".recipeID").text(recipe.ID);
                            $(recipeClone).appendTo(mainContainer);
                        });
                        recipesFoundForCountry = true;
                        colorUserLikes();

                    }
                    else {
                        $(".NoRecipeForCountry").css("display", "flex");
                        $('.NoRecipeForCountry span').text(" " + country);
                        recipesFoundForCountry = false;
                        currentPage = 0;
                        laodData(recipeCl);
                    }

                }
            });
        }
        else {
            recipesFoundForCountry = false;
            $(".recipeContainer").remove();
            currentPage = 0;
            laodData(recipeCl);
        }

    }

    // ***************************************** filter by category**************

    //get recipes by category 
    var selectedOptionCategory = document.querySelector(".selected-option-Category");
    const categoryoptions = document.querySelectorAll("#CategoryList li");

    selectedOptionCategory.addEventListener("click", function (event) {
        event.stopPropagation();
        selectedOptionCategory.parentElement.classList.toggle("active"); // active class show the list 
    });

    // add event to all items  in category list
    categoryoptions.forEach(function (option) {
        option.addEventListener("click", function () {
            setTimeout(function () {
                selectedOptionCategory.innerHTML = option.innerHTML;// whem click a item set its value in selected item
            }, 300);

            selectedOptionCategory.parentElement.classList.remove("active"); // display coutries list
            var recipeCloneMain = $(".recipeContainer").first().clone(true, true)
            var country = (selectedOptionCountry.textContent.trim()).toLocaleLowerCase();
            var catrgory = option.textContent.toLowerCase().trim();
            if (country == "country" || country == "all countries") {
                getRecipesByCategory(recipeCloneMain, option.textContent, selectedOptionCountry);
 

            }
            else {
                if (catrgory == "all categories") {
                    getRecipesByCountry(recipeCloneMain, country, catrgory);
                }
                else {
                    getRecipesByCountryAndCategory(recipeCloneMain, country, option.textContent)
                }
            }
        });
    });

    var recipesFoundForCountry = false;
    function getRecipesByCategory(recipeCl, category, country) {
        category = (category.trim()).toLowerCase();
        $(".NoRecipeForCountry").css("display", "none");
        if (category != "all categories") {
            $.ajax({
                url: 'recipeService.asmx/getRecipesByCategory',
                method: 'post',
                dataType: 'json',
                data: {
                    "category": category.toString()
                },
                success: function (data) {
                    var mainContainer = $('#mainRecipesContainer');
                    $(".recipeContainer").remove();
                    if (data.length > 0) { // check if the country has some recipes 

                        $(data).each(function (index, recipe) {
                            var recipeClone = recipeCl.clone(true, true);
                            $(recipeClone).find("a").attr("href", "Recipe.aspx?recipeId=" + recipe.ID);

                            $(recipeClone).find("img").attr("src", recipe.imgUrl);
                            $(recipeClone).find(".card-title").text(recipe.title);
                            $(recipeClone).find(".card-text").text(recipe.description);
                            $(recipeClone).find(".recipe-userName").text(recipe.userName);
                            $(recipeClone).find(".likes").text(recipe.likes);
                            $(recipeClone).find(".recipeID").text(recipe.ID);
                            $(recipeClone).appendTo(mainContainer);
                        });
                        recipesFoundForCountry = true;
                        colorUserLikes();


                    }
                    else {
                        $(".NoRecipeForCountry").css("display", "flex");
                        $('.NoRecipeForCountry span').text(" " + category);
                        recipesFoundForCountry = false;
                        currentPage = 0;
                        laodData(recipeCl);

                    }

                }
            });
        }
        else {
            recipesFoundForCountry = false;
            $(".recipeContainer").remove();
            currentPage = 0;
            laodData(recipeCl);
        }
    }

    // ************************** get recipes by country and category********************

    function getRecipesByCountryAndCategory(recipeCl, country, category) {
        $(".NoRecipeForCountry").css("display", "none");
        country = country.toLowerCase().trim();
        category = category.toLowerCase().trim();
        $.ajax({
            url: 'recipeService.asmx/getRecipesByCategoryAndCountry',
            method: 'post',
            dataType: 'json',
            data: {
                "country": country.toString(),
                "category": category.toString()

            },
            success: function (data) {
                var mainContainer = $('#mainRecipesContainer');
                $(".recipeContainer").remove();
                if (data.length > 0) { // check if the country has some recipes 

                    $(data).each(function (index, recipe) {
                        var recipeClone = recipeCl.clone(true, true);
                        $(recipeClone).find("a").attr("href", "Recipe.aspx?recipeId=" + recipe.ID);

                        $(recipeClone).find("img").attr("src", recipe.imgUrl);
                        $(recipeClone).find(".card-title").text(recipe.title);
                        $(recipeClone).find(".card-text").text(recipe.description);
                        $(recipeClone).find(".recipe-userName").text(recipe.userName);
                        $(recipeClone).find(".likes").text(recipe.likes);
                        $(recipeClone).find(".recipeID").text(recipe.ID);
                        $(recipeClone).appendTo(mainContainer);
                    });
                    recipesFoundForCountry = true;
                    colorUserLikes();

                }
                else {
                    $(".NoRecipeForCountry").css("display", "flex");
                    $('.NoRecipeForCountry span').text(" " + country + " / " + category);
                    recipesFoundForCountry = false;
                    currentPage = 0;
                    laodData(recipeCl);
                }
            }
        });


    }

    // ************************************************************************* shortCuts 

    $(document).keydown(function (event) {
        event.stopPropagation();
        if (event.ctrlKey && event.keyCode == 70 && event.shiftKey) {
            selectedOptionCountry.parentElement.classList.add("active");
        }

    });

    //************************************** user 
    //edit recipes 
   