<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ABCapplication.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script  src="https://code.jquery.com/jquery-3.3.1.js"  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script src="jquery-1.12.4.js"></script>
    <script type="text/javascript">
       //$(window).load(function () {
       //     $('#div1').html("Height = " + $('#img1').height()
       //         + "<br/>" + "width = " + $('#img1').width())
       // });

        $(document).ready(function () {
            //$('#btn1').css('background-color', 'yellow');
            // $('#btn1').click(function () {
            //if($('#btn1').length > 0)
            //{
            //    alert('hello');
            //}
            //    else {
            //    alert('element not found');
            //}

            //alert($('td').length);
            //$('thead').css('background-color', 'red');
            //alert($('table').html());
            //$('table tr').each(function () {
            //    alert($(this).html());
            //});
            //$('thead').css('background-color', 'red');
            //$('div a').css('background-color', 'red');
            $('.small,.big').css('border', '5px solid red');
            //$('div, span, a').css('background-color', 'yellow');
            $('tr:even').css('background-color', 'yellow');
            $('tr:odd').css('background-color', 'gray');




        });

        //});
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%--<div id="div1">
            <input type="button" id="btn1" value="click here" />
           
        </div>--%>
         <%--<img src="CloudITEnvironment.jpg" id="img1" />--%>
        <table id="tbl1" style="border:1px solid black;border-collapse:collapse">
            <thead>
                <tr>
                    <td>S.No.</td>
                    <td>Name</td>
                    <td>Company</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>abc</td>
                    <td>123</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>def</td>
                    <td>234</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>xyz</td>
                    <td>345</td>
                </tr>
            </tbody>
        </table>
        
        <div id="div12">
            <table id="tbl2">
                <thead>
                    <tr>
                        <td>12</td>
                        <td>23</td>
                        <td>34</td>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="small">
            DIV 1
            <br />
            <a href="www.kchbhi.com">Hello World</a>
        </div>
        <br /><br />
        <a href="www.facebook.com">Facebook</a>
        <br /><br />
        <div class="big">DIV2</div>
        <br /><br />
        <span>SPAN1</span>
    </form>
</body>
</html>
