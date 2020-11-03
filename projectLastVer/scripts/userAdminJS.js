function getInputValue() {

    var ingInput = document.getElementById("ingredientsInput").value;
    var quaInput = document.getElementById("quantityInput").value;
    var uniInput = document.getElementById("selectUnits");
    var unit = uniInput.options[uniInput.selectedIndex].text;

    var ul_obj = document.getElementById("showIngList");
    ul_obj.value = ul_obj.value + "* " + ingInput + " " + quaInput + "-" + unit+"\n";


}

function getInputValueEdit() {

    var ingInput = document.getElementById("editRecipe_ingredientsInput").value;
    var quaInput = document.getElementById("editRecipe_quantityInput").value;
    var uniInput = document.getElementById("editRecipe_selectUnits");
    var unit = uniInput.options[uniInput.selectedIndex].text;

    var ul_obj = document.getElementById("editRecipe_showIngList");
    ul_obj.value = ul_obj.value + "* " + ingInput + " " + quaInput + "-" + unit + "\n";


}
function showAddNewFunction() {
    //  document.getElementById("addNewRecipe").style.display=block;
    var x = document.getElementById("addNewRecipe");
    var y = document.getElementById("backDark");

    x.style.display = "block";
    y.style.display = "flex";
}
function hideAddNewFunction() {
    //  document.getElementById("addNewRecipe").style.display=block;
    var x = document.getElementById("addNewRecipe");
    var y = document.getElementById("backDark");
    y.style.display = "none";
}

function hideEditFunction() {
    //  document.getElementById("addNewRecipe").style.display=block;
    var y = document.getElementById("editRecipeBackDark");
    y.style.display = "none";
}

function showEditRecipeFunction() {
    var y = document.getElementById("backDark");
    y.style.display = "none";
    var x = document.getElementById("editRecipe");
    var y = document.getElementById("editRecipeBackDark");

    x.style.display = "block";
    y.style.display = "flex";
}



document.getElementsByClassName("description-input")[0].addEventListener("keydown", function (e) {
    var inputText = (this).value;
    console.log(inputText.length);
    if (inputText.length >= 150 && e.keyCode !== 46 && e.keyCode !== 8 && e.keyCode !== 35 && e.keyCode !== 36 && e.keyCode !== 37 && e.keyCode !== 38 && e.keyCode !== 38 && e.keyCode !== 39 && e.keyCode !== 40 && e.keyCode !== 9) {
        e.preventDefault();
    }
});
