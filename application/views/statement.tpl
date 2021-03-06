<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>statement</title>
    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../resource/bootstrap-table-master/src/bootstrap-table.css">
    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../../resource/bootstrap/css/bootstrap-theme.min.css">

    <script src="../../resource/bootstrap/js/jquery.min.js"></script>
    <script src="../../resource/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../resource/bootstrap-table-master/src/bootstrap-table.js"></script>
    <script src="../../resource/bootstrap-table-master/src/extensions/export/bootstrap-table-export.js"></script>
    <script src="../../resource/tableExport.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="page-header">

                <h1>
                    教务管理系统
                </h1>
            </div>
            <div>
                <table>
                    <thead>

                    </thead>
                    <tbody>
                    <{$value=teacher::getTeacherById()}>
                    <tr>

                        <td><span style="background-color: #1A5CC6;font-size: 28px"> <b> &nbsp 上课时间查询&nbsp</b>  </span></td>

                    </tr>
                    <tr><td>
                            &nbsp <{$value[0]['name']}>老师，您好！
                        </td>
                    </tr>
                    <tr><td>
                            <button id="teaStatement" type="button" class="btn btn-primary" onclick="alltea()">其他老师课表</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
        <table id="tableTea"
               data-toggle="table"
               data-show-export="true"
               data-pagination="true"
               data-click-to-select="true"
               data-toolbar="#toolbar"
               data-search="true"
               data-show-toggle="true">
               <class="table table-condensed table-bordered">
            <thead>
            <tr>
                <th data-field="courseid">
                    课程号
                </th>
                <th data-field="name">
                    课程名字
                </th>
                <th data-field="classhour">
                    上课时间
                </th>
                <th data-field="classname">
                    上课地点
                </th>
            </tr>
            </thead>
            <tbody>
            <{$valueA=teacher::getAllCourseByTeaId()}>
            <{foreach from=$valueA item=tt}>
                <tr>
                    <td><{$tt['courseid']}> </td>
                    <td> <{$tt['name']}></td>
                    <td><{$tt['time']}> </td>
                    <td><{$tt['classname']}> </td>
                </tr>
            <{/foreach}>
            </tbody>
        </table>
    <script>
        function alltea() {
            window.location.href='query';
        }
        function teaStatement(){
            var $table = $('#tableTea');
            $(function () {
                $.ajax({
                    url: "/teacher/stateTea",
                    type:"get",
                    success: successCallback,
                    error: errorCallback
                });
            });
            function successCallback(json){
                json = $.parseJSON(json);
                $table.bootstrapTable('load', json);
            }
            function errorCallback() {
                alert("查询出现错误: ");
            }

        }
        function outBack() {
            window.location.href='Admin';
        }
    </script>
</body>
</html>