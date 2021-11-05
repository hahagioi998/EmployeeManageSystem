<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/10/30
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="content-type" content="text/html" charset="UTF-8">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.6.0.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
    <title>员工列表</title>
</head>
<body>
<%--员工修改模态框--%>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" >员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_input1" value="1" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_update_input2" value="0"> 女
                            </label>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId" id="dept_update_input">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
<!-- 新增员工模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_add_input" placeholder="邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_input1" value="1" checked> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender_add_input2" value="0"> 女
                            </label>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId" id="dept_add_input">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <%--    标题--%>
    <div class="row">
        <div class="col-md-12">
            <h1>员工管理系统</h1>
        </div>
    </div>
    <%--    按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_button">新增</button>
            <button class="btn btn-danger" id="batch_delete_btn">删除</button>
        </div>
    </div>
    <%--    数据--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all_emps">
                    </th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>邮箱</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
               <tbody>

               </tbody>

            </table>
        </div>
    </div>
    <%--    分页信息--%>
    <div class="row">
        <%--        分页文字信息--%>
        <div class="col-md-6" id="pageInfo">
        </div>
        <%--          分页条信息--%>
        <div class="col-md-6" id="pageNav">

        </div>
    </div>
</div>
<script type="text/javascript">
    var totalPage,currentPage;
    $(function () {
        get_page(1);
    });
    // 构建员表的方法
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps=result.extend.pageInfo.list;
        $.each(emps,function (index,item){
            var cheakBoxTd=$("<td><input type='checkbox' class='check_item'/></td>")
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender==='1'?'男':'女');
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            var buttenEdit=$("<button></button>").addClass("btn btn-primary btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-pencil edit_btn").append("编辑").attr("empId",item.empId);
            var buttonDel=$("<button></button>").addClass("btn btn-danger btn-sm")
                .append("<span></span>").addClass("glyphicon glyphicon-trash delete_btn").append("删除").attr("empId",item.empId);
            var btnTd=$("<td></td>").append(buttenEdit).append(" ").append(buttonDel);
            $("<tr></tr>").append(cheakBoxTd).append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    // 发送获取员工数据的Ajax请求
    function get_page(page) {
        $.ajax({
            url:"${pageContext.request.contextPath}/emps",
            data:"page="+page,
            type:"get",
            success:function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
                totalPage=result.extend.pageInfo.pages;
                currentPage=result.extend.pageInfo.pageNum;
            }
        })
    }

    function build_page_info(result) {
        $("#pageInfo").empty();
        $("#pageInfo").append("当前"+result.extend.pageInfo.pageNum+"页"+"" +
            ",总共"+result.extend.pageInfo.pages+"页,总共"+result.extend.pageInfo.total+"条记录");
    }
    function build_page_nav(result) {
        $("#pageNav").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#")).click(function () {
            get_page(1);
        });
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#")).click(
            function (){
                if(result.extend.pageInfo.hasPreviousPage==true){
                    get_page(result.extend.pageInfo.pageNum-1);
                }

            }
        );
        if(result.extend.pageInfo.hasPreviousPage==false){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }
        var sufPageLi=$("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#")).click(
            function (){
                if(result.extend.pageInfo.hasNextPage==true){
                    get_page(result.extend.pageInfo.pageNum+1);
                }

            }
        );
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#")).click(function () {
            get_page(result.extend.pageInfo.pages);
        });
        if(result.extend.pageInfo.hasNextPage==false){
            sufPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item)).click(function () {
                get_page(item);
            });
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            ul.append(numLi);
        });
        ul.append(sufPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#pageNav")
    }
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${pageContext.request.contextPath}/depts",
            type:"get",
            success:function (result){
                $.each(result.extend.depts,function (index,item) {
                    $(ele).append($("<option></option>").append(item.deptName).attr("value",this.deptId));
                })
            }
            }
        )
    }
    $("#emp_add_button").click(function () {
        getDepts("#dept_add_input");
        $("#empAddModal").modal({
            backdrop:"static"
        })
    })
    function  check_add_form() {
        $("#empName_add_input").parent().removeClass("has-error has-success");
        $("#email_add_input").parent().removeClass("has-error has-success");
        var email=$("#email_add_input").val();
        var regemail=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
        if($("#empName_add_input").val()==""){
            $("#empName_add_input").parent().addClass("has-error");
            return false;
        }else {
            $("#empName_add_input").parent().addClass("has-success");
        }
        if(!regemail.test(email)){
            $("#email_add_input").parent().addClass("has-error");
            return false;
        }else {
            $("#email_add_input").parent().addClass("has-success");
        }
        return true;
    }
    function  check_update_form() {
        $("#email_update_input").parent().removeClass("has-error has-success");
        var email=$("#email_update_input").val();
        var regemail=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
        if(!regemail.test(email)){
            $("#email_update_input").parent().addClass("has-error");
            return false;
        }else {
            $("#email_update_input").parent().addClass("has-success");
        }
        return true;
    }
    $("#emp_save_btn").click(function () {
        if(check_add_form()){
            $.ajax({
                url:"${pageContext.request.contextPath}/emp",
                type:'POST',
                data:$("#empAddModal form").serialize(),
                success:function (result) {
                    $("#empAddModal").modal('hide');
                    get_page(totalPage+1);
                }
            })
        }
    })
    function getemp(empId) {
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/"+empId,
            type:'get',
            success:function (result) {
               var empName=result.extend.emp.empName;
               var email=result.extend.emp.email;
               var gender=result.extend.emp.gender;
               var dId=result.extend.emp.dId;
               $("#empName_update_static").text(empName);
               $("#email_update_input").val(email);
               $("#empUpdateModal input[name=gender]").val([gender]);
               $("#empUpdateModal select").val([dId]);
            }
        })
    }
    $(document).on("click", ".edit_btn", function () {
        {
            getemp($(this).attr("empId"));
            getDepts("#dept_update_input");
            $("#emp_update_btn").attr("empId",$(this).attr("empId"))
            $("#empUpdateModal").modal({
                backdrop:"static"
            })
        }
    });
    $("#emp_update_btn").click(function () {
        if(check_update_form()){
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/"+$(this).attr("empId"),
                type:'POST',
                data:$("#empUpdateModal form").serialize()+"&_method=PUT",
                success:function (result) {
                    $("#empUpdateModal").modal('hide');
                    get_page(currentPage);
                }
            })
        }
    })
    $(document).on("click", ".delete_btn", function () {
        {
           var empName=$(this).parents("tr").find("td:eq(2)").text();
           if(confirm("确认删除【"+empName+"】吗？")){
               $.ajax({
                   url:"${pageContext.request.contextPath}/emp/"+$(this).attr("empId"),
                   type:"POST",
                   data:"&_method=DELETE",
                   success:function () {
                       get_page(currentPage);
                   }
               }
               )
           }
        }
    });
    $("#check_all_emps").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function (){
        var flag=$(".check_item:checked").length==$(".check_item").length
        $("#check_all_emps").prop("checked",flag);

    });
    $("#batch_delete_btn").click(function () {
        if($(".check_item:checked").length==0){
            return;
        }
        var empNames="";
        var empIds="";
        $.each($(".check_item:checked"),function () {
            empNames+=($(this).parents("tr").find("td:eq(2)").text()+",");
            empIds+=(($(this).parents("tr").find("td:eq(1)").text()+"-"))
        })
        empNames=empNames.substring(0,empNames.length-1);
        empIds=empIds.substring(0,empIds.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            $.ajax({
                url: "${pageContext.request.contextPath}/emps/"+empIds,
                type: "POST",
                data: "&_method=DELETE",
                success: function () {
                    get_page(currentPage);
                }
            })
        }
    })
</script>
</body>
</html>
