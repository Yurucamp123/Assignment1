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

        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form action="/login" method="POST">
                                    <c:if test="${showError != null}">
                                        <p class="text-danger">${showError}</p>
                                    </c:if>
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" id="username"
                                               class="form-control ${usernameError != null ? 'is-invalid' : ''}" name="username">
                                        <c:if test="${usernameError != null}">
                                            <p class="text-danger">${usernameError}</p>
                                        </c:if>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password"
                                               class="form-control ${passwordError != null ? 'is-invalid' : ''}" name="password">
                                        <c:if test="${passwordError != null}">
                                            <p class="text-danger">${passwordError}</p>
                                        </c:if>
                                    </div>
                                    <div class="form-group">
                                        <a href="" class="">Forget password?</a>
                                    </div>
                                    <div class="checkbox">
                                        <label>
                                            <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                        </label>
                                    </div>
                                    <!-- Change this to a button or input when using this as a form -->
                                    <button type="submit" class="btn btn-lg btn-success btn-block">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/startmin.js"></script>

    </body>

</html>
