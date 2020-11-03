// todolist page
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
    
    fetch(`/TickMyDay/DeleteSingleTodoItem?todoId=${$(this)[0].id}&todolistId=${$(this)[0].classList[2]}`, {
        method: 'POST'
    });
    
});

// addnewtodo page
let todoItems = [];
let count = 0;
function addTodoItem() {
    let todoItem = $('#todoItem').val().trim();
    
    if (todoItem !== '') {
        todoItems.push(todoItem);
        let todo = `<div class="input-group mb-3 list-btn-txtbox" class="todoItems">
        <input style="width:100%;" type='text' name='item${count++}' value='${todoItem}'>
        </div>`;
        
        $('#todos').before(todo);
    }
    $('#todoItem').val('');
}
