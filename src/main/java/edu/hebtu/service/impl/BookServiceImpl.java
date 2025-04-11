package edu.hebtu.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.hebtu.entity.PageResult;
import edu.hebtu.pojo.Record;
import edu.hebtu.pojo.User;
import edu.hebtu.service.RecordService;
import javafx.scene.input.DataFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.hebtu.dao.BookMapper;
import edu.hebtu.pojo.Book;
import edu.hebtu.service.BookService;
import org.springframework.transaction.annotation.Transactional;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;
    @Autowired
    private RecordService recordService;


	@Override
	public PageResult selectNewBooks(Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Page<Book> page = bookMapper.selectNewBooks();
		return new PageResult((int) page.getTotal(), page.getResult());
	}

	@Override
	public Book findById(int id) {
		return bookMapper.findById(id);
	}

	@Override
	public Integer borrowBook(Book book) {
		System.out.println(1);
		Book b = this.findById(book.getBook_id());
		System.out.println(2);
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(3);
		book.setBook_borrowtime(dateFormat.format(new Date()));
		System.out.println(4);
		book.setBook_status("1");
		System.out.println(5);
		book.setBook_price(b.getBook_price());
		System.out.println(6);

		book.setBook_uploadtime(b.getBook_uploadtime());
		System.out.println(7);

		return bookMapper.editBook(book);
	}

	@Override
	public PageResult search(Book book, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Page<Book> page = bookMapper.searchBooks(book);
		System.out.println("BookServiceImpl::"+book.getBook_name());
		return new PageResult((int) page.getTotal(), page.getResult());

	}

	@Override
	public Integer addBook(Book book) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		book.setBook_uploadtime(dateFormat.format(new Date()));
		book.setBook_status("0");
		return bookMapper.addBook(book);
	}

	@Override
	public Integer editBook(Book book) {
		return bookMapper.editBook(book);
	}

	@Override
	public PageResult searchBorrowed(Book book, User user, Integer pageNum, Integer pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		Page<Book> page ;
		System.out.println("searchBorrowed2222"+book+user.getRole());
		book.setBook_borrower(user.getName());
		if("ADMIN".equalsIgnoreCase(user.getRole())){
			System.out.println("page:---");
			page = bookMapper.selectBorrowed(book);
			System.out.println("page:+++"+page);
		}else {
			page = bookMapper.selectMyBorrowed(book);
		}
		return new PageResult((int) page.getTotal(), page.getResult());
	}

	@Override
	public boolean returnBook(String id, User user) {
		Book book = this.findById(Integer.parseInt(id));
		System.out.println(book);
		boolean rb = book.getBook_borrower().equals(user.getName());
		System.out.println("rb="+rb);
		if(rb){
			book.setBook_status("2");
			bookMapper.editBook(book);
		}
		return rb;
	}

	@Override
	public Integer returnConfirm(String id) {
		Book book = this.findById(Integer.parseInt(id));
		Record record = this.setRecord(book);
		book.setBook_status("0");
		book.setBook_borrower("");
		book.setBook_borrowtime("");
		book.setBook_returntime("");
		Integer count = bookMapper.editBook(book);
		System.out.println("######################");
		if(count==1){
			System.out.println("######################record"+record);
			return recordService.addRecord(record);
		}
		return 0;
	}

	private Record setRecord(Book book){
		Record record = new Record();
		record.setBookname(book.getBook_name());
		record.setBookisbn(book.getBook_isbn());
		record.setBorrower(book.getBook_borrower());
		record.setBorrowTime(book.getBook_borrowtime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		record.setRemandTime(dateFormat.format(new Date()));
		return record;
	}
}
