<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes_Detalhes.aspx.cs" Inherits="SwapMobileWWW.Admin.Clientes_Detalhes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Cadastro de Clientes - Detalhes</h3>
    <p>
        <asp:Label ID="Label11" runat="server" Text="- Dados da Empresa"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Razão Social:"></asp:Label>
&nbsp;<asp:TextBox ID="txbRazaoSocial" runat="server" Width="500px"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Nome Fantasia:"></asp:Label>
&nbsp;<asp:TextBox ID="txbNomeFantasia" runat="server" Width="487px"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="CNPJ:"></asp:Label>
&nbsp;<asp:TextBox ID="txbCNPJ" runat="server" Width="193px"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Endereço:"></asp:Label>
&nbsp;<asp:TextBox ID="txbEndereco" runat="server" Width="517px"></asp:TextBox>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Bairro:"></asp:Label>
&nbsp;<asp:TextBox ID="txbBairro" runat="server" Width="325px"></asp:TextBox>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Cidade:"></asp:Label>
        <asp:TextBox ID="txbCidade" runat="server" Width="323px"></asp:TextBox>
        <asp:Label ID="Label7" runat="server" Text="UF:"></asp:Label>
        <asp:TextBox ID="txbUF" runat="server" Width="33px"></asp:TextBox>
        <asp:Label ID="Label8" runat="server" Text="CEP:"></asp:Label>
        <asp:TextBox ID="txbCEP" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label10" runat="server" Text="- Dados de Contato"></asp:Label>
        <br />
        <asp:Label ID="Label9" runat="server" Text="Nome:"></asp:Label>
&nbsp;<asp:TextBox ID="txbNome" runat="server" Width="534px"></asp:TextBox>
        <br />
        <asp:Label ID="Label12" runat="server" Text="Telefone:"></asp:Label>
&nbsp;<asp:TextBox ID="txbTelefone" runat="server" Width="235px"></asp:TextBox>
        <br />
        <asp:Label ID="Label13" runat="server" Text="Email:"></asp:Label>
&nbsp;<asp:TextBox ID="txbEmail" runat="server" Width="252px"></asp:TextBox>
        <br />
        <asp:Label ID="Label14" runat="server" Text="- Administração"></asp:Label>
        <br />
        <asp:CheckBox ID="ckbAdmin" runat="server" 
            Text="Empresa pode usar a administração do site" />
        <br />
        <asp:Button ID="btnSalvar" runat="server" onclick="btnSalvar_Click" 
            Text="Salvar" />
&nbsp;<asp:Button ID="btnCancelar" runat="server" onclick="btnCancelar_Click" 
            Text="Cancelar" />
        <br />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    </p>
    <asp:HiddenField ID="hfIdCliente" runat="server" />
    <br />
</asp:Content>
