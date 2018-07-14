<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentDash.aspx.cs" Inherits="StudentDash" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<link rel="Stylesheet" type="text/css" href="grid.css" />
     <link rel="Stylesheet" type="text/css" href="normalize.css" />
     
    <link rel="Stylesheet" type="text/css" href="StyleSheet2.css" />
    <link href="ionicons.min.css" rel="stylesheet" type="text/css" />
   
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,300i,400" rel="stylesheet" />
    <title>Library</title>
</head>
<body>
    <form id="form1" runat="server">
    <header>
        <nav>
            <div class="row">
                <img src="images/logo1.png" alt="Lib-logo" class="logo" />
               <ul class="nav">
                <li><asp:Label ID="Label1" runat="server" Text=""></asp:Label></li>
                <li><asp:Button ID="Button1" runat="server" Text="Logout" CssClass="aspbtnlogout" 
                        onclick="Button1_Click"></asp:Button></li>
               </ul>
                </div>
                <div class="row">
                <ul class="main-nav">
                    <li><a href="SearchBooks_User.aspx">Search Book</a></li>
                    <li><a href="ViewStatus.aspx">View Status</a></li>
                    <li><a href="AdminbookIssue.aspx">Issue Book</a></li>
                    <li><a href="ReserveBook.aspx">Reserve Book</a></li>
                    <li><a href="Adminreturnbook.aspx">Return Book</a></li>
                </ul>
            </div>
        
        </nav>
        
    
    </header>
    </form>
</body>
</html>
