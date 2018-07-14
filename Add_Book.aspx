<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Book.aspx.cs" Inherits="Add_Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                <li><asp:Button ID="Button1" runat="server" Text="Logout" CssClass="aspbtnlogout" OnClick="Button1_Click"></asp:Button></li>
               </ul>
                </div>
                <div class="row">
                <ul class="main-nav">
                    <li><a href="SearchBook.aspx">Search Book</a></li>
                    <li><a href="SearchCopy.aspx">Search Copy</a></li>
                   <li><a href="Add_Book.aspx">Add Book</a></li>
                   <li><a href="AddCopy.aspx">Add Copy</a></li>
                   <li><a href="Add_Reader.aspx">Add Reader</a></li>
                   <li><a href="BranchInfo.aspx">Branch</a></li>  
                    <li><a href="ReaderStat.aspx">Reader Stats</a></li>
<%--                   <li><a href="FrequentBorrowers.aspx">Frequent Borrowers</a></li>--%>
                </ul>
            </div>


        
        </nav>
        <div class="row">
        <h2>Add a Book</h2>
            
        </div>


        <div class="row">
        <table class="addbooktable">
            <tr>
                <td><asp:Label ID="lbBook_Name" runat="server" Text="Book Name"></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtBook_Name" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><asp:Label ID="lbBook_Author_Name" runat="server" Text="Book Author Name"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtBook_Author_Name" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbBook_ISBN" runat="server" Text="Book ISBN  "></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtBook_ISBN" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><asp:Label ID="lbBook_Publisher_name" runat="server" Text="Book Publisher name"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtBook_Publisher_name" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lbBook_Publication_date" runat="server" Text="Book Publication date"></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtBook_Publication_date" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><asp:Label ID="lblpubadd" runat="server" Text="Publication Address "></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtpublicationaddress" runat="server"></asp:TextBox></td>
            </tr>
            <%--<tr>
                <td><asp:Label ID="lbBook_Quantity" runat="server" Text="Book Quantity  "></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtBook_Quantity" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                <td><asp:Label ID="lbBook_Branch" runat="server" Text="Book Branch  "></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:DropDownList ID="ddBook_Branch" runat="server"></asp:DropDownList></td>
            </tr>--%>
            <tr>
                <td><asp:Label ID="statusLabel" runat="server" Text=""></asp:Label></td>
            </tr>
            
        </table>

        <asp:Button ID="btnaddbook" runat="server" Text="Add Book" CssClass="aspbtnaddbook" onclick="btnaddbook_Click"></asp:Button>
        <asp:Button ID="btnclr" runat="server" Text="Clear" CssClass="aspbtnclrbook" onclick="btnclr_Click" ></asp:Button>
        
    </div>
    
    </header>

    

    </form>
</body>
</html>

