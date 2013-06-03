using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;

namespace SwapMobileWWW.Admin
{
    public partial class Modelos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CarregarModelos();

            }
        }

        private void CarregarModelos()
        {
            Modelo modelos = new Modelo();
            modelos.LoadAll();
            gvModelos.DataSource = modelos.DefaultView;
            gvModelos.DataBind();
        }

        protected void gvModelos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detalhes")
            {
                hfIdModelo.Value = e.CommandArgument.ToString();
                LimpaCampos();
                lblMsg.Text = "Editando modelo...";
                pnlDadosModelo.Visible = true;
                CarregaModelo(Convert.ToInt32(e.CommandArgument));
            }
        }

        private void CarregaModelo(int p)
        {
            Modelo modelo = new Modelo();
            modelo.LoadByPrimaryKey(p);
            txbNomeModelo.Text = modelo.NomeModelo;
            txbDescricao.Text = modelo.Descricao;
            txbCorpo.Text = modelo.CorpoModelo;

        }

        protected void imgNovo_Click(object sender, ImageClickEventArgs e)
        {
            pnlDadosModelo.Visible = true;
            hfIdModelo.Value = string.Empty;
            LimpaCampos();
            lblMsg.Text = "Criando novo modelo...";
        }

        private void LimpaCampos()
        {
            txbNomeModelo.Text = string.Empty;
            txbDescricao.Text = string.Empty;
            txbCorpo.Text = string.Empty;
            lblMsg.Text = string.Empty;

        }

        protected void txbNome_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Modelo modelo = new Modelo();
            if (hfIdModelo.Value == string.Empty)
            {
                //Criação de novo modelo
                modelo.AddNew();
            }
            else
            {
                //Atualização de dados
                int idModelo = Convert.ToInt32(hfIdModelo.Value);
                modelo.LoadByPrimaryKey(idModelo);
            }
            try
            {
                modelo.NomeModelo = txbNomeModelo.Text;
                modelo.Descricao = txbDescricao.Text;
                modelo.CorpoModelo = txbCorpo.Text;
                modelo.Save();
                LimpaCampos();
                hfIdModelo.Value = string.Empty;
                CarregarModelos();
                pnlDadosModelo.Visible = false;
            }
            catch (Exception exx)
            {
                lblMsg.Text = "Ocorreu o seguinte erro: " + exx.Message;
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpaCampos();
            hfIdModelo.Value = string.Empty;
            pnlDadosModelo.Visible = false;
        }


    }
}