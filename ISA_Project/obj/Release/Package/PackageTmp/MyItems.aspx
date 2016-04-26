<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyItems.aspx.cs"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.CommonPages.MyItems" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />

    <title>My Item</title>
</asp:Content>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="body" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="box">
            <div class="col-lg-12">
                <hr>
                <h2 class="intro-text text-center">
                    <strong>My Items</strong>
                </h2>
                <hr>
            </div>
            <div class="row">

                <div class="col-lg-12 text-center">
                    <asp:MultiView ID="itemMultiView" ActiveViewIndex="0" runat="server">


                        <asp:View ID="View1" runat="server">
                            <div id="view11">
                                <center>
                            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" OnItemCommand="Datalist1_ItemCommand"
                                BorderStyle="None" BorderWidth="" CellPadding="3" CellSpacing="2"
                                Font-Names="Verdana" Font-Size="Small" RepeatColumns="3" GridLines="Both"
                                Width="1000px">
                                <ItemTemplate>
                                    <center>
                                    <table class="table table-hover">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <img src='<%#Eval("itemImagePath") %>' height="200" width="300" runat="server" /><br />
                                                    <br />
                                                    <b>Item Id : </b>
                                                    <asp:Label ID="itemID" runat="server" Text=' <%# Bind("itemId") %>'></asp:Label></b>
                                    <br />

                                                    <b>Item Name : </b> 
                                                    <asp:Label ID="itemName1" runat="server" Text=' <%# Bind("itemName") %>'></asp:Label>
                                                    <br />
                                                    <b>Selling Price : </b>$
                                    <asp:Label ID="itemPrice1" runat="server" Text='<%# Bind("itemPrice") %>'></asp:Label>
                                                    <br />
                                                    <b>Category: </b>
                                                    <asp:Label ID="catName" runat="server" Text=' <%# Bind("categoryName") %>' ForeColor="Red"></asp:Label>
                                                    <br />
                                                    
                                                    <br />

                                                    <asp:Button ID="updateButton" runat="server" CommandName="ShowItem" CommandArgument='<%# Eval("itemId") %>'
                                                        Text="Update Item Info" />
                                                    <br />
                                                    <br />

                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                                </center>
                            </div>
                        </asp:View>
                        <%--    </div>
            </div>
        </div>--%>

                        <!-- View for updatiing Existing Item-->
                        <asp:View ID="view2" runat="server">
                            <div id="view21">
                                <%--  <div class="container">
                <div class="row" style="color: black;">
                    <div class="col-sm-12 form-box">--%>
                                <div class="form-top">
                                    <div class="form-top-left">
                                        <h2 style="color: black; font-weight: 800">Update Item</h2>
                                    </div>
                                </div>


                                <div class="form-bottom" style="background-color: #B2B3B5;">

                                    <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server"
                                        DisplayModalPopupID="deleteP" TargetControlID="deleteButton" />


                                    <cc1:ModalPopupExtender ID="deleteP" runat="server"
                                        PopupControlID="Panel2" OkControlID="ok2" CancelControlID="cancel2" TargetControlID="deleteButton">
                                    </cc1:ModalPopupExtender>

                                    <asp:Panel ID="Panel2" runat="server" BorderStyle="Groove" BackColor="WhiteSmoke" Font-Bold="true" Height="230px">
                                        <div>
                                            &nbsp;&nbsp;CONFIRMATION
                                        </div>
                                        <br />
                                        <div>
                                            &nbsp;&nbsp;&nbsp;Are you sure you want to <i style="color: red;">delete</i> an item?
                                        </div>
                                        <br />
                                        <div>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                             <asp:Button ID="ok2" class="btn btn-success" runat="server" Text="Yes" />
                                            <asp:Button ID="cancel2" class="btn btn-danger" runat="server" Text="No" />
                                        </div>
                                    </asp:Panel>


                                    Item ID:
                    <asp:TextBox runat="server" ID="item_Id" class="form-control" ReadOnly="True"></asp:TextBox><br />
                                    Item Name:
                    <asp:TextBox ID="itemName" runat="server" class="form-control" placeholder="Item name"></asp:TextBox><br />
                                    Item Desc:
                    <asp:TextBox ID="itemDesc" runat="server" class="form-control" TextMode="MultiLine" cols="20" Rows="3"></asp:TextBox><br />
                                    Item Price :
                    <asp:TextBox ID="itemPrice" class="form-control" runat="server"></asp:TextBox><br />
                                    <br />
                                    <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Update Info" OnClick="updateItem_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <asp:Button ID="deleteButton" runat="server" class="btn btn-danger" Text="Delete Item" OnClick="deleteItem_Click" />

                                    <br />
                                    <br />
                                    <asp:Label ID="lblStatus" ForeColor="Green" runat="server" Text="" />
                                </div>
                            </div>
                            <%--  </div>
                </div>
            </div>--%>
                        </asp:View>
                    </asp:MultiView>

                </div>
            </div>
        </div>

    </div>

</asp:Content>
