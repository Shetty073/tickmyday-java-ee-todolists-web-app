<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>TickMyDay - Home</title>
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
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="/TickMyDay">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/TickMyDay/todolists.jsp">My todos</a>
                </li>
            </ul>
            &nbsp;
            <div class="form-inline">
                <a class="btn btn-outline-light btn-outline-light-nav" href="/TickMyDay/signin.jsp">
                    Sign in
                </a>
                &nbsp;
                <a class="btn btn-outline-light btn-outline-light-nav" href="/TickMyDay/signup.jsp">
                    Sign up
                </a>
            </div>
        </div>
    </nav>


    <main role="main" class="container home-main">
        <div class="row content">
            <div class="col-6">
                <img class="content-image" src="./static/images/To_do_list.svg">
            </div>
            <div class="col-6">
                <div class="content-description">
                    <h3 class="bootstrap-primary-color">Organization</h3>
                    <p>One of the most important reasons for keeping a to-do list is the organization. Organizing your
                    tasks with a list can make everything much more manageable and make you feel grounded. Seeing a
                    clear outline of your completed and uncompleted tasks will help you feel organized and stay mentally
                    focused.</p>
                    <p>As you cross items off your to-do list, you'll feel a sense of progress and accomplishment that can
                    be missed when rushing from one activity to the next. The affirmation that you are making progress
                    will help motivate you to keep moving forward rather than feeling overwhelmed.</p>
                </div>
            </div>
        </div>
        <br>
        <hr class="bootstrap-primary-hr">
        <br>
        <div class="row content">
            <div class="col-6">
                
                <div class="content-description">
                    <h3 class="bootstrap-primary-color">Lists Reduce Anxiety</h3>
                    <p>This one should be obvious, but having the list itself is often literally storing information 
                    in a cloud. Itâs always reachable and most of the time infrequently needed afterwards.
                    Physically written lists take the tasks into the real world making it no longer a task to rely 
                    on your memory and allow you to actually work on accomplishing the items on the list.</p>
                </div>
            </div>
            <div class="col-6">
                <img class="content-image" src="./static/images/to_do.svg">
            </div>
        </div>
        <br>
        <hr class="bootstrap-primary-hr">
        <br>
        <div class="row content">
            <div class="col-6">
                <img class="content-image" src="./static/images/prioritise.svg">
            </div>
            <div class="col-6">
                <div class="content-description">
                    <h3 class="bootstrap-primary-color">Productivity</h3>
                    <p>If you record all your tasks in a to-do list, you can easily review the list and prioritize the 
                    most important tasks. Why waste time on trivial activities when there are important matters that 
                    need your attention? One study, conducted by the Harvard Business Review, showed that 90% of 
                    managers wasted valuable time through poor time management. Your to-do list will help you focus 
                    your attention on the most important task of the moment.</p>
                </div>
            </div>
        </div>
        <br>
        <hr class="bootstrap-primary-hr">
        <br>
        <div class="row content">
            <div class="col-6">
                <div class="content-description">
                    <h3 class="bootstrap-primary-color">Improved Memory</h3>
                    <p>Feeling forgetful? Nobody is capable of remembering everything at all times. To-do lists 
                    are a useful external memory aid that give you permission to forget. As long as you can 
                    remember to look at your to-do list, you will never lose anything that you have recorded 
                    on it.</p>
                </div>
            </div>
            <div class="col-6">
                <img class="content-image" src="./static/images/plans.svg">
            </div>
        </div>
        <br>
        <hr class="bootstrap-primary-hr">
        <br>
        <div class="row content">
            <div class="col-6">
                <img class="content-image" src="./static/images/chore_list.svg">
            </div>
            <div class="col-6">
                <div class="content-description">
                    <h3 class="bootstrap-primary-color">Motivation</h3>
                    <p>Motivational speakers will tell you that to-do lists are a useful motivational tool when used as 
                    a way to clarify goals. It's easy to say, "I want to get that promotion," but listing the steps 
                    that you intend to take to accomplish that goal can help clarify your thoughts and give you 
                    achievable short-term goals. As you succeed at each step along the way, you'll gain confidence 
                    crossing those items off your list!</p>
                </div>
            </div>
        </div>
        <br>
        <hr class="bootstrap-primary-hr">
        <br>
        <div class="row content">
            <div class="col-6">
                <div class="content-description">
                    <h3 class="bootstrap-primary-color">Prioritize</h3>
                    <p>The second thing I think the To Do list is vitally important for, the second reason why you 
                    need one, is because it helps you to prioritize. There are many things you could be doing. 
                    You could write down a To Do list with probably 50 things on it, too much of a trouble. 
                    Thereâs always plenty to do in life, and more and more things happen as your day goes on. 
                    You'll constantly be adding to a To Do list. The good thing about having a list is that 
                    you can prioritize. Itâs very easy to look at all the things that are on the list and 
                    then choose whatâs most important or whatâs going to be the best use of your time.</p>
                </div>
            </div>
            <div class="col-6">
                <img class="content-image" src="./static/images/checklist.svg">
            </div>
        </div>
        <br>
    </main>


    <footer class="sticky-bottom bootstrap-primary-bgcolor">
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
    <script src="./static/main.js"></script>
</body>

</html>