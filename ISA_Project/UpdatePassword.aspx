<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePassword.aspx.cs" 
   MasterPageFile="~/Main.Master" Inherits="ISA_Project.CommonPages.UpdatePassword" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
     <link href="css/style.css" rel="stylesheet" />
   

</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
       <div class="container">
        <div class="row" style="color:black;">
            <div class="col-sm-7 form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h2 style="color:black;font-weight:800">Update Password</h2>
                    </div>
                </div>


                <div class="form-bottom">
            <asp:Label ID="Label1" runat="server" Text="Enter    Password"></asp:Label>
            <asp:TextBox ID="passwordtxt" runat="server" class="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="passwordtxt"
                ForeColor="red" ValidationGroup="updatePass" ErrorMessage="Password cannot be blank!"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" Text="Confirm Password"></asp:Label>
            <br />
            <asp:TextBox ID="confirmtxt" runat="server" class="form-control" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" ValidationGroup="updatePass" runat="server" ForeColor="red"
                 ControlToValidate="confirmtxt" ControlToCompare="passwordtxt" ErrorMessage="Password does not match!!"></asp:CompareValidator>
            <br />
            <br />
            <asp:Button ID="UpdatePass" runat="server" ValidationGroup="updatePass" Text="Update Password" class="btn btn-primary" OnClick="UpdatePassword_Click" />
       
            <br />
            <asp:Label ID="passUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
          </div>
            </div>
        </div>
    </div>
 </asp:Content>