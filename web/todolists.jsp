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
                <a class="btn btn-outline-light btn-outline-light-nav" href="#"> 
                    Sign out
                </a>
            </div>
        </div>
    </nav>



    <main role="main" class="container todolistsmain">
        <br>
        <a href="/TickMyDay/addnewtodo.jsp" class="btn btn-primary container">+ Add new todo list</a>
        <div class="mytodos-div">
            <!-- TODO: Add querystring to the href -->
            <div class="todocard">
                <div class="card" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                    <a class="todoanchor" href="/TickMyDay/editlist.jsp">
                        <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                            Todo list title
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Tryout mongodb</li>
                            <li class="list-group-item">Complete backend design</li>
                            <li class="list-group-item">Something new</li>
                        </ul>
                    </a>
                </div>
            </div>
            <div class="todocard">
                <div class="card" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                    <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                        Todo list title
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Tryout mongodb</li>
                        <li class="list-group-item">Complete backend design</li>
                        <li class="list-group-item">Something new</li>
                    </ul>
                </div>
            </div>
            <div class="todocard">
                <div class="card" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                    <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                        Todo list title
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Tryout mongodb</li>
                        <li class="list-group-item">Complete backend design</li>
                        <li class="list-group-item">Something new</li>
                    </ul>
                </div>
            </div>
            <div class="todocard">
                <div class="card" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                    <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                        Todo list title
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Tryout mongodb</li>
                        <li class="list-group-item">Complete backend design</li>
                        <li class="list-group-item">Something new</li>
                    </ul>
                </div>
            </div>
            <div class="todocard">
                <div class="card" style="width: 18rem; border: 1px solid var(--bootstrap-primary);">
                    <div class="card-header bootstrap-primary-bgcolor" style="color: white;">
                        Todo list title
                    </div>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Tryout mongodb</li>
                        <li class="list-group-item">Complete backend design</li>
                        <li class="list-group-item">Something new</li>
                    </ul>
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