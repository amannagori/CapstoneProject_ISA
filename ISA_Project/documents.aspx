<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="documents.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.documents" %>


<asp:Content ContentPlaceHolderID="head" runat="server">

    <title>Documents</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <center>
        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Documents</strong>
                    </h2>
                    <hr>
                </div>
                <div class="col-md-12">
                    <p>
                        Incoming Student Guide<br />
                        <a href="Documents/INCOMING STUDENT GUIDE.pdf" target="_blank">
                            <img src="Documents/inc_stud.png" height="50" width="150">
                        </a>
                    </p>
                    <p>
                        Vaccines and Immunizations<br />
                        <a href="Documents/VACCINES AND IMMUNIZATIONS.pdf" target="_blank">
                            <img src="Documents/vac_imm.png" height="50" width="150">
                        </a>
                    </p>
                    <p>
                        Life at ISU<br />
                        <a href="Documents/LIFE AT ISU.pdf" target="_blank">
                            <img src="Documents/life_at_isu.png" height="50" width="150">
                        </a>
                    </p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
            </center>
    </div>
</asp:Content>
