<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ABCapplication.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="library/jquery.min.js"></script>
    <%--<script src="library/jquery-1.7.2.js"></script>--%>
    <script type="text/javascript">
         $(document).ready(function () {
            debugger;
            BindDataTabl();            
        });

        function BindDataTabl() {
         
             $.ajax({
        url: "WebForm2.aspx/GetList ",
        type: 'post',
        contentType: 'application/json; charset=UTF-8',
        dataType: 'json',
        success: function (data) {

            if (data.d != null) {
     
                var json = data.d;
                $('#tbldiv').empty();

                LoadTabl(json);
              }
            else {
                //window.location = "Home.aspx";
            }

        }
    });

}


        function LoadTabl(json) {
            debugger;
            if (json) {
                var mytabl = '';
                for (i = 0; i < json.length; i++) {
                    if (i == 0) {
                        mytabl += ("<table id='tab' class='table table-striped table-bordered dt-responsive nowrap'>");
                        mytabl += ("<thead>");
                        mytabl += ("<tr>");
                        mytabl += ("<th>ID</th>");
                        mytabl += ("<th>Name</th>");
                        mytabl += ("<th>DnsHostName</th>");
                        mytabl += ("<th>Fqdn</th>");
                        mytabl += ("</tr>");
                        mytabl += ("</thead>");
                        mytabl += ("<tbody>");
                    }

                    mytabl += ("<tr>");
                    if (i = 0) {
                        mytabl += ("<td>" + json[i]['id'] + "</td>");
                        mytabl += ("<td>" + json[i]['Name'] + "</td>");
                        mytabl += ("<td>" + json[i]['DnsHostName'] + "</td>");
                        mytabl += ("<td>" + json[i]['Fqdn'] +"</td>");
                           
                    }
                    mytabl += ("</tr>");
                    mytabl += ("</table>");
                }
                $('#tbldiv').html(mytabl);
            }
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="clearfix">
            <div class="row">
                
            </div>
        </div>

        <div class="tbl">
        <div class="x_content">
            
            <div id="tbldiv">

            </div>
           <%-- <table id="tbldiv" class="table table-striped table-bordered">
                <thead id="tblhead" style="display:block">
                    <th>id</th>
                    <th>Name</th>
                    <th>DnsHostName</th>
                    <th>Fqdn</th>
                </thead>
                <tbody>

                </tbody>
            </table>--%>
        </div>
            </div>

    </form>
</body>
</html>
