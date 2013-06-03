<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="SwapMobileWWW.Admin.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Cadastro de Clientes</h3><br />
    <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idCliente" onrowcommand="gvClientes_RowCommand">
        <Columns>
            <asp:HyperLinkField DataTextField="NomeFantasia" HeaderText="Nome Fantasia">
            <ItemStyle Width="200px" />
            </asp:HyperLinkField>
            <asp:BoundField DataField="RazaoSocial" HeaderText="Razão Social">
            <ItemStyle Width="200px" />
            </asp:BoundField>
            <asp:BoundField DataField="CNPJ" HeaderText="CPNJ" />
            <asp:CheckBoxField DataField="Admin" HeaderText="Administração">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:CheckBoxField>
            <asp:TemplateField HeaderText="Detalhes" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("idCliente") %>' CommandName="Detalhes" Height="46px" 
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
            <asp:TemplateField HeaderText="Usuários" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("idCliente") %>' CommandName="Usuarios" Height="46px" 
                        ImageUrl="~/Images/Icons/photo.png" Text="" Width="46px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Modelos" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("idCliente") %>' CommandName="Modelos" 
                        ImageUrl="~/Images/Icons/email_open.png" Text="" Width="46px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    

    <asp:ImageButton ID="imgNovo" runat="server" AlternateText="Adicionar Cliente" 
        Height="58px" ImageUrl="~/Images/Icons/blog_add.png" onclick="imgNovo_Click" 
        ToolTip="Adicionar Cliente" Width="57px" />
    <br />
    

</asp:Content>
