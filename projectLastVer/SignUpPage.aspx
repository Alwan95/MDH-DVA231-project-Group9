<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUpPage.aspx.cs" Inherits="projectLastVer.SignUpPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="~/content/style.css" />
    <meta charset="utf-8" />
    <title>sing up Project</title>
</head>
<body>
   <header>
        <div class="wrapper">
            <div class="logo">
                <a href="homPage.aspx">
                <img src="images/spoon-logo-singUp.png" width="50" alt="Logo" />
                </a>
            </div>
            <ul class="nav-area">
                <li><a href="homPage.aspx">Home</a></li>
                <li><a href="LoginPage.aspx">Login</a></li>
            </ul>
        </div>

    </header>
    <div class="signBox"/>
        <img src="https://i0.wp.com/www.ftrconference.com/wp-content/uploads/2018/02/blank-profile-picture-973460_960_720.png?ssl=1" class="avatarSign" />

        <h1 id="signup" runat="server">Sign Up </h1>
<%--    <script>
        function check() {
            if (document.getElementById('TextBox1').value == "") {
                document.getElementById('Button1').style.opacity = "0.3";
                document.getElementById('Button1').disabled = true;
            }
            else {
                document.getElementById('Button1').style.opacity = "1";
                document.getElementById('Button1').disabled = false;
            }
        }
        document.onload = function () {
            document.getElementById('Button1').disabled = true;
            document.getElementById('Button1').style.opacity = "0.3";
        };
    </script>--%>

    <form id="form1" runat="server">
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Name is empty" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox1" type="text" name="" placeholder="Please enter name" runat="server" />
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorSurname" runat="server" ErrorMessage="surname is empty" ControlToValidate="TextBox2"  ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox2" type="text" name="" placeholder="Please enter surname" runat="server" />
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="username is empty" ControlToValidate="TextBox3"  ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox3" type="text" name="" placeholder="Please enter username" runat="server" />
      
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="email is empty" ControlToValidate="TextBox4"  ForeColor="Red"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="TextBox4" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" ErrorMessage="invalid email format"  ForeColor="Red"></asp:RegularExpressionValidator>
        <asp:TextBox ID="TextBox4" type="email" name="" placeholder="Please enter email" runat="server" />
       
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ControlToValidate="TextBox5" runat="server" ErrorMessage="password id empty"  ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox5" type="password" name="" placeholder="Please enter password" runat="server" />
        <asp:DropDownList ID="sigUpCountryDropDown" runat="server"></asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
    </form>
</body>
</html>