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

        <!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- Bootstrap JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <title>Employee Management</title>

        <jsp:include page="head.jsp" />


    </head>

    <body>

        <div id="wrapper">

            <!-- Navigation -->
                 <jsp:include page="header.jsp" />

                 <jsp:include page="sidebar.jsp" />
                 <!-- /.sidebar -->
            <!-- /.sidebar -->

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Adding Employee</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Form
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <c:if test = "${userLogin == null}">
                                                <p class="text-danger">You have to <a class="" href="/login">login</a> to add employee</p>
                                            </c:if>

                                            <c:if test="${userLogin != null}">
                                                 <form role="form" method="POST" action="/add-employee" id="employee-form">
                                                     <div class="form-group">
                                                         <label>First Name</label>
                                                         <input class="form-control" placeholder="Enter first name" name="first-name" required>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Last Name</label>
                                                         <input class="form-control" placeholder="Enter last name" name="last-name" required>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Phone number</label>
                                                         <input class="form-control" placeholder="Enter phone number" name="phone" required>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Date of birth</label>
                                                         <input type="date" class="form-control" name="date-of-birth" required>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Gender</label>
                                                         <div class="radio">
                                                             <label>
                                                                 <input type="radio" name="gender" id="optionsRadios1" value="1" checked required>Male
                                                             </label>
                                                         </div>
                                                         <div class="radio">
                                                             <label>
                                                                 <input type="radio" name="gender" id="optionsRadios2" value="0" required>Female
                                                             </label>
                                                         </div>
                                                         <div class="radio">
                                                             <label>
                                                                 <input type="radio" name="gender" id="optionsRadios3" value="2" required>Other
                                                             </label>
                                                         </div>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Account name</label>
                                                         <input class="form-control" placeholder="Enter account name" name="account-name" required>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Email</label>
                                                         <input type="email" class="form-control" placeholder="Enter email" name="email" required>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Password (must have at least 6 characters, including uppercase, lowercase, and a number.)</label>
                                                         <input type="password" class="form-control" placeholder="Enter password" name="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Address</label>
                                                         <textarea class="form-control" rows="3" name="address" required></textarea>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Status</label>
                                                         <div class="checkbox">
                                                             <label>
                                                                 <input checked name="status" type="checkbox" value="1">Active
                                                             </label>
                                                         </div>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Department name</label>
                                                         <select name="department" class="form-control" required>
                                                             <option value="">Select Department</option>
                                                             <option value="marketing">Marketing</option>
                                                             <option value="sales">Sales</option>
                                                             <option value="finance">Finance</option>
                                                             <option value="human-resources">Human Resources</option>
                                                             <option value="operations">Operations</option>
                                                             <option value="information-technology">Information Technology</option>
                                                             <option value="customer-service">Customer Service</option>
                                                             <option value="research-and-development">Research and Development</option>
                                                             <option value="administration">Administration</option>
                                                             <option value="production">Production</option>
                                                         </select>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Remark</label>
                                                         <textarea class="form-control" rows="3" name="remark"></textarea>
                                                     </div>
                                                     <button type="submit" class="btn btn-success">Submit</button>
                                                     <button type="reset" class="btn btn-warning">Reset</button>
                                                     <button class="btn btn-primary">
                                                         <a style="color: white; text-decoration: none" href="/employee-view">Back</a>
                                                     </button>
                                                 </form>
                                            </c:if>


                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                        <!-- <div class="col-lg-6">
                                            <h1>Disabled Form States</h1>
                                            <form role="form">
                                                <fieldset disabled>
                                                    <div class="form-group">
                                                        <label for="disabledSelect">Disabled input</label>
                                                        <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="disabledSelect">Disabled select menu</label>
                                                        <select id="disabledSelect" class="form-control">
                                                            <option>Disabled select</option>
                                                        </select>
                                                    </div>
                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox">Disabled Checkbox
                                                        </label>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Disabled Button</button>
                                                </fieldset>
                                            </form>
                                            <h1>Form Validation States</h1>
                                            <form role="form">
                                                <div class="form-group has-success">
                                                    <label class="control-label" for="inputSuccess">Input with success</label>
                                                    <input type="text" class="form-control" id="inputSuccess">
                                                </div>
                                                <div class="form-group has-warning">
                                                    <label class="control-label" for="inputWarning">Input with warning</label>
                                                    <input type="text" class="form-control" id="inputWarning">
                                                </div>
                                                <div class="form-group has-error">
                                                    <label class="control-label" for="inputError">Input with error</label>
                                                    <input type="text" class="form-control" id="inputError">
                                                </div>
                                            </form>
                                            <h1>Input Groups</h1>
                                            <form role="form">
                                                <div class="form-group input-group">
                                                    <span class="input-group-addon">@</span>
                                                    <input type="text" class="form-control" placeholder="Username">
                                                </div>
                                                <div class="form-group input-group">
                                                    <input type="text" class="form-control">
                                                    <span class="input-group-addon">.00</span>
                                                </div>
                                                <div class="form-group input-group">
                                                    <span class="input-group-addon"><i class="fa fa-eur"></i>
                                                    </span>
                                                    <input type="text" class="form-control" placeholder="Font Awesome Icon">
                                                </div>
                                                <div class="form-group input-group">
                                                    <span class="input-group-addon">$</span>
                                                    <input type="text" class="form-control">
                                                    <span class="input-group-addon">.00</span>
                                                </div>
                                                <div class="form-group input-group">
                                                    <input type="text" class="form-control">
                                                    <span class="input-group-btn">
                                                        <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                        </button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div> -->
                                        <!-- /.col-lg-6 (nested) -->
                                    </div>
                                    <!-- /.row (nested) -->
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
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                var form = document.getElementById('employee-form');
                form.addEventListener('submit', function(event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        </script>
    </body>

</html>