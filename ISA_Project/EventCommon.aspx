<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventCommon.aspx.cs" EnableEventValidation="false"
    MasterPageFile="~/Main.Master" Inherits="ISA_Project.PagesCommon.Event" %>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <form id="form1">
        <div class="container">

            <div class="row">
                <div class="box">
                      <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>Events</strong>
                    </h2>
                    <hr>
                </div>
                        <center>
                        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal"
                            BorderStyle="None" BorderWidth="" CellPadding="3" CellSpacing="2"
                            Font-Names="Verdana" Font-Size="Small" RepeatColumns="1" GridLines="Both"
                            Width="600px">
                            <ItemTemplate>
                                <table class="table table-hover">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <img src='<%#Eval("imagePath") %>' runat="server" /><br />
                                                <br />
                                                <b>Event ID : </b>
                                                <asp:Label ID="eventID" runat="server" Text=' <%# Bind("eventId") %>'></asp:Label></b>
                                    <br />

                                                <b>Event Name : </b>
                                                <asp:Label ID="eventName" runat="server" Text=' <%# Bind("eventName") %>'></asp:Label>
                                                <br />
                                                <b>Event Date : </b>
                                                <asp:Label ID="eventDate" runat="server" Text='<%# Bind("eventDate") %>'></asp:Label>
                                                <br />
                                                <b>Event Description : </b>
                                                <asp:Label ID="eventDesc" runat="server" Text=' <%# Bind("eventDesc") %>'></asp:Label>
                                                <br />
                                                <br />
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
                </div>
            </div>
        </div>
    </form>
</asp:Content>
