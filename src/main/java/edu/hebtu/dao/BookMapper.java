package edu.hebtu.dao;
import com.github.pagehelper.Page;
import edu.hebtu.util.BookSqlProvider;
import org.apache.ibatis.annotations.*;

import edu.hebtu.pojo.Book;
import org.springframework.web.bind.annotation.RequestMapping;

@Mapper
public interface BookMapper {
	@Select("select * from book where book_status !='3' order by book_uploadtime DESC")
	@Results(id="bookMap",value={
			@Result(property = "book_id", column = "book_id"),
			@Result(property = "book_name", column = "book_name"),
			@Result(property = "book_isbn", column = "book_isbn"),
			@Result(property = "book_press", column = "book_press"),
			@Result(property = "book_author", column = "book_author"),
			@Result(property = "book_pagination", column = "book_pagination"),
			@Result(property = "book_price", column = "book_price"),
			@Result(property = "book_uploadtime", column = "book_uploadtime"),
			@Result(property = "book_status", column = "book_status"),
			@Result(property = "book_borrower", column = "book_borrower"),
			@Result(property = "book_borrowtime", column = "book_borrowtime"),
			@Result(property = "book_returntime", column = "book_returntime")
	})
	Page<Book> selectNewBooks();


	@Select("select * from book where book_id=#{book_id}")
	@ResultMap("bookMap")
    Book findById(int book_id);
	//编辑图书信息
	Integer editBook(Book book);

	@SelectProvider(type = BookSqlProvider.class, method = "searchBooks")
	@ResultMap("bookMap")
	Page<Book> searchBooks(@Param("book") Book book);

	@Insert("insert into book(book_name,book_isbn,book_press,book_author,book_pagination,book_price,book_uploadtime,book_status) values(#{book_name},#{book_isbn},#{book_press},#{book_author},#{book_pagination},#{book_price},#{book_uploadtime},#{book_status})")
	Integer addBook(Book book);

	@SelectProvider(type = BookSqlProvider.class, method = "selectBorrowed")
	@ResultMap("bookMap")
	//查询借阅但未归还和所有待确认的图书
	Page<Book> selectBorrowed(@Param("book") Book book);

	@SelectProvider(type = BookSqlProvider.class, method = "selectMyBorrowed")
	@ResultMap("bookMap")
		//查询借阅但未归还的图书
	Page<Book> selectMyBorrowed(@Param("book") Book book);
}
