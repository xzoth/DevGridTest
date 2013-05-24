<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .centerv {
            width: 200px;
            height: 60px;
            position: absolute;
            left: 50%;
            top: 50%;
            margin: -30px 0 0 -100px;
            border: thin;
            text-align: center;
            line-height: 60px;
            overflow: hidden;
            background-color: white;
            border-radius: 15px; 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
                <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="updatePanel">
                    <ProgressTemplate>
                        <div class="centerv">loading...</div>
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <div>
                    Name:<dx:ASPxTextBox ID="txtBoxName" runat="server" Width="170px"></dx:ASPxTextBox>
                    <dx:ASPxComboBox ID="cmbName" runat="server" ValueType="System.String"
                        EnableIncrementalFiltering="true" DropDownStyle="DropDown">
                    </dx:ASPxComboBox>
                    <dx:ASPxButton ID="btnQuery" runat="server" Text="Query" OnClick="btnQuery_Click"></dx:ASPxButton>
                </div>
                <div>

                    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" Width="100%">
                        <SettingsPager Mode="ShowAllRecords" Visible="false">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="480" ShowVerticalScrollBar="true" />
                        <Styles AlternatingRow-Enabled="True"></Styles>
                    </dx:ASPxGridView>
                    <dx:ASPxPager ID="pager" runat="server" ItemsPerPage="20" Visible="true" OnPageIndexChanged="pager_PageIndexChanged">
                    </dx:ASPxPager>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="pager" EventName="PageIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
</html>
