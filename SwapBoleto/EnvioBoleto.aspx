<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EnvioBoleto.aspx.cs" Inherits="SwapMobileWWW.EnvioBoleto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
    Gerar Boleto de Teste<br />
    <strong>Dados do Sacado</strong><br />
    Nome/Razão Social:<br />
    <asp:TextBox ID="txbNome" runat="server" Width="324px">José Silva</asp:TextBox>
    <br />
    Endereço:<br />
    <asp:TextBox ID="txbEndereco" runat="server" Width="324px">Av. Rio Branco 980 sl 1505</asp:TextBox>
    <br />
    CPF/CNPJ:<br />
    <asp:TextBox ID="txbCPF" runat="server" Width="179px">864.567.645-98</asp:TextBox>
    <br />
    Bairro:<br />
    <asp:TextBox ID="txbBairro" runat="server" Width="215px">Centro</asp:TextBox>
    <br />
    Cidade:<br />
    <asp:TextBox ID="txbCidade" runat="server" Width="324px">Rio de Janeiro</asp:TextBox>
    <br />
    UF:<br />
    <asp:TextBox ID="txbUF" runat="server" Width="40px">RJ</asp:TextBox>
    <br />
    CEP:<br />
    <asp:TextBox ID="txbCEP" runat="server" Width="123px">22.876-043</asp:TextBox>
    <br />
    DDD:
    <asp:TextBox ID="txbDDD" runat="server" Width="41px"></asp:TextBox>
&nbsp;Celular:
    <asp:TextBox ID="txbCelular" runat="server" Width="141px"></asp:TextBox>
    <br />
    <asp:Button ID="btnEnviar" runat="server" onclick="btnEnviar_Click" 
        Text="Enviar Boleto" />
&nbsp;<asp:Button ID="btnLimpar" runat="server" Text="Limpar" />
    <br />
    <asp:Label ID="lblResultado" runat="server"></asp:Label>
</p>
</asp:Content>
