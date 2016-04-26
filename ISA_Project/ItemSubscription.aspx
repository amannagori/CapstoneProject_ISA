<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSubscription.aspx.cs" 
    Inherits="ISA_Project.CommonPages.ItemSubscription" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
              <p style="color:green;">
                <strong>    Subscribe to category</strong>
                </p>
                <p>
                 <asp:CheckBoxList ID="subList" runat="server" 
                        RepeatDirection="Vertical">
                     <asp:ListItem Text="111" Value="aman">aman</asp:ListItem>
                    </asp:CheckBoxList> 
                
                </p>
                <p>
                    <asp:Button ID="subscribeBtn" class="btn btn-success" runat="server" OnClick="subscribeBtnClick" Text="Subscribe" />
                </p>
                <p>
                    <asp:Label ID="subscribeMsg" runat="server" ForeColor="Green"></asp:Label>
                </p>
    </div>

        <div>

               <p style="color:brown;">
                <strong>   Unsubscribe from categories</strong> 
                </p>
                <p>
                    <asp:CheckBoxList ID="unsubList" runat="server" RepeatDirection="Vertical"></asp:CheckBoxList>
                </p>
                <p>
                    <asp:Button ID="unsubscribeBtn" class="btn btn-danger" runat="server" OnClick="unsubscribeBtnClick" Text="Unsubscribe" />
                </p>
                <p>
                    <asp:Label ID="unsubscribeMsg" runat="server" ForeColor="Green"></asp:Label>
                </p>
        </div>
    </form>
</body>
</html>
