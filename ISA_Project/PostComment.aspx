<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostComment.aspx.cs" MasterPageFile="~/Main.Master"
    Inherits="ISA_Project.PostComment" EnableEventValidation="false" %>

<asp:Content ContentPlaceHolderID="head" runat="server">
    <link href="css/PostComment.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
     <script>
                            function getLoginModal() {
                                $("#myModal").modal('show');
                            }

         </script>
</asp:Content>

<asp:Content ContentPlaceHolderID="body" runat="server">

    <div class="container">

        <div class="row">
            <div class="box">
                <h3><asp:Label class="box" ID="noChatBox"  runat="server" Visible="false" Text="Please login to access this page"></asp:Label></h3>
                <div class="text-center" id="chatBox" runat="server">
                    <ul class="nav nav-tabs" data-tabs="tabs">
                        <li role="presentation" class="active"><a href="#One" data-toggle="tab">Start Discussion</a></li>
                      <%--  <li role="presentation"><a href="#Two" data-toggle="tab">Sell Something</a></li>--%>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="One">
                            <form id="tab1-form" role="form" class="container-fluid">
                                <div class="row">
                                    <br />
                                    <asp:TextBox ID="TextBox1" TextMode="multiline" runat="server" Style="width: 600px; height: 100px;" placeholder="What are you doing right now?"></asp:TextBox>

                                    <br />
                                    <asp:Button ID="Button1" runat="server" Text="Post" class="btn btn-success green fa fa-share" OnClick="Button1_Click" />
                                </div>
                            </form>
                        </div>

                        <div class="tab-pane" id="Two">
                            <form id="tab2-form" role="form" class="container-fluid">
                                <div class="row" style="color: black;">
                                    <div class="col-sm-8 form-box">
                                        <div class="form-top">
                                            <div class="form-top-left">
                                                <h4 style="color: black; font-weight: 600">Add Item</h4>
                                            </div>
                                        </div>

                                        <div class="form-bottom" style="background-color: #B2B3B5;">
                                            <br />
                                            <center>
                                                                                    <table>
                                            <tr>
                                                <td>Categories:
                                                </td>

                                                <td>
                                                    <asp:DropDownList ID="ddl_categories" class="form-control" runat="server">
                                                    </asp:DropDownList><br />
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Item Name:
                                                </td>

                                                <td>
                                                    <asp:TextBox ID="itemName" class="form-control" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>Item Price:
                                                </td>

                                                <td>
                                                    <asp:TextBox ID="itemPrice" class="form-control" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>


                                            <tr>
                                                <td>Item Description:
                                                </td>

                                                <td>
                                                   
                                                    <textarea id="itemDesc" name="itemDesc" class="form-control" cols="20" rows="3"></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Add an image             
                                                </td>

                                                <td>
                                                    <asp:FileUpload ID="imgUpload" class="form-control" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblStatus" ForeColor="Green" runat="server" Text="" />
                                                </td>

                                            </tr>
                                                                                        </table>
                                            <br />
                                            </center>

                                            <center>
                                                <asp:Button ID="sellButton" runat="server" Text="Submit" class="btn btn-success green fa fa-share" OnClick="sellButton_Click" /></center>
                                            <br />

                                            <center>          <asp:Label ID="Label1" ForeColor="Green" runat="server" Text="" /></center>

                                        </div>

                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div>
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

                                    <div id="imageId" style="height" runat="server" visible='<% # Convert.ToBoolean(Eval("visibility")) %>'> 
                                        <center><asp:Image ID="Image2" ImageUrl='<%# Eval("itemImagePath") %>' height="250" width="300" runat="server" /></center>
                                    </div>

                                    <div class="post-description" style="text-align: left">
                                        <%--<p style="text-align:left"><%# Eval("itemDesc") %></p>--%>
                                        <asp:Label runat="server" Text='<%# Eval("itemDesc") %>'></asp:Label><br />
                                        <asp:Label runat="server" Text='<%# Eval("itemPrice") %>'></asp:Label><br />
                                        <b>Contact Info:</b>
                                        <asp:Label runat="server" Text='<%# Eval("email") %>'></asp:Label><br />
                                    </div>
                                    <div class="post-footer">
                                        <div class="input-group" id="commentInput">
                                            <asp:TextBox ID="TextBox2" class="form-control" placeholder="Add a comment" runat="server"></asp:TextBox>
                                            <span class="input-group-addon">
                                                <asp:Button ID='button2' runat="server" Text="Comment" class="btn btn-success green fa fa-share"
                                                    OnClick="Button2_Click" CommandArgument='<%# Eval("itemId") %>' />
                                            </span>
                                        </div>
                                        <div id="comment">
                                            <asp:Repeater ID="commentRepeater" runat="server">
                                                <ItemTemplate>
                                                    <div class="comments-list">
                                                        <div class="comment">
                                                            <a class="pull-left" href="#">
                                                                <img class="avatar" src="http://bootdey.com/img/Content/user_1.jpg" alt="avatar">
                                                            </a>
                                                            &nbsp;&nbsp;&nbsp;<div class="comment-body" style="text-align: left">
                                                                <div class="comment-heading">
                                                                    <a href="#" class="user"><%# Eval("firstName") %> <%# Eval("lastName") %></a>
                                                                </div>
                                                                <div style="text-align: left">
                                                                    <asp:Label runat="server" Text='<%# Eval("commentMsg") %>'></asp:Label>
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
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
