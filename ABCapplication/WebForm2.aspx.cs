using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.IO;
using ABCapplication.DTO;
using ABCapplication.BAL;


namespace ABCapplication
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                GetList();
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        [WebMethod]
        public static List<LS> GetList()
        {
            try
            { 
            List<LS> newlist = new LSbal().GetList().ToList();
            return newlist;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        
    }

}