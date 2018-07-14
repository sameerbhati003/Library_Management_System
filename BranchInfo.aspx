<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BranchInfo.aspx.cs" Inherits="BranchInfo" %>

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
                    <li><a href="SearchBook.aspx">Search Book</a></li>
                    <li><a href="SearchCopy.aspx">Search Copy</a></li>
                   <li><a href="Add_Book.aspx">Add Book</a></li>
                   <li><a href="AddCopy.aspx">Add Copy</a></li>
                   <li><a href="Add_Reader.aspx">Add Reader</a></li>
                   <li><a href="BranchInfo.aspx">Branch</a></li>  
                    <li><a href="ReaderStat.aspx">Reader Stats</a></li>
                   <%--<li><a href="FrequentBorrowers.aspx">Frequent Borrowers</a></li>--%>
                    
                
                    
                </ul>
            </div>
        
        </nav>

        <div class="row">
            <h2>Branch Book Information</h2>
        </div>

        <div class="row">
            <table class="srcbooktable">
                <tr>
                    <td><asp:Label ID="branchnamelabel" runat="server" Text="Branch Name" ></asp:Label></td>
                    <td><asp:TextBox ID="branchnametxt" runat="server" ></asp:TextBox></td>
                    <td><asp:Label ID="branchaddlabel" runat="server" Text="Branch Address" ></asp:Label></td>
                    <td><asp:TextBox ID="branchaddtxt" runat="server" ></asp:TextBox></td>
                </tr>
            </table>
                <table class="srcbooktable">
                    <tr>
                        <td><asp:Button ID="btnaddbranch" runat="server" Text="Add Branch" 
                                CssClass="aspbtnsrcbook" onclick="btnaddbranch_Click" /></td>
                    </tr>
                </table>
        </div>
        <hr />
        <div class="row">
            <table class="srcbooktable">
                <tr>
                    <td><asp:Label ID="Label2" runat="server" Text="Branch Name" ></asp:Label></td>
                    <td><asp:DropDownList ID="ddbranch" runat="server"></asp:DropDownList></td>
                </tr>
            </table>
            <table class="srcbooktable">
                <tr>
                    <td><asp:Button ID="branchprint" runat="server" Text="Print Record" 
                            CssClass="aspbtnsrcbook" onclick="btnbranchprint_Click" />
                    </td>
                    <td><asp:Button ID="brfreqborrower" runat="server" Text="Frequent Borrowers" 
                            CssClass="aspbtnsrcbook" onclick="btnbrfreqborrower_Click" />
                    </td>
                    <td><asp:Button ID="brmostborrowed" runat="server" Text="Most Borrowed Books" 
                            CssClass="aspbtnsrcbook" onclick="btnbrmostborrowed_Click" />
                    </td>
                </tr>
            </table>
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
        <%--<div style=" height:200px; overflow:scroll;  ">
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
            </asp:GridView> </div>--%>
       
     <%--<div class="row">
       
       <a title="Print Screen" alt="Print Screen" onclick="window.print();" target="_blank" style="cursor:pointer;" >
       <asp:Button ID="btnprtbook" runat="server" Text="Print Record" CssClass="aspbtnprtbook" onclick="btnprtbook_Click"></asp:Button></a>

       </div>--%>
    </header>
    </form>
</body>
</html>

