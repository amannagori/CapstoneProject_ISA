<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyComments.aspx.cs" MasterPageFile="~/Main.Master"
    Inherits="ISA_Project.MyComments" EnableEventValidation="false" %>


<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/PostComment.css" rel="stylesheet" />
    <title>My Comment</title>
</asp:Content>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div>
                <h3><asp:Label ID="noComments" class="box"  runat="server" Visible="false" Text="There are no comments available"></asp:Label></h3>
                <div>
                    <asp:Repeater ID="itemRepeater" runat="server" OnItemDataBound="ItemBound">
                        <ItemTemplate>
                            <div class="col-sm-12">
                                <div class="panel panel-white post panel-shadow" style="border-color: black; border: solid">
                                    <div class="post-heading">
                                        <div class="pull-left image">
                                            <img src="http://bootdey.com/img/Content/user_1.jpg" class="img-circle avatar" alt="user profile image">
                                        </div>
                                        <div class="pull-left meta">
                                            <div class="title h5">
                                                <a href="#"><b><%# Eval("firstName") %> <%# Eval("lastName") %></b></a>
                                                made a post.
                                            </div>

                                            <asp:TextBox ID="itemId" Visible="false" runat="server" Text='<%# Eval("itemId") %>'></asp:TextBox>
                                            <%--<h6 id="itemId" hidden="hidden"><%# Eval("itemId") %></h6>--%>
                                        </div>
                                    </div>

                                    <div id="imageId">
                                        <center><asp:Image ID="Image2" ImageUrl='<%# Eval("itemImagePath") %>' runat="server" /></center>
                                    </div>

                                    <div class="post-description" style="text-align: left">
                                        <%--<p style="text-align:left"><%# Eval("itemDesc") %></p>--%>
                                        <asp:Label runat="server" Text='<%# Eval("itemDesc") %>'></asp:Label><br />
                                        <asp:Label runat="server" Text='<%# Eval("itemPrice") %>'></asp:Label><br />
                                        <b>Contact Info:</b>
                                        <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label><br />
                                    </div>
                                    <div class="post-footer">
                                        <div id="comment">
                                            <asp:Repeater ID="commentRepeater" runat="server">
                                                <ItemTemplate>
                                                    <div class="comments-list">
                                                        <div class="comment">
                                                            <a class="pull-left" href="#">
                                                                <img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                                                            </a>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <div class="comment-body" style="text-align: left">                                                                
                                                                <div class="comment-heading">
                                                                    <a href="#" class="user"><%# Eval("firstName") %> <%# Eval("lastName") %></a>
                                                                </div>
                                                                <div style="text-align: left">
                                                                    <asp:Label runat="server" Text='<%# Eval("commentMsg") %>'></asp:Label>
                                                                <%--</div>
                                                                <div class="pull-right">--%>
                                                                    <asp:Button class="btn btn-success green fa fa-share pull-right" ID="Button1" runat="server" Text="Delete" OnClick="Button1_Click" CommandArgument='<%# Eval("commentId") %>' />
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
