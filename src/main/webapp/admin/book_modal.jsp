<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">图书信息</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- 模态框内容 -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>图书名称</label>
                        <input id="tushumingcheng" type="text" class="form-control" readonly>
                    </div>
                    <div class="col-md-6">
                        <label>图书ISBN</label>
                        <input id="tushuisbn" type="text" class="form-control" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>出版社</label>
                        <input id="chubanshe" type="text" class="form-control" readonly>
                    </div>
                    <div class="col-md-6">
                        <label>作者</label>
                        <input id="zuozhe" type="text" class="form-control" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>图书页数</label>
                        <input id="tushuyeshu" type="text" class="form-control" readonly>
                    </div>
                    <div class="col-md-6">
                        <label>归还日期</label>
                        <input type="date" id="guihuanriqi" name="guihuanriqi" class="form-control">
                    </div>
                </div>

            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭1</button>
            </div>

        </div>
    </div>
</div>


<div class="modal fade" id="newModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">图书信息</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- 模态框内容 -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>图书名称</label>
                        <input id="new_tushumingcheng" name="new_tushumingcheng" type="text" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>图书ISBN</label>
                        <input id="new_tushuisbn" name="new_tushuisbn" type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>出版社</label>
                        <input id="new_chubanshe" name="new_chubanshe" type="text" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>作者</label>
                        <input id="new_zuozhe" name="new_zuozhe" type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>图书页数</label>
                        <input id="new_tushuyeshu" name="new_tushuyeshu" type="text" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>图书价格</label>
                        <input type="text" id="new_tushujiage" name="new_tushujiage" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>上架状态</label>
                        <select id="new_shangjiazhuangtai" name="new_shangjiazhuangtai" class="form-control">
                            <option value="0" selected>上架</option>
                            <option value="3">下架</option>
                        </select>
                    </div>
                </div>

            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button class="btn btn-primary" onclick="addBook()">增加2</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭2</button>
            </div>

        </div>
    </div>
</div>

<div class="modal fade" id="editModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">图书信息</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- 模态框内容 -->
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>图书名称</label>
                        <input id="edit_tushumingcheng" name="edit_tushumingcheng" type="text" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>图书ISBN</label>
                        <input id="edit_tushuisbn" name="edit_tushuisbn" type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>出版社</label>
                        <input id="edit_chubanshe" name="edit_chubanshe" type="text" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>作者</label>
                        <input id="edit_zuozhe" name="editzuozhe" type="text" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>图书页数</label>
                        <input id="edit_tushuyeshu" name="edit_tushuyeshu" type="text" class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label>图书价格</label>
                        <input type="text" id="edit_tushujiage" name="edit_tushujiage" class="form-control">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <label>上架状态</label>
                        <select id="edit_shangjiazhuangtai" name="edit_shangjiazhuangtai" class="form-control">
                            <option value="0" selected>上架</option>
                            <option value="3">下架</option>
                        </select>
                    </div>
                </div>

            </div>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">关闭3</button>
            </div>

        </div>
    </div>
</div>