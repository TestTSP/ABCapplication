<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login_Page.aspx.cs" Inherits="ABCapplication.login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        $(document).ready(funtion() {
            ReadData();
            CheckData();
        });

        function ReadData() {
            $.ajax({
                url: 'login_Page.aspx/GetData',
                type: 'POST',
                contentType: 'application/JSON; charset=UTF-8',
                datatype: 'JSON',
                success: function (data) {
                    alert('User Data Received');
                }
                
            });
            }

        function CheckData() {
            var mail = $('#emailtxt').val();
            var PassCode = $('#passwordTxt').val();
            $.ajax({
                url: 'login_Page.aspx/CheckLogin',
                type: 'post',
                //data: '',
                contentType: 'application/json; charset=UTF-8',
                datatype: 'json',
                success: function (data) {
                    if()
                }
            });
        

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="formBody">
            <span style="font-size:20px; color:brown;">
            Email: <span id="inpttype"><input type="text" id="emailtxt"/></span>
            <br />
            Password: <span id="inpt2"><input type="text" id="passwordTxt"/></span>
                </span>
            <br />
            <input type="button" id="submit" value="SUBMIT" />
            <a href=""><input type="button" id="btn1" value="Create New User" /></a>
        </div>
    </form>
</body>
</html>
