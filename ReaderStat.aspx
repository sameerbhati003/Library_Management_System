<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReaderStat.aspx.cs" Inherits="ReaderStat" %>

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
            <h2>Reader Stats</h2>
        </div>
        <table width="90%" align="center">
          <asp:GridView ID="GridView1" runat="server" CssClass="row" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="4" CellSpacing="2" Font-Strikeout="False" Font-Underline="False" ForeColor="Black">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                <RowStyle BackColor="White" VerticalAlign="Middle" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" VerticalAlign="Middle" HorizontalAlign="Center"/>
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </table>
    </header>
    </form>
</body>
</html>
