using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;
using System.Web.Security;

namespace SwapMobileWWW.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            //<asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Registrar</asp:HyperLink> se você ainda não tem uma conta.
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            string userName = LoginUser.UserName;
            string password = LoginUser.Password;

            Session["Usuario"] = null;
            Session["Empresa"] = null;

            bool result = UserLogin(userName, password);
            if ((result))
            {
                e.Authenticated = true;
            }
            else
            {
                e.Authenticated = false;
            }
        }

        private bool UserLogin(string userName, string password)
        {
            Usuario usr = new Usuario();
            usr.Where.Usuario.Value = userName;
            usr.Where.Usuario.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            usr.Where.Senha.Value = password;
            usr.Where.Senha.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            usr.Query.Load();
            if (usr.RowCount == 1)
            {
                //LoginUser.UserName = usr.Nome;
                
                //Roles.CreateRole("Admin");
                //Roles.CreateRole("Usuarios");

                //if (usr.Admin)
                //{
                //    Roles.AddUserToRole(usr.Usuario, "Admin");
                //}
                //else {
                //    Roles.AddUserToRole(usr.Usuario, "Usuarios");
                //}

                Session["Usuario"] = usr;
                Cliente cliente = new Cliente();
                cliente.LoadByPrimaryKey(usr.IdCliente);
                Session["Empresa"] = cliente;
                return true;
            }
            else {
                return false;
            }

        }
    }
}
