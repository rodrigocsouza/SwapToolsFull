<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="SwapMobileWWW.Admin.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Cadastro de Usuários 
    <asp:Label ID="lblCliente" runat="server"></asp:Label></h3>
    <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idUsuario" onrowcommand="gvUsuarios_RowCommand" 
        EmptyDataText="Ainda não existem usuários cadastrados para este cliente">
        <Columns>
            <asp:HyperLinkField DataTextField="usuario" HeaderText="Usuário" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:CheckBoxField DataField="Admin" HeaderText="Administrador">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CheckBoxField>
            <asp:TemplateField HeaderText="Detalhes" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("idUsuario") %>' CommandName="Detalhes" Height="46px" 
                        ImageUrl="~/Images/Icons/blog_compose.png" Text="" Width="46px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="false" 
                        CommandName="" Height="46px" ImageUrl="~/Images/Icons/blog_delete.png" Text="" 
                        Width="46px" />
                </ItemTemplate>
                <ItemStyle Height="18px" HorizontalAlign="Center" VerticalAlign="Middle" 
                    Width="18px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    

    <asp:ImageButton ID="imgNovo" runat="server" AlternateText="Adicionar Usuário" 
        CausesValidation="False" Height="58px" ImageUrl="~/Images/Icons/blog_add.png" 
        onclick="imgNovo_Click" ToolTip="Adicionar Usuário" Width="57px" />
    <asp:Panel ID="pnlDadosUsuarios" runat="server" Visible="False">
        <asp:Label ID="Label1" runat="server" 
    Text="- Dados do Usuário"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Usuário:"></asp:Label>
        &nbsp;<asp:TextBox ID="txbUsuario" runat="server" Width="197px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txbUsuario" ErrorMessage="O campo usuário é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Nome:"></asp:Label>
        &nbsp;<asp:TextBox ID="txbNome" runat="server" Width="206px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txbNome" ErrorMessage="O campo nome é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Sobrenome:"></asp:Label>
        &nbsp;<asp:TextBox ID="txbSobrenome" runat="server" Width="174px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txbSobrenome" ErrorMessage="O campo sobrenome é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label>
        &nbsp;<asp:TextBox ID="txbEmail" runat="server" Width="210px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="txbEmail" ErrorMessage="O campo email é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label6" runat="server" Text="Senha:"></asp:Label>
        &nbsp;<asp:TextBox ID="txbSenha" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txbConfirmacao" ControlToValidate="txbSenha" 
            ErrorMessage="As senhas não conferem">*</asp:CompareValidator>
        <br />
        <asp:Label ID="Label7" runat="server" Text="Confirmação:"></asp:Label>
        &nbsp;<asp:TextBox ID="txbConfirmacao" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <asp:CheckBox ID="ckbAdmin" runat="server" Text="Administrador" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="btnSalvar" runat="server" onclick="btnSalvar_Click" 
            Text="Salvar" />
        &nbsp;<asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
            onclick="btnCancelar_Click" Text="Cancelar" />
    </asp:Panel>
    <br />
    <asp:HiddenField ID="hfIdCliente" runat="server" />
    <asp:HiddenField ID="hfIdUsuario" runat="server" />
    

    <br />
</asp:Content>
