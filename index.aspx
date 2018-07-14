<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="Stylesheet" type="text/css" href="grid.css" />
     <link rel="Stylesheet" type="text/css" href="normalize.css" />
     
    <link rel="Stylesheet" type="text/css" href="StyleSheet.css" />
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
                <img src="images/logo123.png" alt="Lib-logo" class="logo-sticky" />
                <ul class="main-nav">
                    <li><a href="index.aspx">Home</a></li>
                    <li><a href="#about">About Us</a></li>
                     <li><a href="#location">Our Location</a></li>
                    <li><a href="#contact">Contact</a></li> 
                </ul>
            </div>
        
        </nav>
        <div class="librarybox">
            <h1>&nbsp;&nbsp;&nbsp;&nbsp; SRS Library</h1>
            <h3>Perfect Smart Solution for Library Management</h3>
            
            <asp:TextBox ID="username" runat="server" placeholder="User Name" CssClass="main-txtbx" required></asp:TextBox> &nbsp;
            <asp:TextBox ID="password" runat="server" placeholder="Password" TextMode="Password" CssClass="main-txtbx" required></asp:TextBox>
            <asp:Button ID="btnlogin" runat="server" Text="Login" CssClass="aspbtn" 
                onclick="btnlogin_Click"></asp:Button>
            <%--<asp:Button ID="Button2" runat="server" Text="Sign-Up" CssClass="aspbtn-ghost" 
                onclick="Button2_Click"></asp:Button>--%>
            
        </div>
    
    </header>

    <section class="section-About js--section-about" id="about">
        <div class="row">
        
           <h2>All to know &mdash; About us</h2> 
           <p class="long-about">
            SRS online library hosts the best and deepest multidisciplinary collection of online resources covering Life, Health, Physical science
            Social Science, Engineering, Architecture, humenity etc. It delivers seamless integrated access to over hundred of books, articles and journels. 
            Featuring a clean and simple interface, this online service delivers intiuitive navigation, enhanced discoverability, expanded functionalities, and a 
            range of personalization and alerting options.
           </p>
        </div>
        
        <div class="row">
            <div class="col span-1-of-3 box">
            
            
                <h3>Easy to use design</h3>
                <p>Developed in consultation with users to deliver intiuitive navigation 
                and easy access to articles. chapters, references and supplementary information</p>
            </div>

            <div class="col span-1-of-3 box ">
           
                <h3>Enhaned tools</h3>
                <p>Comprehensive search engine optimization ensures discoverability of content, delivering relevant and immediate results to users.</p>
            </div>

            <div class="col span-1-of-3 box ">
            
                <h3>Stay up to Date</h3>
                <p>Content alerts and RSS feeds to keep you updated with the latest published research including, journels, tables of content, early view and accepted articles and search results</p>
            </div>
            </div>
    </section>

     

    <section class="section-galary">
        <ul class="showcase">
            <li>
                <figure class="library-photo">
                    <img src="images/1.jpg" alt="Library-image1" />
                </figure>
            </li>
            <li>
                <figure class="library-photo">
                    <img src="images/2.jpg" alt="Library-image2" />
                </figure>
            </li>
            <li>
                <figure class="library-photo">
                    <img src="images/3.jpg" alt="Library-image3" />
                </figure>
            </li>
            <li>
                <figure class="library-photo">
                    <img src="images/4.jpg" alt="Library-image4" />
                </figure>
            </li>


        </ul>

        <ul class="showcase">
            <li>
                <figure class="library-photo">
                    <img src="images/5.jpg" alt="Library-image5" />
                </figure>
            </li>
            <li>
                <figure class="library-photo">
                    <img src="images/7.jpg" alt="Library-image7" />
                </figure>
            </li>
            <li>
                <figure class="library-photo">
                    <img src="images/8.jpg" alt="Library-image8" />
                </figure>
            </li>
            <li>
                <figure class="library-photo">
                    <img src="images/10.jpg" alt="Library-image10" />
                </figure>
            </li>

        </ul>
    
    </section>
   
   <section class="section-location" id="location">
           <div class="row">
            <h2>We're currently in these locations</h2>
        </div>
        <div class="row">
            <div class="col span-1-of-4 box">
                <img src="images/manhattan%20library.jpg" alt="manhattan" />
                <h3>Manhattan</h3>
                Time - 8am to 11pm
            </div>
            <div class="col span-1-of-4 box">
                <img src="images/architecture%20library.jpg" alt="architecture" />
                <h3>Old Westbury</h3>
                Time - 8am to 11pm
            </div>
            <div class="col span-1-of-4 box">
                <img src="images/varkansas%20library.png" alt="varkansas" />
                <h3>Varkansas</h3>
                Time - 8am to 11pm
            </div>
            <div class="col span-1-of-4 box">
                <img src="images/medical%20library.jpg" alt="medical" />
                <h3>Vancouver</h3>
                Time - 8am to 11pm
            </div>
           <%-- <div class="col span-1-of-5 box">
                <img src="images/NYIT_Wisser_Memorial_Library.JPG" alt="wisser" />
                <h3>Wisser</h3>
            </div>--%>
        </div>
    </section>
    <section class="section-reviews">
        <div class="row">
        <h2>Our Customer's Reviews</h2>
        </div>
        <div class="row">
            <div class="col span-1-of-3">
            <blockquote>
                Great work environment if you like to work in the public and deal with people. Hours are pretty good and can vary depending on position. 
                There some great people who work for the library and are great to learn from.
                <cite><img src="images/customer1.jpg" alt="customer1" />Albert Dunace</cite>
            </blockquote>
            </div>
            <div class="col span-1-of-3">
            <blockquote>
                It's great to work for an institution that means so much to so many people, and is such a necessary space and service provider to all, 
                as well as being a major hub for research.
                <cite><img src="images/customer2.jpg" alt="customer2" />Veronica</cite>
            </blockquote>
            </div>

            <div class="col span-1-of-3">
            <blockquote>
                I am a student and i really found almost all books in less time. Quite environment and people are very helping who works here.
                <cite><img src="images/customer3.jpg" alt="customer3" />Robert Hope</cite>
            </blockquote>
            </div>

        </div>
        
    </section>

    <section class="section-form" id="contact">
        <div class="row">
            <h2>We're happy to hear form you</h2>
        </div>
        <div class="row">
            <form method="post" action="#"class="contact">
                <div class="row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label1" runat="server" Text="Name"  ></asp:Label>
                    </div>
                    <div class="col span-2-of-3">
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Your name"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                    </div>
                    <div class="col span-2-of-3">
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Your email"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label3" runat="server" Text="How did you find us?" ></asp:Label>
                    </div>
                    <div class="col span-2-of-3">
                    <asp:DropDownList ID="DropDownList1" runat="server" >
                        <asp:ListItem>Friends</asp:ListItem>
                        <asp:ListItem Selected="True">Search Engine</asp:ListItem>
                        <asp:ListItem>Advertisement</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label4" runat="server" Text="Drop us a line" CssClass="input"></asp:Label>
                    </div>
                    <div class="col span-2-of-3">
                    <textarea name="message" placeholder="Your message" ></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col span-1-of-3">
                        <asp:Label ID="Label5" runat="server" Text="&nbsp"></asp:Label>
                    </div>
                    <div class="col span-2-of-3">
                    <asp:Button ID="Button3" runat="server" Text="Send it!"></asp:Button>
                    </div>
                </div>
            </form>
        </div>
    
    </section>

    <footer>
        <div class="row">
            <div class="col span-1-of-2">
                <ul class="footer-nav">
                <li><a href="#">About us</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Press</a></li>
                <li><a href="#">IOS app</a></li>
                <li><a href="#">Android app</a></li>
                </ul>
            </div>
            <div class="col span-1-of-2">
                <ul class="footer-nav">
                <%--<li><a href="#"><i class="ion-social-facebook"></i></a></li>--%>
                </ul>
            </div>
        </div>
        <div class="row">
            <p>
                Copyright &copy; 2017 by SRS Library. All rights reserved
            </p>
        </div>
    </footer>

    </form>


    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/respond/1.4.2/respond.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/html5shiv/3.7.2/html5shiv.min.js"></script>
<script  type="text/javascript" src="//cdn.jsdelivr.net/selectivizr/1.0.3b/selectivizr.min.js"></script>
<script src="jquery.waypoints.min.js" type="text/javascript"></script>
<script type="text/javascript" src="JScript.js"></script>

</body>



</html>
