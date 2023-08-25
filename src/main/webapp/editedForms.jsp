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
            <!-- /.sidebar -->

            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Edited Employee</h1>
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
                                                 <form action="/edit-employee" method="POST" data-toggle="validator" role="form">
                                                     <input type="hidden" name="employee-id" value="${Employee.employeeId}"></input>
                                                     <input type="hidden" name="account-id" value="${Employee.account.accountId}"></input>

                                                     <div class="form-group">
                                                         <label class="control-label">First Name</label>
                                                         <input required value="${Employee.firstName}" class="form-control" placeholder="Enter first name" name="first-name">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Last Name</label>
                                                         <input required value="${Employee.lastName}" class="form-control" placeholder="Enter last name" name="last-name">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Phone number</label>
                                                         <input required value="${Employee.phone}" class="form-control" placeholder="Enter phone number" name="phone">
                                                     </div>

                                                     <div class="form-group">
                                                         <label>Date of birth</label>
                                                         <fmt:formatDate pattern="yyyy-MM-dd" value="${Employee.dateOfBirth}" var="formattedDate" />
                                                         <input required value="${formattedDate}" type="date" class="form-control" name="date-of-birth">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Gender</label>
                                                         <div class="radio">
                                                             <label>
                                                                 <input ${Integer.parseInt(Employee.gender) == 1 ? "checked" : ""} type="radio" name="gender" value="1">Male
                                                             </label>
                                                         </div>
                                                         <div class="radio">
                                                             <label>
                                                                 <input ${Integer.parseInt(Employee.gender) == 0 ? "checked" : ""} type="radio" name="gender" value="0">Female
                                                             </label>
                                                         </div>
                                                         <div class="radio">
                                                             <label>
                                                                 <input ${Integer.parseInt(Employee.gender) == 2 ? "checked" : ""} type="radio" name="gender" value="2">Other
                                                             </label>
                                                         </div>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Account</label>
                                                         <input required value="${Employee.account.account}" class="form-control" placeholder="Enter account name" name="account-name">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Email</label>
                                                         <input required value="${Employee.account.email}" type="email" class="form-control" placeholder="Enter email" name="email">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Password (must have at least 6 characters, including uppercase, lowercase, and a number.)</label>
                                                         <input pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$" required data-error="The password must have at least 6 characters, including uppercase, lowercase, and a number." value="${Employee.account.password}" type="password" class="form-control" placeholder="Enter password" name="password">
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Address</label>
                                                         <textarea required class="form-control" rows="3" name="address">${Employee.address}</textarea>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Status</label>

                                                         <div class="checkbox">
                                                             <label>
                                                                 <input ${(Integer.parseInt(Employee.account.status) == 1) ? "checked" : ""} name="status" value="${Employee.account.status}" type="checkbox">Active
                                                             </label>
                                                         </div>
                                                     </div>
                                                     <div class="form-group">
                                                         <label>Department name</label>
                                                         <input required value="${Employee.departmentName}" class="form-control" placeholder="Enter department name" name="department">
                                                     </div>

                                                     <div class="form-group">
                                                         <label>Remark</label>
                                                         <textarea required class="form-control" rows="3" name="remark">${Employee.remark}</textarea>
                                                     </div>

                                                     <button type="submit" class="btn btn-success">Save</button>
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
    </body>

</html>