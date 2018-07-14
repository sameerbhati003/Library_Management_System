<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReserveBook.aspx.cs" Inherits="ReserveBook" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
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
        <div class="row">
            <h2>Reserve Book</h2>
        </div>

        <div class="row">
            <table class="srcbooktable">
                <tr>
                    <td><asp:Label ID="Studentid" runat="server" Text="Reader Id" ></asp:Label></td>
                    <td><asp:TextBox ID="txtrdrstudentid" runat="server" ReadOnly="true"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Book_Name" runat="server" Text="Book Name"></asp:Label></td>
                    <td><ajaxToolkit:ComboBox ID="bookCombo" runat="server" AutoCompleteMode="Suggest"
                         DropDownStyle="DropDown"></ajaxToolkit:ComboBox></td>
                   <td><asp:Button ID="Button2" runat="server" Text="Search Book" 
                            CssClass="aspbtnxs" onclick="btnsearch_click"/></td>   
                </tr>
                <tr>
                    <td><asp:Label ID="Branch" runat="server" Text="Branches"></asp:Label></td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" Visible="false"></asp:DropDownList></td>
                </tr>
                <tr>
                     <td><asp:Button ID="btnsrcauthor" runat="server" Text="Reserve Book" 
                            CssClass="aspbtnsrcauthor" onclick="btnsrcauthor_Click"/></td>   
                 </tr>
            </table>
        </div>
    
    </header>
    </form>
</body>
</html>
