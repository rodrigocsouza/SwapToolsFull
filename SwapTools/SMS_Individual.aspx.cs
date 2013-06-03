using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SwapMobile;
using System.IO;
using HumanAPIClient.Service;
using HumanAPIClient.Model;
using System.Text;
using System.Globalization;

namespace SwapMobileWWW
{
    public partial class SMS_Individual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txbMensagem.Attributes.Add("onkeypress", "return tbLimit();");
            txbMensagem.Attributes.Add("onkeyup", "return tbCount(" + lblContador.ClientID + ");");
            txbMensagem.Attributes.Add("maxLength", "150");

            if (!IsPostBack)
            {
                if (Session["Usuario"] == null)
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
                else
                {
                    Usuario usuario = (Usuario)Session["Usuario"];
                    Cliente cliente = (Cliente)Session["Empresa"];
                    lblUsuario.Text = string.Format("{0} {1}", usuario.Nome, usuario.Sobrenome);
                    lblEmpresa.Text = string.Format("{0} - {1}", cliente.RazaoSocial, cliente.CNPJ);
                }
            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            String account = "swap";

            String code = "zJmLTF7JvU";

            int contador = 0;
            try
            {
                contador = ObterUltimoID() + 1;

                SimpleSending sms = new SimpleSending(account, code);

                SimpleMessage message = new SimpleMessage();

                message.To = string.Format("55{0}{1}", txbDDD.Text, txbTelefone.Text);
                message.Message = RemoverAcentos(txbMensagem.Text);
                contador++;
                message.Id = contador.ToString("0000");
                List<String> response = sms.send(message);

                lblMsg.Text = "SMS enviado com sucesso!";
                SalvarUltimoID(contador);
                btnEnviar.Enabled = false;
            }
            catch (Exception exx)
            {
                lblMsg.Text = "Ocorreu um erro no envio: " + exx.Message;
            }
        }

        private int ObterUltimoID()
        {
            String line;
            int idHuman = 0;
            try
            {
                //Pass the file path and file name to the StreamReader constructor
                StreamReader sr = new StreamReader("C:\\inetpub\\wwwroot\\swaptools\\idHuman.txt");

                //Read the first line of text
                line = sr.ReadLine();
                idHuman = Convert.ToInt32(line);

                //Continue to read until you reach end of file
                //while (line != null)
                //{
                //write the lie to console window
                //Console.WriteLine(line);
                //Read the next line
                //line = sr.ReadLine();
                //}

                //close the file
                sr.Close();
                //Console.ReadLine();
            }
            catch (Exception e)
            {
                //Console.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                //Console.WriteLine("Executing finally block.");
            }
            return idHuman;


        }

        private void SalvarUltimoID(int p)
        {
            try
            {
                File.Delete("C:\\inetpub\\wwwroot\\swaptools\\idHuman.txt");
                //Pass the filepath and filename to the StreamWriter Constructor
                StreamWriter sw = new StreamWriter("C:\\inetpub\\wwwroot\\swaptools\\idHuman.txt");

                //Write a line of text
                sw.WriteLine(p.ToString());

                //Write a second line of text
                //sw.WriteLine("From the StreamWriter class");

                //Close the file
                sw.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("Exception: " + e.Message);
            }
            finally
            {
                Console.WriteLine("Executing finally block.");
            }

        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            LimparCampos();
            lblMsg.Text = string.Empty;
            btnEnviar.Enabled = true;
        }

        private void LimparCampos()
        {
            txbDDD.Text = "";
            txbTelefone.Text = "";
            txbMensagem.Text = string.Empty;
            lblContador.Text = "150";
        }

        private string RemoverAcentos(string texto)
        {
            string s = texto.Normalize(NormalizationForm.FormD);

            StringBuilder sb = new StringBuilder();

            for (int k = 0; k < s.Length; k++)
            {
                UnicodeCategory uc = CharUnicodeInfo.GetUnicodeCategory(s[k]);
                if (uc != UnicodeCategory.NonSpacingMark)
                {
                    sb.Append(s[k]);
                }
            }
            return sb.ToString();
        }
    }
}