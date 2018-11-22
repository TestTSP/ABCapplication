using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ABCapplication.DTO;
using System.Data.Entity;

namespace ABCapplication.BAL
{
    public class LSbal
    {
        public List<LS> GetList()
        {
            try
            {
                using (testdemoEntities db = new testdemoEntities())
                {
                    List<LS> lst = (from item in db.tblDevices
                                    where item.Virtual == true
                                    select new LS
                                    {
                                        Id = item.Id,
                                        Name=item.Name,
                                        DnsHostName=item.DnsHostName,
                                        Fqdn=item.Fqdn,
                                      
                    
                                    }).ToList();
                    return lst;
                }
            }
            catch(Exception ex)
            {
                throw ex;

            }
        }
    }
}