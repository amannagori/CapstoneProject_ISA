<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.CommonPages.ForgotPassword" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
     <link href="css/style.css" rel="stylesheet" />
   
    <title>Forgot Password</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row" style="color: black;">
            <div class="col-sm-8 form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h4 style="color: black; font-weight: 800">Please Enter Your Email to Retrive Your Password:</h4>
                    </div>
                </div>


                <div class="form-bottom" style="background-color: #B2B3B5;">

                    <span style="text-align: center; font-weight: bold; font-size: 20px">Email Address:
                    </span>
                    <asp:TextBox ID="txtEmail" runat="server" class="form-control" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                       ValidationGroup="forgotPass" ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="Email ID cannot be blank!"></asp:RequiredFieldValidator>

                    <br />
                    <br />
                    <asp:Button Text="Send" runat="server" ValidationGroup="forgotPass" class="btn btn-primary" OnClick="SendEmail" />
                    <br />

                    <asp:Label ID="lblMessage" runat="server"></asp:Label>

                </div>
            </div>
        </div>
    </div>


</asp:Content>
