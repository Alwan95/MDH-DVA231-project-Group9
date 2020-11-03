<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="projectLastVer.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link rel="stylesheet" type="text/css" href="~/content/style.css" />
    <meta charset="utf-8" />
    <title>DWA Project</title>
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
            </ul>
        </div>
    </header>
     <div class="loginBox">
        <img src="https://i0.wp.com/www.ftrconference.com/wp-content/uploads/2018/02/blank-profile-picture-973460_960_720.png?ssl=1" class="avatar"/>
        
            <h1 id="login" runat="server">Login Page</h1>
    
    <form id="form1" runat="server">
       
                <asp:TextBox ID="TextBox1" type="text" name="" placeholder="Enter username"  runat="server"/> 
               
       
                <asp:TextBox ID="Pass" type="password" name="" placeholder="Enter password"  runat="server"/> 
        
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" />

        <a href="SignUpPage.aspx"> Do not have an account yet? </a>
    </form>
        

         </div>
</body>
</html>
