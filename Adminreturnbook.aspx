<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Adminreturnbook.aspx.cs" Inherits="Adminreturnbook" %>

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
            <h2>Return Book</h2>
        </div>
        <div class="row">
            <table class="srcbooktable">
                <tr>
                    <td><asp:Label ID="Book_Name" runat="server" Text="Book Name"></asp:Label></td>
                    <td><asp:DropDownList ID="ddbookname" runat="server"></asp:DropDownList></td>
                    <td><asp:Button ID="Button2" runat="server" Text="Search Book" 
                            CssClass="aspbtnxs" onclick="btnsrcbook_click"/></td>   
                </tr>
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Borrow ID "></asp:Label></td>
                    <td><asp:TextBox ID="txtborrowid" runat="server"></asp:TextBox></td>
                     
                </tr>
                <tr>
                    <td><asp:Button ID="Button3" runat="server" Text="Return Book" 
                            CssClass="aspbtnsrcauthor" onclick="btnreturn_click"/></td>   
                </tr>
            </table>
        </div>
        <table width="90%" align="center">
          <asp:GridView ID="GridView1" runat="server" CssClass="row" BackColor="#CCCCCC" 
                BorderColor="#999999" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="4" CellSpacing="2" Font-Strikeout="False" 
                Font-Underline="False" ForeColor="Black" 
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <FooterStyle BackColor="#CCCCCC" />
                <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    
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
