<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%-- Check if the user is logged in using HttpSession --%>
<c:if test="${sessionScope.userid == null}">
    <c:redirect url="signin.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TickMyDay - My todos</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="./static/main.css">
    <style>
        .todoanchor:hover {
            text-decoration: none;
        }
        .list-group-item {
            color: #000;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="/TickMyDay/home.jsp">TickMyDay</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/TickMyDay/home.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            &nbsp;
            <div class="form-inline">
                <!-- TODO: Link this button to SignOut servlet -->
                <a class="btn btn-outline-light btn-outline-light-nav" href="/TickMyDay/SignOut"> 
                    Sign out
                </a>
            </div>
        </div>
    </nav>

    <sql:setDataSource var="db" driver="${initParam['dbDriver']}"
                       url="${initParam['dbUrl']}${initParam['dbName']}"
                       user="${initParam['dbUsername']}"
                       password="${initParam['dbPass']}" />

    <sql:query dataSource="${db}" var="todolistsrs">
        SELECT * from todolists WHERE user_id=${sessionScope.userid};
    </sql:query>

    <main role="main" class="container todolistsmain">
        <br>
        <a href="/TickMyDay/addnewtodo.jsp" class="btn btn-primary container">+ Add new todo list</a>
        <div class="mytodos-div">
            <c:forEach var="todolist" items="${todolistsrs.rows}">
                <div class="todocard">
                    <div class="card" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                        <c:url value="/editlist.jsp" var="todolistIdURL">
                            <c:param name="todolistId" value="${todolist.id}"/>
                        </c:url>
                        <a class="todoanchor" href="${todolistIdURL}">
                            <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                                ${todolist.title}
                            </div>
                            <ul class="list-group list-group-flush">
                                <sql:query dataSource="${db}" var="todosrs">
                                    SELECT * from todos WHERE todolist_id=${todolist.id};
                                </sql:query>
                                <c:forEach var="todo" items="${todosrs.rows}">
                                    <li class="list-group-item todoslisthome">${todo.todo}</li>
                                </c:forEach>
                            </ul>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>


    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous">
    </script>
    <script src="./static/main.js"></script>
</body>

</html>