<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var doProcessClick;
        var visibleIndex;
        function ProcessClick() {
            if (doProcessClick) {
                alert("Here is the CardClick action in the " + visibleIndex.toString() + "-th card");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <dx:ASPxCardView ID="ASPxCardView1" runat="server" AutoGenerateColumns="False" DataSourceID="AccessDataSource1" KeyFieldName="CategoryID">
        <ClientSideEvents 
            CardClick="function(s, e) {
                 doProcessClick = true;
                 visibleIndex = e.visibleIndex+1;
                 window.setTimeout(ProcessClick,500);
            }" 
            CardDblClick="function(s, e) {
                doProcessClick = false;
                var key = s.GetCardKey(e.visibleIndex);
                alert('Here is the CardDoubleClick action in a card with the Key = '+key);
            }" />
        <SettingsBehavior AllowFocusedCard="True" />
        <Columns>
            <dx:CardViewTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
            </dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="CategoryName" VisibleIndex="1">
            </dx:CardViewTextColumn>
            <dx:CardViewTextColumn FieldName="Description" VisibleIndex="2">
            </dx:CardViewTextColumn>
        </Columns>
        </dx:ASPxCardView> 
        <asp:accessdatasource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT * FROM [Categories]"></asp:accessdatasource>           
    </div>
    </form>
</body>
</html>