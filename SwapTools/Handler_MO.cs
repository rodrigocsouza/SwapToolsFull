using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace SwapMobileWWW
{
    public class Handler_MO : IHttpHandler
    {
        public bool IsReusable
        {
            get { return false; }
        }

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                MOHuman mo = new MOHuman();
                mo.Id = context.Request.QueryString["id"];
                mo.From = context.Request.QueryString["from"];
                mo.To = context.Request.QueryString["to"];
                mo.Msg = context.Request.QueryString["msg"];
                mo.Account = context.Request.QueryString["account"];
                mo.Date_ = context.Request.QueryString["date"];
                SalvaResultado(mo);
                context.Response.Write("Ok");
            }
            catch (Exception exx)
            {
                context.Response.Write("Erro - " + exx.Message);
            }

        }

        private void SalvaResultado(MOHuman mo)
        {
            try
            {
                //Pass the filepath and filename to the StreamWriter Constructor
                StreamWriter sw = new StreamWriter("C:\\inetpub\\wwwroot\\swaptools\\MOHuman.txt", true);

                //Write a line of text
                sw.WriteLine(string.Format("{0};{1};{2};{3};{4};{5}", mo.Id, mo.From, mo.To, mo.Msg, mo.Account, mo.Date_));

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

        private void SalvaLog(string mensagem)
        {

        }
    }
}