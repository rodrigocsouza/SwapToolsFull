<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModelosClientes.aspx.cs" Inherits="SwapMobileWWW.Admin.ModelosClientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<h3>Modelos do Cliente  
    <asp:Label ID="lblCliente" runat="server"></asp:Label></h3>
    <br />
    <asp:GridView ID="gvModelos" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idModelo" onrowcommand="gvModelos_RowCommand" 
        
    EmptyDataText="Ainda não existem modelos cadastrados para este cliente">
        <Columns>
            <asp:HyperLinkField DataTextField="NomeModelo" HeaderText="Modelo" >
            <ItemStyle Width="250px" />
            </asp:HyperLinkField>
            <asp:TemplateField HeaderText="Excluir" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                        CommandName="Excluir" Height="46px" 
                        ImageUrl="~/Images/Icons/blog_delete.png" Text="" 
                        Width="46px" CommandArgument='<%# Eval("idModelo") %>' />
                </ItemTemplate>
                <ItemStyle Height="18px" HorizontalAlign="Center" VerticalAlign="Middle" 
                    Width="18px" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    

    - Lista de Modelos Disponíveis:<br />
    <asp:DropDownList ID="ddlModelos" runat="server" Height="26px" Width="260px" 
        AppendDataBoundItems="True">
        <asp:ListItem>Selecione...</asp:ListItem>
    </asp:DropDownList>
    &nbsp;<asp:Button ID="btnAssociar" runat="server" onclick="btnAssociar_Click" 
        Text="Associar Modelo ao Cliente" />
    <br />
    <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    

    <asp:HiddenField ID="hfIdCliente" runat="server" />
    
</asp:Content>
