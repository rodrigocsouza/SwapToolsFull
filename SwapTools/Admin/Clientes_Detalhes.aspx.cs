using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;

namespace SwapMobileWWW.Admin
{
    public partial class Clientes_Detalhes : System.Web.UI.Page
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
                    PreencheDetalhes(idCliente);
                }
                else
                {
                    //Entenda como novo cadastro
                    lblMsg.Text = "Novo cadastro em andamento...";
                }

            }
        }

        private void PreencheDetalhes(int idCliente)
        {
            Cliente cliente = new Cliente();
            cliente.LoadByPrimaryKey(idCliente);
            if (cliente.RowCount == 1)
            {
                txbRazaoSocial.Text = cliente.RazaoSocial;
                txbNomeFantasia.Text = cliente.NomeFantasia;
                txbCNPJ.Text = cliente.CNPJ;
                txbEndereco.Text = cliente.Endereco;
                txbBairro.Text = cliente.Bairro;
                txbCidade.Text = cliente.Cidade;
                txbUF.Text = cliente.UF;
                txbCEP.Text = cliente.CEP;
                txbNome.Text = cliente.NomeContato;
                txbTelefone.Text = cliente.TelContato;
                txbEmail.Text = cliente.EmailContato;
                ckbAdmin.Checked = cliente.Admin;
            }
            else
            {
                Response.Redirect("~/Admin/Clientes.aspx");
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Clientes.aspx");
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (hfIdCliente.Value != string.Empty)
            {
                try
                {
                    int idCliente = Convert.ToInt32(hfIdCliente.Value);
                    Cliente cliente = new Cliente();
                    cliente.LoadByPrimaryKey(idCliente);
                    cliente.RazaoSocial = txbRazaoSocial.Text;
                    cliente.NomeFantasia = txbNomeFantasia.Text;
                    cliente.CNPJ = txbCNPJ.Text;
                    cliente.Endereco = txbEndereco.Text;
                    cliente.Bairro = txbBairro.Text;
                    cliente.Cidade = txbCidade.Text;
                    cliente.UF = txbUF.Text;
                    cliente.CEP = txbCEP.Text;
                    cliente.NomeContato = txbNome.Text;
                    cliente.TelContato = txbTelefone.Text;
                    cliente.EmailContato = txbEmail.Text;
                    cliente.Admin = ckbAdmin.Checked;
                    cliente.Save();
                    lblMsg.Text = "Dados salvos com sucesso!";
                }
                catch (Exception exx)
                {
                    lblMsg.Text = "Occoreu o seguinte erro ao salvar o cadastro: <br> " + exx.Message;
                }
            }
            else { 
            //Novo Cadastro
                Cliente cliente = new Cliente();
                cliente.AddNew();
                cliente.RazaoSocial = txbRazaoSocial.Text;
                cliente.NomeFantasia = txbNomeFantasia.Text;
                cliente.CNPJ = txbCNPJ.Text;
                cliente.Endereco = txbEndereco.Text;
                cliente.Bairro = txbBairro.Text;
                cliente.Cidade = txbCidade.Text;
                cliente.UF = txbUF.Text;
                cliente.CEP = txbCEP.Text;
                cliente.NomeContato = txbNome.Text;
                cliente.TelContato = txbTelefone.Text;
                cliente.EmailContato = txbEmail.Text;
                cliente.Admin = ckbAdmin.Checked;
                cliente.Save();
                hfIdCliente.Value = cliente.IdCliente.ToString();
                lblMsg.Text = "Dados salvos com sucesso!";
                
            }
        }
    }
}