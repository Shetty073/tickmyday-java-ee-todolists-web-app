<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Check if the user is logged in and if yes then redirect to todolists page --%>
<c:if test="${userScope.userid != null}">
    ${response.sendRedirect("todolists.jsp")}
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TickMyDay - Sign up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="./static/main.css">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="/TickMyDay/home.jsp">TickMyDay</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/TickMyDay/home.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>

    <main role="main" class="container signup-main">
        <div class="signup-form-div">
            <h1 class="bootstrap-primary-color">Sign up for a new account</h1>
            <form id="signup-form" method="POST" action="SignUp">
                <div class="row">
                    <div class="col">
                        <label for="firstname">First name</label>
                        <input type="text" class="form-control" name="firstname" id="firstname" placeholder="First name">
                    </div>
                    <div class="col">
                        <label for="lastname">Last name</label>
                        <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Last name">
                    </div>
                </div>
                <br>
                <div class="form-group">
                    <label for="email">Email address</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="name@example.com">
                </div>
                <div class="form-group">
                    <label for="password1">Password</label>
                    <input type="password" class="form-control" name="password1" id="password1">
                </div>
                <div class="form-group">
                    <label for="password2">Confirm password</label>
                    <input type="password" class="form-control" name="password2" id="password2">
                </div>
        <!--    <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="terms-check">
                    <label class="form-check-label" for="terms-check">Check me out</label>
                </div>  -->
                <c:if test="${requestScope.signuperror}">
                    <div class="alert alert-danger" role="alert">
                            ${requestScope["msg"]}
                    </div>
                </c:if>
                <c:if test="${requestScope.signupsuccess}">
                    <div class="alert alert-success" role="alert">
                        Account created successfully!<br>
                        Please wait while we redirect you to the signin page.
                    </div>
                    <script type="text/javascript">
                        setTimeout(function(){document.location = '/TickMyDay/signin.jsp'}, 3000);
                    </script>
                </c:if>
                <button type="submit" class="btn btn-primary" id="signup-btn">Sign up</button>
            </form>
        </div>
    </main>

    <footer id="signup-footer" class="sticky-bottom bootstrap-primary-bgcolor">
        <ul class="footer-links-ul">
            <li><a href="#">About Us</a></li>
            <li><a href="#">Hiring</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous">
    </script>
    <script src="./static/purify.js/purify.min.js"></script>
    <script src="./static/main.js"></script>
</body>

</html>