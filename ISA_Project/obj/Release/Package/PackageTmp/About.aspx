<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.About" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
   
    <title>About Us</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">

    
    <div class="container">

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">About
                        <strong>Indian Student Association at Ilinois State University</strong>
                    </h2>
                    <hr>
                </div>
                <div class="col-md-6">
                    <img class="img-responsive img-border-left" src="img/slide-2.jpg" alt="">
                </div>
                <div class="col-md-6">
                    <p>Indian Student Association (ISA), a registered student organization of Illinois State University. </p>
					<p>It primarily aims at helping Indian students, and main focus of the organization is to carry on a strong tradition of spreading awareness of Indian culture and traditions, promoting cultural exchange and embracing diversity among all individuals and communities. </p>
					<p>This is accomplished through social and cultural activities, general body meetings, community service and interaction with other student organizations.</p>
					<p>All our events are open to all the students on campus.</p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

           <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Our
                        <strong>Team</strong>
                    </h2>
                    <hr>
                </div>
                
                <div class="col-lg-12">
                    <div class="col-sm-2 text-center">
                        <img class="img-responsive" src="Images/alok.jpg" alt="">
                        <p>
                            Alok Narvekar
                        </p>
                    </div>
                    <div class="col-sm-2 text-center">
                        <img class="img-responsive" src="Images/aman.jpg" alt="">
                        <p>
                            Aman Nagori
                        </p>
                    </div>
                    <div class="col-sm-2 text-center">
                        <img class="img-responsive" src="Images/kavya.jpg" alt="">
                        <p>
                            Kavya Gupta
                        </p>
                    </div>
                <%--</div>
                
                <div class="col-lg-12">--%>
                    <div class="col-sm-2 text-center">
                        <img class="img-responsive" src="Images/mansi.jpg" alt="">
                        <p>
                            Mansi Jain
                        </p>
                    </div>
                    <div class="col-sm-2 text-center">
                        <img class="img-responsive" src="Images/piyush.jpg" alt="">
                        <p>
                            Piyush Salunke
                        </p>
                    </div>
                    <div class="col-sm-2 text-center">
                        <img class="img-responsive" src="Images/sopan.jpg" alt="">
                        <p>
                            Sopan Dobhal
                        </p>
                    </div>
                </div>

                <div class="clearfix"></div>
                </div>
        </div>

    </div>
</asp:Content>