<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%-- Check if the user is logged in using HttpSession --%>
<c:if test="${sessionScope.userid == null}">
    <c:redirect url="signin.jsp" />
</c:if>


<%-- Get the todolistId from the urlencoded requestParameter --%>
<c:if test="${param.todolistId == null}">
    <c:redirect url="todolists.jsp" />
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
</head>

<body>
    ${todolistrs.rows}
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
                <li class="nav-item active">
                    <a class="nav-link" href="/TickMyDay/todolists.jsp">My todos <span class="sr-only">(current)</span></a>
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

    <sql:query dataSource="${db}" var="todolistrs">
        SELECT * from todolists WHERE id=${param.todolistId};
    </sql:query>


    <main role="main" class="container todolistsmain">
        <form method="post" action="UpdateTodoList">
            <div class="todolist-div">
                <c:forEach var="todolist" items="${todolistrs.rows}">
                    <div class="todocard">
                        <div class="card mytodolist" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                            <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                                ${todolist.title}
                                <input type="number" name="todolistId" value="${todolist.id}" style="display:none;" />
                                <c:url value="/UpdateTodoList" var="deleteListIdURL">
                                    <c:param name="todolistId" value="${todolist.id}"/>
                                </c:url>
                                <a class="btn btn-primary" style="padding: 0; float: right; border-radius: 5px;" href="${deleteListIdURL}">
                                    <img src="./static/icons/delete_forever-white-18dp.svg" style="border: 1px dashed white; border-radius: 5px; padding: 5px;">
                                </a>
                            </div>
                                <ul class="list-group list-group-flush" id="todolist">
                                <sql:query dataSource="${db}" var="todosrs">
                                    SELECT * from todos WHERE todolist_id=${todolist.id};
                                </sql:query>
                                <c:forEach var="todosr" items="${todosrs.rows}">
                                    <li id="${todosr.id}" class="list-group-item todolist-item-complete ${todolist.id}">${todosr.todo}</li>
                                </c:forEach>
                            </ul>
                            <div class="row">
                                <div class="col-2" id="addnewtodobtn">
                                    <input type="submit" value="+" class="btn btn-primary" id="addbtn" aria-label="Button for adding new todo item">
                                </div>
                                <div class="col-10" id="addnewtodoinput">
                                    <input type="text" id="newtodoitem" name="newtodoitem" class="form-control" aria-label="Text input with button">
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${requestScope.editerror}">
                <div class="alert alert-danger" role="alert">
                        ${requestScope["msg"]}
                </div>
            </c:if>
        </form>
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
    <script src="./static/purify.js/purify.min.js"></script>
    <script src="./static/main.js"></script>
</body>

</html>