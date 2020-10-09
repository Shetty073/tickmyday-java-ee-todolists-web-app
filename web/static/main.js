// list page
let editFlag = false;

$('.todolist-item-complete').on('dblclick', function () {
    if (editFlag === false) {
        $(this).css('text-decoration', 'line-through');
        setTimeout(() => {
            // TODO (for java ee app): Delete this particular item from database

            // Set the display to none
            $(this).css('display', 'none');
        }, 1000);
    }
});

function deleteThisTodo() {
    
}

function addNewTodoItem() {
    let newTododItem = $('#newtodoitem').val();


    // send AJAX call for adding this new todo
    
}



// addnewtodo page
function addAnotherListBtnTextBox() {
    
}

function saveTodoList() {
    
}


function cancel() {
    
}
