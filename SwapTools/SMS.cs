using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SwapMobileWWW
{
    public class SMS
    {
        private string msisdn;

        public string Msisdn
        {
            get { return msisdn; }
            set { msisdn = value; }
        }

        //private string nome;

        //public string Nome
        //{
        //    get { return nome; }
        //    set { nome = value; }
        //}

        //private string sobrenome;

        //public string Sobrenome
        //{
        //    get { return sobrenome; }
        //    set { sobrenome = value; }
        //}

        private string mensagem;

        public string Mensagem
        {
            get { return mensagem; }
            set { mensagem = value; }
        }


    }
}