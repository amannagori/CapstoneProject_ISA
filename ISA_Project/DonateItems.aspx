<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DonateItems.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.CommonPages.DonateItems" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
     <link href="css/style.css" rel="stylesheet" />
   
    <title>Add Item</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <div class="row" style="color: black;">
            <div class="col-sm-6 form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h2 style="color: black; font-weight: 800">Add/Sell Item</h2>
                    </div>
                </div>


                <div class="form-bottom" style="background-color: #B2B3B5;">
                    Categories:<br />
                        <asp:DropDownList ID="ddl_categories" class="form-control" runat="server">
                        </asp:DropDownList><br />
                          
                        Item Name:<br />
                        <asp:TextBox ID="itemName" class="form-control" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ForeColor="Red" ControlToValidate="itemName" ErrorMessage="Required Field...!!!"></asp:RequiredFieldValidator>
                          
                                <br />
                                Item Price:<br />
                        <asp:TextBox ID="itemPrice" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ForeColor="Red" ControlToValidate="itemPrice" ErrorMessage="Required Field...!!!"></asp:RequiredFieldValidator>
                          
                                <br />
                                Item Description:<br />
                      <%--  <asp:TextBox ID="itemDesc" runat="server" TextMode="MultiLine" cols="20" rows="2"></asp:TextBox>--%>
                                <textarea id="itemDesc" name="itemDesc" class="form-control" cols="20" rows="3"></textarea>
                                <br />
                                Upload Image: 
                        <asp:FileUpload ID="imgUpload"  class="form-control" runat="server" /><br />
                                <asp:Label ID="lblStatus" runat="server" Text="" />
                                <br />
                                <br />
                                <asp:Button ID="sellButton" class="btn btn-primary" runat="server" Text="Submit" OnClick="sellButton_Click" />
                                <br />
                                <br />
                                <asp:Label ID="Label1" ForeColor="Green" runat="server" Text="" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
