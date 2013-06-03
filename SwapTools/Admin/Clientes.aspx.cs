using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;

namespace SwapMobileWWW.Admin
{
    public partial class Clientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Cliente clientes = new Cliente();
                clientes.LoadAll();
                gvClientes.DataSource = clientes.DefaultView;
                gvClientes.DataBind();
            }
        }

        protected void gvClientes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Detalhes")
            {
                Response.Redirect("~/Admin/Clientes_Detalhes.aspx?idCliente=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "Usuarios")
            {
                Response.Redirect("~/Admin/Usuarios.aspx?idCliente=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "Modelos") {
                Response.Redirect("~/Admin/ModelosClientes.aspx?idCliente=" + e.CommandArgument.ToString());
            }
        }

        protected void imgNovo_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Admin/Clientes_Detalhes.aspx");
        }
    }
}