<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="EventCommittee.aspx.cs" MasterPageFile="~/Main.Master" Inherits="ISA_Project.PagesCommon.EventCommittee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ContentPlaceHolderID="body" runat="server">
    <form id="form1">
        <div class="container">

            <div class="row">
                <div class="box">
                    <div class="text-center">
                        <hr>
                        <h2 class="intro-text text-center">
                            <strong>Events</strong>
                        </h2>
                        <hr>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <center>
                        <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal"
                            BorderStyle="None" BorderWidth="" CellPadding="3" CellSpacing="2"
                            Font-Names="Verdana" Font-Size="Small" RepeatColumns="1" GridLines="Both"
                            Width="600px" OnItemCommand="Datalist1_EventCommand">
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
                                                        &nbsp;&nbsp;&nbsp;Are you sure you want to <i style="color: red;">delete</i> this event?
                                                    </div>
                                                    <br />
                                                    <div>
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                             <asp:Button ID="ok2" class="btn btn-success" runat="server" Text="Yes" />
                                                        <asp:Button ID="cancel2" class="btn btn-danger" runat="server" Text="No" />
                                                    </div>
                                                </asp:Panel>

                                                <asp:Button ID="updateButton" runat="server" CommandName="UpdateEvent" CommandArgument='<%# Eval("eventId") %>'
                                                    Text="Edit Event Info" class="btn btn-primary" />&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="deleteButton" runat="server" CommandName="DeleteEvent" CommandArgument='<%# Eval("eventId") %>'
                                    Text="Delete Event" class="btn btn-danger" />
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
