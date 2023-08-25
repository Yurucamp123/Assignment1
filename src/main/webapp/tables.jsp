<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Employee Management</title>
        <jsp:include page="head.jsp" />
    </head>

    <body>

        <div id="wrapper">
            <!-- Navigation -->
            <jsp:include page="header.jsp" />

            <jsp:include page="sidebar.jsp" />
            <!-- /.sidebar -->

            <div id="page-wrapper">
                <c:if test = "${userLogin == null}">
                    <div class="container-fluid"  style="margin-top: 40px">
                        <p class="text-danger">You have to <a class="" href="/login">login</a> to view employee list</p>
                    </div>
                </c:if>

                <c:if test="${userLogin != null}"  >
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-12">
                                    <h1 class="page-header">Employee list</h1>
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="panel panel-default">
                                        <!-- /.panel-heading -->
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Id</th>
                                                            <th>Name</th>
                                                            <th>Date of birth</th>
                                                            <th>Address</th>
                                                            <th>Phone number</th>
                                                            <th>Department</th>
                                                            <th>Action</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="employee" items="${employeeList}">
                                                            <tr>
                                                                <td>${employee.employeeId}</td>
                                                                <td>${employee.firstName} ${employee.lastName}</td>
                                                                <td>${employee.dateOfBirth}</td>
                                                                <td>${employee.address}</td>
                                                                <td>${employee.phone}</td>
                                                                <td>${employee.departmentName}</td>
                                                                <td>
                                                                    <button class="btn btn-danger" style="margin-right: 10px"  data-toggle="modal" data-target="#myModal${employee.employeeId}">
                                                                      Delete
                                                                    </button>

                                                                    <!-- Modal -->
                                                                    <div class="modal" id="myModal${employee.employeeId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                      <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                  <div class="modal-header">
                                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                    <h4 class="modal-title">Confirm</h4>
                                                                                  </div>
                                                                                  <div class="modal-body">
                                                                                    <p>Do you want to delete employee (Warning: if you delete employee, the account linked with that employee will be deleted too)?</p>
                                                                                  </div>
                                                                                  <div class="modal-footer">
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                                                    <button type="button" class="btn btn-primary">
                                                                                        <a href="/delete?deletedId=${employee.employeeId}" style="text-decoration: none; color: white">Yes</a>
                                                                                    </button>
                                                                                  </div>
                                                                            </div>
                                                                      </div><!-- /.modal-dialog -->
                                                                    </div><!-- /.modal -->

                                                                    <button class="btn btn-primary">
                                                                        <a href=""><a href="/edit-employee?id=${employee.employeeId}" style="color:white" class="text">View</a></a>
                                                                    </button>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                        <!-- /.panel-body -->
                                    </div>
                                    <!-- /.panel -->
                                </div>
                                <!-- /.col-lg-12 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                </c:if>
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- DataTables JavaScript -->
        <script src="../js/dataTables/jquery.dataTables.min.js"></script>
        <script src="../js/dataTables/dataTables.bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>

        <!-- Page-Level Demo Scripts - Tables - Use for reference -->
        <script>
            $(document).ready(function () {
                $('#dataTables-example').DataTable({
                    responsive: true
                });
            });
        </script>

    </body>

</html>