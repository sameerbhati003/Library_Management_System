<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_Reader.aspx.cs" Inherits="Add_Reader" %>

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
                <li><asp:Button ID="Button1" runat="server" Text="Logout" CssClass="aspbtnlogout"></asp:Button></li>
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
        <h2>Add a Reader</h2>
            
        </div>


        <div class="row">
        <table class="addReadertable">
            <tr>
                <td><asp:Label ID="lbStudentid" runat="server" Text="Student Id"></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtstudent_id" runat="server" ReadOnly="true"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr> 
                <td><asp:Label ID="lblReader_Fname" runat="server" Text="First Name"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Fname" runat="server"></asp:TextBox></td>                           
            </tr>
            <tr> 
                <td><asp:Label ID="lblReader_Lname" runat="server" Text="Last Name"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Lname" runat="server"></asp:TextBox></td>                           
            </tr>
            <tr>   
                <td><asp:Label ID="lbReader_Address" runat="server" Text="Reader Address"></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Address" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>  
                <td><asp:Label ID="lbReader_Phone" runat="server" Text="Phone Number"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Phone" runat="server"></asp:TextBox></td>  
            </tr>
            <tr>   
                <td><asp:Label ID="lblReader_Email" runat="server" Text="Reader Email"></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Email" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>  
                <td><asp:Label ID="lblReader_Username" runat="server" Text="Username"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Username" runat="server"></asp:TextBox></td>  
            </tr>
            <tr>   
                <td><asp:Label ID="lblReader_Password" runat="server" Text="Password"></asp:Label>&nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtReader_Password" runat="server"></asp:TextBox></td>
                <td>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>  
                <td><asp:Label ID="lblroleid" runat="server" Text="Roleid" Visible="false"></asp:Label> &nbsp; &nbsp;</td>
                <td><asp:TextBox ID="txtroleid" runat="server" Visible="false"></asp:TextBox></td>  
            </tr>
        </table>

        <asp:Button ID="btnaddrdr" runat="server" Text="Save" CssClass="aspbtnaddrdr" OnClick="btnaddrdr_Click"></asp:Button>
        <asp:Button ID="btnclrrdr" runat="server" Text="Clear" CssClass="aspbtnclrrdr" OnClick="btnclrrdr_Click"></asp:Button>
        
    </div>
    
    </header>

    

    </form>
</body>
</html>

