<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="SMS_Individual.aspx.cs" Inherits="SwapMobileWWW.SMS_Individual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script language="Javascript" type="text/javascript">
        function tbLimit() {

            var tbObj = event.srcElement;
            if (tbObj.value.length == tbObj.maxLength * 1) return false;

        }

        function tbCount(visCnt) {
            var tbObj = event.srcElement;

            if (tbObj.value.length > tbObj.maxLength * 1) tbObj.value = tbObj.value.substring(0, tbObj.maxLength * 1);
            if (visCnt) visCnt.innerText = tbObj.maxLength - tbObj.value.length;

        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Empresa:
        <asp:Label ID="lblEmpresa" runat="server"></asp:Label>
        <br />
        Usuário:
        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
        <br />
        - Destinatário<br />
        DDD:
        <asp:TextBox ID="txbDDD" runat="server" MaxLength="2" Width="20px"></asp:TextBox>
        &nbsp;Telefone:
        <asp:TextBox ID="txbTelefone" runat="server" Width="65px"></asp:TextBox>
        &nbsp;Obs: Utilize somente números<br />
        Mensagem: <asp:Label ID="lblContador" runat="server">150</asp:Label>
        &nbsp;caracteres restantes.<br />
        <asp:TextBox ID="txbMensagem" runat="server" Height="75px" MaxLength="150" TextMode="MultiLine"
            Width="365px" onblur="Conta(this);"></asp:TextBox>
        <br />
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnEnviar" runat="server" Text="Enviar" 
            onclick="btnEnviar_Click" />
        &nbsp;<asp:Button ID="btnLimpar" runat="server" Text="Limpar" 
            onclick="btnLimpar_Click" />
    &nbsp;</p>
</asp:Content>
