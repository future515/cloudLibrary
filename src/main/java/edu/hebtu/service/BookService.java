package edu.hebtu.service;

import edu.hebtu.entity.PageResult;
import edu.hebtu.pojo.Book;
import edu.hebtu.pojo.User;

public interface BookService {
	PageResult selectNewBooks(Integer pageNum,Integer pageSize);

	Book findById(int id);
	Integer borrowBook(Book book);

	//分页查询图书
	PageResult search(Book book,Integer pageNum,Integer pageSize);

	Integer addBook(Book book);

	Integer editBook(Book book);

	PageResult searchBorrowed(Book book, User user, Integer pageNum, Integer pageSize);

	boolean returnBook(String id, User user);

	Integer returnConfirm (String id);
}
