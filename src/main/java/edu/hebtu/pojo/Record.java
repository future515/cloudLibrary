package edu.hebtu.pojo;

import java.io.Serializable;

public class Record implements Serializable {
    private Integer id;
    private String bookname;
    private String bookisbn;
    private String borrower;
    private String borrowTime;
    private String remandTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBorrower() {
        return borrower;
    }

    public void setBorrower(String borrower) {
        this.borrower = borrower;
    }

    public String getBookisbn() {
        return bookisbn;
    }

    public void setBookisbn(String bookisbn) {
        this.bookisbn = bookisbn;
    }

    public String getBorrowTime() {
        return borrowTime;
    }

    public void setBorrowTime(String borrowTime) {
        this.borrowTime = borrowTime;
    }

    public String getRemandTime() {
        return remandTime;
    }

    public void setRemandTime(String remandTime) {
        this.remandTime = remandTime;
    }

    @Override
    public String toString() {
        return "Record{" +
                "id=" + id +
                ", bookname='" + bookname + '\'' +
                ", bookisbn='" + bookisbn + '\'' +
                ", borrower='" + borrower + '\'' +
                ", borrowTime='" + borrowTime + '\'' +
                ", remandTime='" + remandTime + '\'' +
                '}';
    }
}
