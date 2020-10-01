<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="/TickMyDay">TickMyDay</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/TickMyDay">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/TickMyDay/todolists.jsp">My todos <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            &nbsp;
            <div class="form-inline">
                <a class="btn btn-outline-light btn-outline-light-nav" href="#">
                    Sign out
                </a>
            </div>
        </div>
    </nav>


    <main role="main" class="container todolistsmain">
        <div class="todolist-div">
            <!-- TODO: Complete this todo lists template -->
            <div class="todocard">
                <div class="card mytodolist" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                    <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                        Todo list title
                        <button class="btn btn-primary" style="padding: 0; float: right; border-radius: 5px;">
                            <img src="./static/icons/delete_forever-white-18dp.svg" style="border: 1px dashed white; border-radius: 5px; padding: 5px;">
                        </button>
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Tryout mongodb</li>
                        <li class="list-group-item">Complete backend design</li>
                        <li class="list-group-item">Something new</li>
                    </ul>
                    <div class="row">
                        <div class="col-2" id="addnewtodobtn">
                            <input type="button" value="+" class="btn btn-primary" id="addbtn" onclick="addNewTodoItem()" aria-label="Button for adding new todo item">
                        </div>
                        <div class="col-10" id="addnewtodoinput">
                            <input type="text" id="newtodoitem" class="form-control" aria-label="Text input with button">
                        </div>
                    </div>
                </div>
            </div>
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