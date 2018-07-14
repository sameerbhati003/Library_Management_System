<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrequentBorrowers.aspx.cs" Inherits="FrequentBorrowers" %>

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
                   <li><a href="Add_Book.aspx">Add Book</a></li>
                   <li><a href="AddCopy.aspx">Add Copy</a></li>
                   <li><a href="Add_Reader.aspx">Add Reader</a></li>
                   <li><a href="BranchInfo.aspx">Branch</a></li> 
                   <li><a href="FrequentBorrowers.aspx">Frequent Borrowers</a></li>
                
                    
                </ul>
            </div>
        
        </nav>

        <div class="row">
            <h2>Top 10 Frequent Borrowers</h2>
        </div>

        
            
            
            
            

       

        
        
          <asp:GridView ID="GridView1" runat="server" CssClass="row" 
        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" 
                BorderWidth="3px" CellPadding="4" CellSpacing="2" 
        Font-Strikeout="False" Font-Underline="False" ForeColor="Black" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Reader_Studentid" HeaderText="Reader_Studentid" 
                        SortExpression="Reader_Studentid" />
                    <asp:BoundField DataField="Reader_FName" HeaderText="Reader_FName" 
                        SortExpression="Reader_FName" />
                    <asp:BoundField DataField="Reader_LName" HeaderText="Reader_LName" 
                        SortExpression="Reader_LName" />
                    <asp:BoundField DataField="Reader_Phone" HeaderText="Reader_Phone" 
                        SortExpression="Reader_Phone" />
                    <asp:BoundField DataField="Reader_Email" HeaderText="Reader_Email" 
                        SortExpression="Reader_Email" />
                    <asp:BoundField DataField="Book_Name" HeaderText="Book_Name" 
                        SortExpression="Book_Name" />
                    <asp:BoundField DataField="Book_Issue_Date" HeaderText="Book_Issue_Date" 
                        SortExpression="Book_Issue_Date" />
                </Columns>
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
       
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SRS_libraryConnectionString %>" SelectCommand="Select TOP 10 Reader_Studentid, Reader_FName,Reader_LName,Reader_Phone,Reader_Email,Book_Name,Book_Issue_Date from Book_Issue Order by Book_Issue_Date DESC ;
"></asp:SqlDataSource>
       
       <div class="row">
       
       <a title="Print Screen" alt="Print Screen" onclick="window.print();" target="_blank" style="cursor:pointer;" >
       <asp:Button ID="btnprtbook" runat="server" Text="Print Record" CssClass="aspbtnprtbook" onclick="btnprtbook_Click"></asp:Button></a>

       </div>
    
    </header>
    </form>
</body>
</html>
