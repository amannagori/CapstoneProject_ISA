<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleChange.aspx.cs" Inherits="ISA_Project.RoleChange"
    MasterPageFile="~/Main.Master" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />

    <title>Role Change</title>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <asp:MultiView ID="userMultiView" ActiveViewIndex="0" runat="server">
            <asp:View ID="View1" runat="server">
                <br />
                <asp:Label runat="server" ID="roleChange" ForeColor="green" Font-Size="X-Large" BackColor="Yellow"></asp:Label>
                <br />
                <center>
                <asp:GridView ID="roleChangeGrid" runat="server" AutoGenerateColumns="False" OnRowCommand="RoleChange_Command" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="User Id" HeaderText="User Id" />
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="lblfname" runat="server" Text='<%# Eval("First Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="lbllname" runat="server" Text='<%# Eval("Last Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Associated Role">
                            <ItemTemplate>
                                <asp:Label ID="assoRole" runat="server" Text='<%# Eval("Associated Role") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="RoleChangeUser" runat="server" Text="Edit Role" CommandName="View User"
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                    </center>
            </asp:View>


            <asp:View ID="View2" runat="server">


                <div class="row" style="color: black;">
                    <div class="col-sm-6 form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <h2 style="color: black; font-weight: 800">Role Change</h2>
                            </div>
                        </div>


                        <div class="form-bottom" style="background-color: #B2B3B5;">
                            User ID:
                    <asp:TextBox runat="server" ID="userid" class="form-control" ReadOnly="True"></asp:TextBox><br />
                            First Name:
                    <asp:TextBox ID="fname" runat="server" class="form-control" ReadOnly="True" placeholder="First name"></asp:TextBox><br />
                            Last Name:
                    <asp:TextBox ID="lname" runat="server" class="form-control" ReadOnly="True" placeholder="Last name"></asp:TextBox><br />
                            Email
                    <asp:TextBox ID="email" runat="server" class="form-control" ReadOnly="True" placeholder="Email"></asp:TextBox><br />

                            Roles:
                    <asp:DropDownList ID="ddl_roles" class="form-control" runat="server">
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        <asp:ListItem Value="PU">Public User</asp:ListItem>
                        <asp:ListItem Value="CM">Committe Member</asp:ListItem>
                    </asp:DropDownList>
                            <br />
                            <br />

                            <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Update Role" OnClick="UpdateRole" />

                        </div>
                    </div>
                </div>

            </asp:View>


        </asp:MultiView>
    </div>
</asp:Content>
