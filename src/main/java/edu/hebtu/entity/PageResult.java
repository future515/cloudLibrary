package edu.hebtu.entity;

import java.io.Serializable;
import java.util.List;

public class PageResult implements Serializable {
    private Integer total;
    private List rows;
    public PageResult(Integer total, List rows) {
        super();
        this.total = total;
        this.rows = rows;
    }

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
}
