
function findById(bookId, action) {
    // 清空模态对话框内容
    alert("确认");

    // 发起AJAX请求获取书籍详情
    $.ajax({
        url: 'findById?bookId=' + bookId,
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            var book = response.data;
            console.log(book);
            console.log(book.book_name);
            // 构建模态对话框内容
            $('#tushumingcheng').val(book.book_name);
            $('#tushuisbn').val(book.book_isbn);
            $('#zuozhe').val(book.book_author);
            $('#chubanshe').val(book.book_press);
            $('#tushuyeshu').val(book.book_pagination);
            // 如果是借阅操作，添加借阅按钮
            if (action === 'borrow') {
                if ($('.modal-footer .borrow-button').length === 0) {
                    // 将book对象转换为JSON字符串
                    var bookJson = JSON.stringify(book);
                    // 添加新的借阅按钮
                    $('#myModal .modal-footer').append(`<button class="btn btn-primary borrow-button" onclick="borrowBook('${encodeURIComponent(bookJson)}')">借阅1</button>`);
                }
            }

            // 显示模态对话框
            $('#myModal').modal('show');
        },
        error: function (xhr, status, error) {
            // 处理错误
            $('.modal-content').html('<p>无法获取书籍详情，请稍后再试。</p>');
            $('#myModal').modal('show');
        }
    });
}

function borrowBook(bookJson) {
    console.log('111');
    // 将JSON字符串解析为JavaScript对象
    var book = JSON.parse(decodeURIComponent(bookJson));
    console.log(book.book_name);

    book.book_returntime = $('#guihuanriqi').val();
    console.log(book.book_returntime);
    // 将book对象转换为JSON字符串
    var bookJson = JSON.stringify(book);
    // 发起AJAX请求借阅书籍
    $.ajax({
        url: 'borrowBook',
        type: 'POST',
        contentType: 'application/json',
        data: bookJson,
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                // 借阅成功，关闭模态对话框
                $('#myModal').modal('hide');
                // 刷新页面
                location.reload();
            }
        },
        error: function (xhr, status, error) {
            // 处理错误
            alert('借阅失败，请稍后再试。');
        }
    });
}



function addBook() {
    console.log("addBook")
    //alert("addBook")
    // 清空模态对话框内容
    var new_shangjiazhuangtai=$('#new_shangjiazhuangtai').val()
    if(new_shangjiazhuangtai==='0'){
        alert("确认");
        var formData = {
            book_name: $('#new_tushumingcheng').val(),
            book_isbn: $('#new_tushuisbn').val(),
            book_press: $('#new_chubanshe').val(),
            book_author: $('#new_zuozhe').val(),
            book_pagination: $('#new_tushuyeshu').val(),
            book_price: $('#new_tushujiage').val(),
        };
        console.log(book_name)

        // 发起AJAX请求获取书籍详情
        $.ajax({
            url: '../book/addBook', // 更新URL
            type: 'POST',
            data: JSON.stringify(formData),
            contentType: 'application/json',
            success: function (response) {
                alert("添加成功");
                $('#newModal').modal('hide');
                // 刷新页面
                location.reload();
            },
            error: function (xhr, status, error) {
                // 处理错误
                alert('新增失败，请稍后再试。');
            }
        });
    }else {
        // 上架状态的值不是1，不执行AJAX调用
        alert('您没有选择上架，提交失败');
    }
}

function findBookById(bookId) {
    // 清空模态对话框内容

    alert("确认");
    // 发起AJAX请求获取书籍详情
    $.ajax({
        url: 'findById?bookId=' + bookId,
        type: 'GET',
        dataType: 'json',
        success: function (response) {
            var book = response.data;
            console.log(book);
            console.log(book.book_name);
            // 构建模态对话框内容

            $('#edit_tushumingcheng').val(book.book_name);
            $('#edit_tushuisbn').val(book.book_isbn);
            $('#edit_zuozhe').val(book.book_author);
            $('#edit_chubanshe').val(book.book_press);
            $('#edit_tushuyeshu').val(book.book_pagination);
            $('#edit_tushujiage').val(book.book_price);
            $('#edit_shangjiazhuangtai').val(book.book_status);

            // 将book对象转换为JSON字符串
            var bookJson = JSON.stringify(book);

            if ($('#editModal .modal-footer .edit-button').length <= 0) {
                console.log("edit-button");
                // 添加新的借阅按钮
                $('#editModal .modal-footer').append(`<button class="btn btn-primary edit-button" onclick="editBook('${encodeURIComponent(bookJson)}')">保存3</button>`);
            }

            // 显示模态对话框
            $('#editModal').modal('show');


        },
        error: function (xhr, status, error) {
            // 处理错误
            alert('获取失败，请稍后再试。');
            $('#editModal').modal('show');
        }
    });
}



function editBook(bookJson) {

    // 解析传入的JSON字符串
    var book = JSON.parse(decodeURIComponent(bookJson));

    // 从表单中获取新的书籍信息
    book.book_name = $('#edit_tushumingcheng').val();
    book.book_isbn = $('#edit_tushuisbn').val();
    book.book_press = $('#edit_chubanshe').val();
    book.book_author = $('#edit_zuozhe').val();
    book.book_pagination = $('#edit_tushuyeshu').val();
    book.book_price = $('#edit_tushujiage').val();
    book.book_status = $('#edit_shangjiazhuangtai').val();

    // 将book对象转换为JSON字符串
    var updatedBookJson = JSON.stringify(book);
    // 发起AJAX请求借阅书籍
    $.ajax({
        url: 'editBook',
        type: 'POST',
        contentType: 'application/json',
        data: updatedBookJson,
        dataType: 'json',
        success: function (response) {
            if (response.success) {
                alert('编辑成功');
                // 借阅成功，关闭模态对话框
                $('#editModal').modal('hide');
                // 刷新页面
                location.reload();
            }
        },
        error: function (xhr, status, error) {
            // 处理错误
            alert('编辑失败，请稍后再试。');
        }
    });
}

function returnBook(bookId) {
    alert("确认归还");
    $.ajax({
        url: 'returnBook?id=' + bookId,
        type: 'GET',
        dataType: 'json',
        success: function (response) {
                alert('归还成功');
                // 刷新页面
                location.reload();
        },
        error: function (xhr, status, error) {
            // 处理错误
            alert('归还失败，请稍后再试。');
        }
    });
}


function returnConfirm(bookId) {
    alert("确认");
    $.ajax({
        url: 'returnConfirm?id=' + bookId,
        type: 'GET',
        dataType: 'json',
        success: function (response) {
                alert('确认成功');
                // 刷新页面
                location.reload();
        },
        error: function (xhr, status, error) {
            // 处理错误
            alert('确认失败，请稍后再试。');
        }
    });
}