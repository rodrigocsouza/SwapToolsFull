using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;

namespace SwapMobileWWW.Admin
{
    public partial class ModelosClientes : System.Web.UI.Page
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
                    CarregarModelosCliente(idCliente);
                    CarregarModelosDisponiveis();
                    CarregarDadosCliente(idCliente);
                }
                else
                {
                    //Retornar para a página de clientes
                    Response.Redirect("~/Admin/Clientes.aspx");
                }
            }
        }

        private void CarregarDadosCliente(int idCliente)
        {
            Cliente cliente = new Cliente();
            cliente.LoadByPrimaryKey(idCliente);
            lblCliente.Text = " - " + cliente.NomeFantasia;
        }

        private void CarregarModelosDisponiveis()
        {
            Modelo modelo = new Modelo();
            modelo.LoadAll();
            ddlModelos.DataSource = modelo.DefaultView;
            ddlModelos.DataTextField = "NomeModelo";
            ddlModelos.DataValueField = "IdModelo";
            ddlModelos.DataBind();
        }

        private void CarregarModelosCliente(int idCliente)
        {
            ClienteModelo CliMod = new ClienteModelo();
            CliMod.Where.IdCliente.Value = idCliente;
            CliMod.Where.IdCliente.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            CliMod.Query.Load();
            string listModelos = string.Empty;
            Modelo modelo = new Modelo();
            if (CliMod.RowCount > 0)
            {
                listModelos = CliMod.IdModelo.ToString() + ",";
                while (CliMod.MoveNext())
                {
                    listModelos += CliMod.IdModelo.ToString() + ",";
                }
                listModelos = listModelos.Remove(listModelos.LastIndexOf(","));
                modelo.Where.IdModelo.Value = listModelos;
                modelo.Where.IdModelo.Operator = MyGeneration.dOOdads.WhereParameter.Operand.In;
                modelo.Query.Load();
            }

            gvModelos.DataSource = modelo.DefaultView;
            gvModelos.DataBind();
        }

        protected void gvModelos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void btnAssociar_Click(object sender, EventArgs e)
        {
            int idModelo = Convert.ToInt32(ddlModelos.SelectedValue);
            int idCliente = Convert.ToInt32(hfIdCliente.Value);
            ClienteModelo cm = new ClienteModelo();
            cm.Where.IdCliente.Value = idCliente;
            cm.Where.IdCliente.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            cm.Where.IdModelo.Value = idModelo;
            cm.Where.IdModelo.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            cm.Query.Load();
            if (cm.RowCount > 0)
            {
                //Este modelo já existe
                lblMsg.Text = "Este modelo já está associado ao cliente";
            }
            else
            {
                //O modelo não existe
                ClienteModelo cmN = new ClienteModelo();
                cmN.AddNew();
                cmN.IdCliente = idCliente;
                cmN.IdModelo = idModelo;
                try
                {
                    cmN.Save();
                    lblMsg.Text = "Associação efetuada";
                    CarregarModelosCliente(idCliente);
                }
                catch (Exception exx)
                {
                    lblMsg.Text = "Ocorreu um erro: " + exx.Message;
                }
            }
        }

    }


}