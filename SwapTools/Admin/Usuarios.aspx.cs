using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;

namespace SwapMobileWWW.Admin
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bool buscaDetalhe = false;
                foreach (var item in Request.QueryString)
                {
                    if (item.ToString() == "idCliente")
                    {
                        buscaDetalhe = true;
                        break;
                    }
                }
                if (buscaDetalhe)
                {
                    int idCliente = Convert.ToInt32(Request.QueryString["idCliente"]);
                    hfIdCliente.Value = idCliente.ToString();
                    CarregarUsuarios(idCliente);
                }
                else
                {
                    //Retornar para a página de clientes
                    Response.Redirect("~/Admin/Clientes.aspx");
                }

            }
        }

        private void CarregarUsuarios(int idCliente)
        {
            Usuario usuarios = new Usuario();
            usuarios.Where.IdCliente.Value = idCliente;
            usuarios.Where.IdCliente.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            usuarios.Query.Load();
            gvUsuarios.DataSource = usuarios.DefaultView;
            gvUsuarios.DataBind();

            Cliente cliente = new Cliente();
            cliente.LoadByPrimaryKey(idCliente);
            lblCliente.Text = " - " + cliente.NomeFantasia;
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Detalhes")
            {
                int idUsuario = Convert.ToInt32(e.CommandArgument);
                pnlDadosUsuarios.Visible = true;
                txbUsuario.Enabled = false;
                hfIdUsuario.Value = idUsuario.ToString();
                CarregaUsuario(idUsuario);

            }
        }

        private void CarregaUsuario(int idUsuario)
        {
            Usuario usuario = new Usuario();
            usuario.LoadByPrimaryKey(idUsuario);
            txbUsuario.Text = usuario.Usuario;
            txbNome.Text = usuario.Nome;
            txbSobrenome.Text = usuario.Sobrenome;
            txbEmail.Text = usuario.Email;
            txbSenha.Text = usuario.Senha;
            txbConfirmacao.Text = usuario.Senha;
            ckbAdmin.Checked = usuario.Admin;
            lblMsg.Text = string.Empty;
        }

        protected void imgNovo_Click(object sender, ImageClickEventArgs e)
        {
            pnlDadosUsuarios.Visible = true;
            LimpaCampos();
            txbUsuario.Enabled = true;
            lblMsg.Text = "Novo cadastro em andamento...";
        }

        private void LimpaCampos()
        {
            txbUsuario.Text = string.Empty;
            txbNome.Text = string.Empty;
            txbSobrenome.Text = string.Empty;
            txbEmail.Text = string.Empty;
            txbSenha.Text = string.Empty;
            txbConfirmacao.Text = string.Empty;
            ckbAdmin.Checked = false;
            lblMsg.Text = string.Empty;
            hfIdUsuario.Value = string.Empty;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpaCampos();
            pnlDadosUsuarios.Visible = false;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            int idCliente = Convert.ToInt32(hfIdCliente.Value);
            if (hfIdUsuario.Value == string.Empty)
            {
                if (!VerificaExistenciaUsuario(txbUsuario.Text))
                {
                    if (txbSenha.Text != string.Empty)
                    {
                        //Prosseguir com a criação do usuário
                        try
                        {
                            Usuario usuario = new Usuario();
                            usuario.AddNew();
                            usuario.IdCliente = idCliente;
                            usuario.Usuario = txbUsuario.Text.ToLower();
                            usuario.Nome = txbNome.Text;
                            usuario.Sobrenome = txbSobrenome.Text;
                            usuario.Email = txbEmail.Text;
                            usuario.Senha = txbSenha.Text;
                            usuario.Admin = ckbAdmin.Checked;
                            usuario.Save();
                            pnlDadosUsuarios.Visible = false;
                            LimpaCampos();
                            CarregarUsuarios(idCliente);
                        }
                        catch (Exception exx)
                        {
                            lblMsg.Text = "Ocorreu o seguinte erro: " + exx.Message;
                        }
                    }
                    else
                    {
                        lblMsg.Text = "Você deve fornecer uma senha!";
                    }
                }
                else
                {
                    lblMsg.Text = "Usuário já existe, escolha outro!";
                }
            }
            else { 
                //Atualização de cadastro
                try
                {
                    int idUsuario = Convert.ToInt32(hfIdUsuario.Value);
                    Usuario usuario = new Usuario();
                    usuario.LoadByPrimaryKey(idUsuario);
                    //usuario.Where.Usuario.Value = .ToLower();
                    //usuario.Where.Usuario.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    //usuario.Query.Load();
                    //usuario.Usuario = txbUsuario.Text.ToLower();
                    usuario.Nome = txbNome.Text;
                    usuario.Sobrenome = txbSobrenome.Text;
                    usuario.Email = txbEmail.Text;
                    if (txbSenha.Text != string.Empty)
                    {
                        usuario.Senha = txbSenha.Text;
                    }
                    usuario.Admin = ckbAdmin.Checked;
                    usuario.Save();
                    pnlDadosUsuarios.Visible = false;
                    LimpaCampos();
                    CarregarUsuarios(idCliente);
                }
                catch (Exception exx)
                {
                    lblMsg.Text = "Ocorreu o seguinte erro: " + exx.Message;
                }
            }
        }

        private bool VerificaExistenciaUsuario(string p)
        {
            Usuario usuario = new Usuario();
            usuario.Where.Usuario.Value = p.ToLower();
            usuario.Where.Usuario.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            usuario.Query.Load();
            if (usuario.RowCount == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}