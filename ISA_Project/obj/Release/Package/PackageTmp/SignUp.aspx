<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.SignUp" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <title>SignUp</title>
</asp:Content>


<asp:Content ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row" style="color:black;">
            <div class="col-sm-6 form-box">
                <div class="form-top">
                    <div class="form-top-left">
                        <h2 style="color:black;font-weight:800">Sign Up</h2>
                    </div>
                </div>


                <div class="form-bottom" style="background-color: #B2B3B5;">

                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                           
                            <asp:Label ID="Label6" runat="server" Text="User ID"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtuser" class="form-control" runat="server" placeholder="Enter User ID"></asp:TextBox>
                            <asp:Label runat="server" Text=""></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="signUp" runat="server" ControlToValidate="txtuser" ForeColor="Red"
                                ErrorMessage="User ID cannot be blank!"></asp:RequiredFieldValidator>
                            <br />
                            


                            <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtfirst" class="form-control" runat="server" placeholder="Enter First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="signUp" runat="server" ControlToValidate="txtfirst"
                                ForeColor="Red" ErrorMessage="First Name cannot be blank!"></asp:RequiredFieldValidator>
                            <br />
                           
                            <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtlast" class="form-control" runat="server" placeholder="Enter Last Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="signUp"
                                ForeColor="Red" ControlToValidate="txtlast" ErrorMessage="Last Name cannot be blank!"></asp:RequiredFieldValidator>
                            <br />
                           
                            <asp:Label ID="Label3" runat="server" Text="Carrier"></asp:Label>
                            <br />
                            <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Selected="True">Choose Provider</asp:ListItem>
                                <asp:ListItem>alltel</asp:ListItem>
                                <asp:ListItem>att cingular</asp:ListItem>
                                <asp:ListItem>boost mobile</asp:ListItem>
                                <asp:ListItem>cingular</asp:ListItem>
                                <asp:ListItem>metro pcs</asp:ListItem>
                                <asp:ListItem>nextel</asp:ListItem>
                                <asp:ListItem>powertel</asp:ListItem>
                                <asp:ListItem>sprint nextel</asp:ListItem>
                                <asp:ListItem>suncom</asp:ListItem>
                                <asp:ListItem>t-mobile</asp:ListItem>
                                <asp:ListItem>us cellular</asp:ListItem>
                                <asp:ListItem>verizon</asp:ListItem>
                                <asp:ListItem>virgin mobile</asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            
                            <asp:Label runat="server" Text="Phone Number"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtphone" class="form-control" runat="server" placeholder="Phone Format XXX-XXX-XXXX" ></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtphone" runat="server" 
                               ForeColor="Red" ValidationExpression="^[0-9]{3}-[0-9]{3}-[0-9]{4}$" ValidationGroup="signUp"
                                ErrorMessage="Please enter the phone number in this format XXX-XXX-XXXX">

                            </asp:RegularExpressionValidator>
                            <br />
                          
                            <asp:Label runat="server" Text="Email ID"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtemail" class="form-control" runat="server" placeholder="Enter Email ID"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="signUp"
                                ForeColor="Red" ControlToValidate="txtemail" ErrorMessage="Email ID cannot be blank!"></asp:RequiredFieldValidator>

                            <asp:Label ID="emailexist" ForeColor="Red" runat="server" Text=""></asp:Label>

                            <br />
                          


                            <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtpassword" class="form-control" runat="server" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="signUp"
                                ForeColor="Red" ControlToValidate="txtpassword" ErrorMessage="Password cannot be blank!"></asp:RequiredFieldValidator>
                            <br />
                           
                            <asp:Label ID="Label8" runat="server" Text="Confirm Password"></asp:Label>
                            <br />
                            <asp:TextBox ID="txtconfirm" class="form-control" runat="server" placeholder="Re-enter Password" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="signUp"
                                ForeColor="Red" ControlToValidate="txtconfirm" ControlToCompare="txtpassword" ErrorMessage="Password does not match!!"></asp:CompareValidator>
                            <br />
                    
                            <asp:Label ID="Label9" runat="server" Text="When are you graduating?"></asp:Label>
                            <br />
                            <asp:Label ID="Label10" runat="server" Text="Semester"></asp:Label>
                            <asp:DropDownList class="form-control" ID="DropDownList2" runat="server">
                                <asp:ListItem Value="">Select</asp:ListItem>
                                <asp:ListItem Value="Fall"></asp:ListItem>
                                <asp:ListItem Value="Spring"></asp:ListItem>
                                <asp:ListItem Value="Summer"></asp:ListItem>
                            </asp:DropDownList>
                            <br />
                            <asp:Label ID="Label11" runat="server" Text="Year"></asp:Label>
                            <asp:TextBox ID="txtyear" class="form-control" runat="server" placeholder="Enter Year"></asp:TextBox>
                            <br />
                             <asp:CheckBox ID="CheckBox1"  runat="server" />
                            <asp:Label ID="Label12" runat="server" Text="Subscribe for Text Msg for an Event at ISA"></asp:Label>
                          
                            <br />
                            <br />
                            <asp:Button ID="btnsubmit" runat="server" Text="Submit" ValidationGroup="signUp" class="btn btn-primary" OnClick="btnsubmit_Click" />

                            <br />
                            <br />
                            <asp:Label ID="error" ForeColor="Red" runat="server" Text=""></asp:Label>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
