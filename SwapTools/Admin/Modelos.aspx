<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Modelos.aspx.cs" Inherits="SwapMobileWWW.Admin.Modelos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Modelos de Mensagens</h3>
    <asp:GridView ID="gvModelos" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="idModelo" onrowcommand="gvModelos_RowCommand" 
        
    EmptyDataText="Ainda não existem modelos cadastrados para este cliente">
        <Columns>
            <asp:HyperLinkField DataTextField="NomeModelo" HeaderText="Modelo" >
            <ItemStyle Width="250px" />
            </asp:HyperLinkField>
            <asp:TemplateField HeaderText="Detalhes" ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                        CommandArgument='<%# Eval("idModelo") %>' CommandName="Detalhes" Height="46px" 
                        ImageUrl="~/Images/Icons/blog_compose.png" Text="" Width="46px" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
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
    

    <asp:ImageButton ID="imgNovo" runat="server" AlternateText="Adicionar Modelo" 
        CausesValidation="False" Height="58px" ImageUrl="~/Images/Icons/blog_add.png" 
        onclick="imgNovo_Click" ToolTip="Adicionar Modelo" Width="57px" />
    <br />
    <asp:Panel ID="pnlDadosModelo" runat="server" Visible="False">
        <asp:Label ID="Label1" runat="server" 
    Text="- Dados do Modelo"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Nome do modelo: "></asp:Label>
        &nbsp;<asp:TextBox ID="txbNomeModelo" runat="server" Width="284px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txbNomeModelo" 
            ErrorMessage="O campo nome do modelo é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Descrição:"></asp:Label>
        &nbsp;<br /> <asp:TextBox ID="txbDescricao" runat="server" Width="400px" 
            Height="50px" ontextchanged="txbNome_TextChanged" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txbDescricao" 
            ErrorMessage="O campo descrição é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label4" runat="server" 
            Text="Corpo do Modelo (O SMS pode conter 150 caracteres no máximo):"></asp:Label>
        <br />
        <asp:TextBox ID="txbCorpo" runat="server" Width="400px" Height="100px" 
            MaxLength="150" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txbCorpo" 
            ErrorMessage="O campo corpo do modelo é obrigatório">*</asp:RequiredFieldValidator>
        <br />
        O corpo do modelo deverá ser composto de tags enumeradas a par-<br /> tir&nbsp; do&nbsp; 
        número&nbsp; 1&nbsp; (ex.: [1], [2], etc.).&nbsp;&nbsp; Estas tags serão substituídas de<br /> 
        acordo com a ordem no arquivo que será enviado. O primeiro campo<br />do arquivo 
        deve conter o telefone e logo após, os outros campos se-<br />parados por 
        ponto-e-vírgula ( ; ).<br /> - Exemplo de arquivo:<br /> &nbsp; 551178901234;<strong>Maria</strong>;<strong>25/12/2012</strong>;<strong>20:00</strong>;<strong>Dentista</strong><br /> 
        - Exemplo do corpo do modelo:<br /> &nbsp; Olá&nbsp;<strong>[1]</strong>, não esqueça que no dia<strong> 
        [2]</strong> às <strong>[3]</strong> você tem <strong>[4]</strong>.<br /> - E o 
        resultado da mesclagem seria:<br />&nbsp; Olá&nbsp;<strong>Maria</strong>, não esqueça que 
        no dia <strong>25/12/2012</strong> as <strong>20:00</strong> você tem <strong>
        Dentista</strong>.
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" /><br />
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        <br />
        <asp:Button ID="btnSalvar" runat="server" onclick="btnSalvar_Click" 
            Text="Salvar" />
        &nbsp;<asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
            onclick="btnCancelar_Click" Text="Cancelar" />
    </asp:Panel>
    <asp:HiddenField ID="hfIdModelo" runat="server" />
<br />
</asp:Content>
