<%@ Page Title="" Language="C#" MasterPageFile="~/Control.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="CloudOrigin.ControlPanel.O365CustomBaseline" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        select[multiple], select[size] {
            height: 34px;
            width: 560px;
        }

        .btn-group > .btn:first-child {
            overflow: hidden;
            text-align: left;
        }

        ul.multiselect-container {
            width: 560px;
            overflow-y: scroll;
            height: 200px;
            margin-top: 6px
        }

        th {
            background-color: darkcyan;
        }

        table {
            /*table-layout: fixed;*/
        }
    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js">
</script>
    <script type="text/javascript">
        var UserID = 0;
      
        $(document).ready(function () {
            debugger;
            BindTable();            
        });

        function BindTable() {
            debugger;
            $.ajax({
                type: "POST",
                url: "O365CustomBaseline.aspx/O365List",

                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    debugger;
                    var table = '';
                    $('#TblCompliance').empty();
                    $('#TblCompliance').html('');
                    $('#TblCompliance').append("<thead><th>Id</th><th>TenantId</th> <th>Name</th> <th>CreateDate</th> <th>LastModifyDate</th><th>LastModifiedBy</th><th>Status</th><th>Action</th></thead > ");
                    for (var i = 0; i < response.d.length; i++) {
                        $("#TblCompliance").append("<tr ><td>" + response.d[i].Id + "</td> <td>" + response.d[i].TenantId + "</td><td>" + response.d[i].Name + "</td><td>" + response.d[i].CreateDate + "</td> <td>" + response.d[i].LastModifyDate + "</td> <td>" + response.d[i].LastModifiedBy + "</td> <td>" + response.d[i].Status + "</td><td><input type='button'  id='" + response.d[i].Id + "," + response.d[i].Name + "' value='Edit' class='btn btn-xs btn-primary' onclick='fnEdit(this)' /><input type='button' data-toggle='modal' data-target='#modalDelete' id='" + response.d[i].Id + "' value='Delete' class='btn btn-xs btn-primary' onclick='fnDelete(this)'/></td></tr> ");

                    }
                    //table += ("</table>");

                }

            });
        }

        function ModalPopup() {
            debugger;

            $('#modalTemplate').modal('show');
        }

        function ClearPopupItem() {
            $('#ContentPlaceHolder1_txtName').val("");

        }

        function fnopenModal() {
            debugger;
            $("#<%=lblPopHeader.ClientID%>").text("Enter the Details");
            $('#modalTemplate').modal('show');
            $('#validateText').hide();
            $('#ContentPlaceHolder1_txtName').clearQueue();
        }

        function SaveData() {
            debugger;
            var name = $('#ContentPlaceHolder1_txtName').val().trim();
            if (name == '' || name == 0) {
                //#ContentPlaceHolder1_validateText
                $('#validateText').show();
                return false;
            }
            else {
                //Insert Function
                debugger;
                if (UserID == '' || UserID == 0) {
                    $.ajax({
                        url: "O365CustomBaseline.aspx/Insert",
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        data: JSON.stringify({ Name: $('#ContentPlaceHolder1_txtName').val(), id: UserID }),
                        success: function (data) {
                            debugger;
                            $('#ContentPlaceHolder1_txtName').val('');
                            if (data.d == 'Yes') {
                                Notification('Done Successfully', ' Successfully', 'success');
                                $("[id$=modalTemplate]").modal('hide');
                                BindTable();
                            }
                            else {

                                Notification('Warning', 'Already in database.', 'error');
                                Clear();

                                $("[#modalTemplate]").modal('hide');

                            }
                        }
                    });
                }

                
                //edit function
                else {
                    $.ajax({
                        url: "O365CustomBaseline.aspx/updateFn",
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json;charset=utf-8",
                        data: JSON.stringify({ Name: $('#ContentPlaceHolder1_txtName').val(), id: UserID }),
                        success: function (update) {
                            debugger;
                            // var value = $('#ContentPlaceHolder1_txtName').val(Data[1].e);
                            var name = $('#ContentPlaceHolder1_txtName').val().trim();
                            $('#ContentPlaceHolder1_txtName').val(name);
                            $('#ContentPlaceHolder1_txtName').add(name);

                            if (update.d == "Yes") {
                                Notification('Edit Value','Update successful','success');
                                $("[id$=modalTemplate]").modal('hide');
                                BindTable();
                            }
                            else {
                                Notification('Warning','Denied','error');

                            }
                        },
                    })

                   
                }
            }
        }

        function fnEdit(ctrl) {
            debugger;

            var Data = ctrl.id;
            Data = Data.split(","); 
            UserID = Data[0];
            $('#ContentPlaceHolder1_txtName').val(Data[1]);
            $('#modalTemplate').modal('show');

        }
        
        function fnDelete(del) {
            debugger;
            $('#headerText').text('delete ?');
            var delTxt = del.id;
            
            UserID = delTxt;
            $('modalDelete').modal('show');
            //UserID = Id;
        }
        
        function btndelete() {
            //debugger;
            //var row = delTxt;
            //if ( UserID == '') {
            //    $('#validateText').show();
            //    return false;
            //}
            //else{
            debugger;
            $.ajax({
                
                url: "O365CustomBaseline.aspx/fnDelete",
                type: "POST",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                //data: JSON.stringify({ id: UserID ,Name: $('#ContentPlaceHolder1_txtName').val()}),
                data: JSON.stringify({ id: UserID }),
                //success: function (data) {
                success: function () {
                    debugger;
                    $(UserID).remove();
                    //if (data.d == "Yes") {
                        Notification('Delete', 'Deleted successfully.', 'success');
                       $("[id$=modalDelete]").modal('hide');
                        BindTable();
                    //}
                    //else {
                    //    Notification('Denied');
                   // }
                }
            });
            }
      //  }



    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3>O365 Custom Baseline</h3>

                        </div>
                    </div>

                    <div class="clearfix"></div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title">
                                    <button type="button" id="btnpopup" class="btn btn-xs btn-primary" data-toggle="tooltip" data-placement="right" title="Click here to Add Custom Baseline" onclick="fnopenModal()"><i class="fa fa-plus-square"></i>Add Baseline</button>


                                    <ul class="nav navbar-right panel_toolbox">
                                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                                        <li><a class="close-link"><i class="fa fa-close"></i></a></li>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <p class="text-muted font-13 m-b-30"></p>

                                    <table id="TblCompliance" class="table table-striped table-bordered">
                                        <thead id="tbl" style="display: block">
                                            <tr>
                                                <th> Id</th>
                                                <th>TenantID</th>
                                                <th>Name</th>
                                                <th>Created Date </th>
                                                <th>Last Modified  </th>
                                                <th>LastModified By</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-hidden="true" id="modalTemplate" data-backdrop="static" data-keyboard="false">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog modal-lg vertical-align-center">
                        <div class="modal-content">

                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <h4 class="modal-title" id="myModalLabel2">
                                    <asp:Label ID="lblPopHeader" runat="server"></asp:Label>
                                </h4>
                            </div>
                            <div class="modal-body">

                                <div class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <label class="control-label col-md-2 col-sm-2 col-xs-12">Name <span class="required">*</span></label>
                                        <div class="col-md-10 col-sm-10 col-xs-12">
                                            <asp:TextBox ID="txtName" runat="server" class="form-control" onkeypress="return blockSpecialChar(event)"></asp:TextBox>
                                            <label id="validateText" class="label label-danger">Required</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <%--<asp:LinkButton ID="btnSubmit" runat="server" CssClass="btn btn-xs btn-success" CausesValidation="true" ValidationGroup="popVal" OnClientClick="return SaveData();"  ><i class="fa fa-pencil-square" aria-hidden="true"></i>Submit</asp:LinkButton>--%>
                                <button type="button" id="btnSubmit" runat="server" class="btn btn-xs btn-success" causesvalidation="true" validationgroup="popVal" onclick="SaveData();"><i class="fa fa fa-check-circle-o" aria-hidden="true"></i>Submit</button>
                                <button type="button" class="btn btn-xs btn-danger" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i>Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            
            <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true" id="modalDelete" data-backdrop="static" data-keyboard="false">
                <div class="vertical-alignment-helper">
                    <div class="modal-dialog modal-sm vertical-align-center">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <h4 class="modal-title" id="headertxt">DELETE!!</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal form-label-left">
                                    <div class="form-group">
                                        <div align="center">
                                            <%-- <input type='button'  id='" + response.d[i].Id + "' value='Yes' class='btn btn-xs btn-primary' onclick='btndelete(this);' />--%>
                                            <button type="button" id="lbtndelete" class="btn btn-xs btn-success" onclick='btndelete();' runat="server"><i class="fa fa-check-circle-o" aria-hidden="true"></i>yes</button>
                                           <button type="button" id="lbtnDeleteno" class="btn btn-xs btn-danger" data-dismiss="modal"><i class="fa fa-ban" aria-hidden="true"></i>No</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--  <asp:HiddenField ID="hfEditTemplateId" runat="server" />
            <asp:HiddenField ID="hfServiceId" runat="server" />
            <asp:HiddenField ID="hfServiceName" runat="server" />--%>
            <asp:HiddenField ID="Action" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>


</asp:Content>
