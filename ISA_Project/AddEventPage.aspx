<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" MasterPageFile="~/Main.Master"
    CodeBehind="AddEventPage.aspx.cs" Inherits="ISA_Project.AddEventPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <form id="form1">
        <div>
            <div class="box">
                <div class="form-top">
                    <div class="form-top-left">
                        <center><h2 style="color: black; font-weight: 800">Add Event Page</h2></center>
                    </div>
                </div>
            </div>
            <div class="container">

            
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <%--<div class="container">--%>

                        <div class="row">
                            <div class="box">
                                <div class="text-center">

                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Event Name: </td>
                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:TextBox ID="eventName" runat="server" CssClass="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Event Description: </td>
                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:TextBox ID="eventDesc" runat="server" CssClass="form-control" Rows="5" Width="400" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Event Date: </td>
                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                <td>
                                                    <asp:TextBox ID="eventDateText" runat="server" CssClass="form-control"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender ID="eventDateCalendar" runat="server" Enabled="True" TargetControlID="eventDateText" Format="MM/dd/yyyy" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    <%--</div>--%>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:FileUpload ID="imgUpload" runat="server" CssClass="form-control" />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <asp:Button ID="createEvent" class="btn btn-success" runat="server" Text="Create Event" OnClick="createEvent_Click" /><br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
        </div>
    </form>
</asp:Content>
