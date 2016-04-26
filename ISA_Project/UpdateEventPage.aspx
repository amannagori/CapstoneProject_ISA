<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UpdateEventPage.aspx.cs" Inherits="ISA_Project.PagesAdmin.UpdateEventPage" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ContentPlaceHolderID="body" runat="server">
    <form id="form1">
        <div class="box">
            <div class="form-top">
                <div class="form-top-left">
                    <center><h2 style="color: black; font-weight: 800">Update Event Page</h2></center>
                </div>
            </div>


            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="container">
                        <div class="row">
                            <div class="box">
                                <div class="text-center">
                                    <center>
                                        <img id="imgPath" src="../Images/problemLoadingImage.jpg" runat="server" /><br />
                <table>
            <tbody>
                <%--<tr>
                    <td>
                        <img id="imgPath" src="../Images/problemLoadingImage.jpg" runat="server" />
                    </td>
                </tr>--%>
                <tr>
                    <td>Event ID: </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Label ID="eventIDText" runat="server" Text="Label" CssClass="form-control"></asp:Label>
                    </td>
                </tr>
                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
                <tr>
                    <td>Event Name: </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:Label ID="eventName1" runat="server" Text="" CssClass="form-control"></asp:Label>
                    </td>
                </tr>
                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
                <tr>
                    <td>Event Description: </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:TextBox ID="eventDesc" runat="server" Rows="5" Width="400" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>                        
                    </td>
                </tr>                                
                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
                <tr>
                    <td>Event Date: </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>
                        <asp:TextBox ID="eventDateText" CssClass="form-control" runat="server"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="eventDateCalendar" runat="server" Enabled="True" TargetControlID="eventDateText" Format="MM/dd/yyyy" />
                    </td>
                </tr>
                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>
            </tbody>
        </table>  
                                        <asp:Button ID="updateEvent" runat="server" Text="Update Event" OnClick="updateEvent_Click" /><br />
          </center>
                                </div>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--<asp:Button ID="updateEvent" runat="server" Text="Update Event" OnClick="updateEvent_Click" /><br />--%>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</asp:Content>