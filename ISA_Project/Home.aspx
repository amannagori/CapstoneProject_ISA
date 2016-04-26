<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs"
     MasterPageFile="~/Main.Master" Inherits="ISA_Project.Home" %>


<%--<asp:Content ContentPlaceHolderID="username" runat="server">

    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="view1" runat="server">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span>Login</a>
                </li>

            </ul>
        </asp:View>

        <!-- Role = Public User (View 1)-->
        <asp:View ID="public_view" runat="server">

            <div class="nav navbar-nav navbar-right">
                <div class="btn-group">
                    <a id="username" runat="server" class="btn btn-primary" href="#"><i class="fa fa-user fa-fw"></i></a>
                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <span class="fa fa-caret-down"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="PagesCommon/UpdateProfile.aspx"><i class="fa fa-pencil fa-fw"></i>Update Profile</a></li>
                        <li><a href="PagesCommon/DonateItems.aspx"><i class="fa fa-pencil fa-fw"></i>Donate Item</a></li>
                        <li><a href="PagesCommon/MyItems.aspx"><i class="fa fa-pencil fa-fw"></i>My Item</a></li>

                        <li class="divider"></li>
                        <li><a href="home.aspx?logout=true"><i class="fa fa-trash-o fa-fw"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </asp:View>


        <!-- Role = Admin -->
         <asp:View ID="admin_view" runat="server">

            <div class="nav navbar-nav navbar-right">
                <div class="btn-group">
                    <a id="admin_name" runat="server" class="btn btn-primary" href="#"><i class="fa fa-user fa-fw"></i></a>
                    <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <span class="fa fa-caret-down"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="PagesCommon/UpdateProfile.aspx"><i class="fa fa-pencil fa-fw"></i>Update Profile</a></li>
                        <li><a href="PagesCommon/DonateItems.aspx"><i class="fa fa-pencil fa-fw"></i>Donate Item</a></li>
                        <li><a href="PagesCommon/MyItems.aspx"><i class="fa fa-pencil fa-fw"></i>My Item</a></li>
                        <li><a href="PagesCommon/DeleteItems.aspx"><i class="fa fa-pencil fa-fw"></i>Delete Item</a></li>
                        <li class="divider"></li>
                        <li><a href="PagesAdmin/AddEvent.aspx"><i class="fa fa-pencil fa-fw"></i>Add Event</a></li>
                        <li><a href="PagesAdmin/Event.aspx"><i class="fa fa-pencil fa-fw"></i>Delete Event</a></li>
                        
                         <li class="divider"></li>
                        <li><a href="PagesAdmin/RoleChange.a class="col-lg-12 text-center"spx"><i class="fa fa-pencil fa-fw"></i>Role Change</a></li>                       
                        <li><a href="PagesAdmin/AddDocuments.aspx"><i class="fa fa-pencil fa-fw"></i>Add Document</a></li>

                        <li class="divider"></li>
                        <li><a href="home.aspx?logout=true"><i class="fa fa-trash-o fa-fw"></i>Logout</a></li>
                    </ul>
                </div>
            </div>
        </asp:View>

    </asp:MultiView>
</asp:Content> --%>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="container">

        <div class="row">
            <div class="box">
                <div>
                    <div id="carousel-example-generic" class="carousel slide">
                        <!-- Indicators -->
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="img/slide-1.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/slide-2.jpg" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/slide-3.jpg" alt="">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                  
                </div>
                <center>
                  <h2 class="brand-before">
                        <small>Welcome to</small>
                    </h2>
                    <h1 class="brand-name">Indian Student Association</h1>
                    <hr class="tagline-divider">
                    <h2>
                        <small>
                            <strong>Illinois State University</strong>
                        </small>
                    </h2>
                    </center>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div>
                    <hr>
                    <h2 class="intro-text text-center">Illinois State University
                       
                        <strong>About</strong>
                    </h2>
                    <hr>
                    <img class="img-responsive img-border img-left" src="img/intro-pic.jpg" alt="">
                    <hr class="visible-xs">
                    <p>Illinois State University (ISU), founded in 1857, is the oldest public university in Illinois and is located in Normal, Illinois. The University emphasizes teaching and is recognized as one of the top ten largest producers of teachers in the US according to the American Association of Colleges of Teacher Education</p>
                    <p>Illinois State University's campus is in the twin-city community of Bloomington-Normal near the geographic center of the state, 137 miles southwest of Chicago and 164 miles northeast of St. Louis.</p>
                    <p>Originally founded as a teachers' college, the University now offers a range of programs at the bachelor, master, and doctoral levels. Illinois State is accredited by the Commission on Institutions of Higher Education of the North Central Association of Colleges and Secondary Schools. The teacher preparation programs are accredited by the National Council for Accreditation of Teacher Education and are certified by the Illinois State Board of Education. In addition, 22 programs hold discipline-based accreditation.</p>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="box">
                <div>
                    <hr>
                    <h2 class="intro-text text-center">
International Student and Community Organizations
                       
                        <strong>Registered Student Organizations</strong>
                    </h2>
                    <hr>
                    <p>Illinois State University has a number of International Registered Student Organizations (RSOs) which offer both international and American students the opportunity to expand their global perspective.  These groups, which are organized and driven by Illinois State University students, provide a dazzling array of extracurricular programs and activities throughout the school year.</p>
                    <p>All International Registered Student Organizations are coordinated and assisted by the United International Association (UIA) which is itself an International Registered Student Organization.  The United International Association originated from the International House Student Association, which in turn originated from the International House Special Affairs Committee.  Because of its historic ties to the Office of International Studies and Programs, the United International Association shares a special relationship with this office and will often partner with International House or Study Abroad to create large scale international programs for the campus community.</p>
                </div>
            </div>
        </div>

    </div>
    <!-- /.container -->



    <!-- Script to Activate the Carousel -->
    <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        })
    </script>
</asp:Content>
