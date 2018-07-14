<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCopy.aspx.cs" Inherits="AddCopy" %>

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
        <h2>Add a book copy to branch</h2>
        </div>
        <div class="row">
            <table class="srcbooktable">
                <tr><td>
                    <asp:Label ID="bookidlabel" runat="server" Text="Book ID" ></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="bookidtxt" runat="server" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnsrcbook" runat="server" Text="Search" 
                            CssClass="aspbtnsrcbook" onclick="btnsrcbook_Click" />
                    </td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Book Title"></asp:Label></td>
                    <td><asp:TextBox ID="booktitletxt" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Book Author"></asp:Label></td>
                    <td><asp:TextBox ID="bookauthortxt" runat="server" Enabled="false"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Select Branch"></asp:Label></td>
                    <td><asp:DropDownList ID="ddbranch" runat="server"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td><asp:Label runat="server" Text="Quantity"></asp:Label></td>
                    <td><asp:TextBox ID="quantitytxt" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnaddcopy" runat="server" Text="Add Copy" 
                            CssClass="aspbtnsrcbook" onclick="btnaddcopy_Click" /></td>
                </tr>
            </table>
        </div>
    </header>
    </form>
</body>
</html>
