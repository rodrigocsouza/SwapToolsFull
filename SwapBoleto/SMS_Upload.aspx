<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SMS_Upload.aspx.cs" Inherits="SwapMobileWWW.SMS_Upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    Empresa:
    <asp:Label ID="lblEmpresa" runat="server"></asp:Label>
    <br />
    Usuário:
    <asp:Label ID="lblUsuario" runat="server"></asp:Label>
</p>
<p>
    1. Selecione o modelo a ser utilizado:<br />
    <asp:DropDownList ID="ddlModelos" runat="server" AppendDataBoundItems="True" 
        AutoPostBack="True" DataTextField="NomeModelo" DataValueField="idModelo" 
        Height="17px" onselectedindexchanged="ddlModelos_SelectedIndexChanged" 
        Width="234px">
        <asp:ListItem>Selecione...</asp:ListItem>
    </asp:DropDownList>
    <br />
    - Modelo selecionado:<br />
    <asp:Label ID="lblCorpo" runat="server"></asp:Label>
    <br />
    2. Selecione o arquivo para enviar:<br />
    <asp:FileUpload ID="fupArquivoEnvio" runat="server" Width="525px" />
    <br />
    3. Clique em enviar e aguarde a validação do arquivo:<br />
    <asp:Button ID="btnEnviarArquivo" runat="server" 
        onclick="btnEnviarArquivo_Click" Text="Enviar o arquivo para o servidor" />
    <br />
    <asp:Label ID="lblResultado" runat="server" Text="..."></asp:Label>
    <br />
    4. Confirme o envio das mensagens e aguarde a resposta (pode demorar):<asp:GridView 
        ID="GridView1" runat="server">
    </asp:GridView>
    <asp:Button ID="btnEnviar" runat="server" onclick="btnEnviar_Click" 
        Text="Enviar" />
&nbsp;<asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
    <br />
    <asp:HiddenField ID="hfIdCliente" runat="server" />
    <asp:HiddenField ID="hfIdClienteModelo" runat="server" />
    <br />
</p>
</asp:Content>
