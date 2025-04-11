package edu.hebtu.util;
import java.util.Map;
import edu.hebtu.pojo.Book;
import edu.hebtu.pojo.Record;

public class BookSqlProvider {
    public String searchBooks(Map<String, Object> params) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM book WHERE book_status != '3'");

        if (params.get("book") != null) {
            Book book = (Book) params.get("book");
            System.out.println("11111");
            System.out.println(book.getBook_name());

            if (book.getBook_name() != null) {
                System.out.println("getBook_name");
                sql.append(" AND book_name LIKE CONCAT('%', #{book.book_name}, '%')");
            }
            if (book.getBook_press() != null) {
                System.out.println("getBook_press");
                sql.append(" AND book_press LIKE CONCAT('%', #{book.book_press}, '%')");
            }
            if (book.getBook_author() != null) {
                System.out.println("getBook_author");
                sql.append(" AND book_author LIKE CONCAT('%', #{book.book_author}, '%')");
            }
        }
        System.out.println(sql.toString());
        return sql.toString();
    }

    public String selectBorrowed(Map<String, Object> params) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM book WHERE  book_status = '1' ");
// book_borrower = #{book.book_borrower} and
        if (params.get("book") != null) {
            Book book = (Book) params.get("book");
            System.out.println("22222");
            System.out.println(book.getBook_name());

            if (book.getBook_name() != null) {
                System.out.println("getBook_name");
                sql.append(" AND book_name LIKE CONCAT('%', #{book.book_name}, '%')");
            }
            if (book.getBook_press() != null) {
                System.out.println("getBook_press");
                sql.append(" AND book_press LIKE CONCAT('%', #{book.book_press}, '%')");
            }

            if (book.getBook_author() != null) {
                System.out.println("getBook_author");
                sql.append(" AND book_author LIKE CONCAT('%', #{book.book_author}, '%')");
            }
            sql.append(" or book_status= '2' ");
            if (book.getBook_name() != null) {
                System.out.println("getBook_name");
                sql.append(" AND book_name LIKE CONCAT('%', #{book.book_name}, '%')");
            }
            if (book.getBook_press() != null) {
                System.out.println("getBook_press");
                sql.append(" AND book_press LIKE CONCAT('%', #{book.book_press}, '%')");
            }

            if (book.getBook_author() != null) {
                System.out.println("getBook_author");
                sql.append(" AND book_author LIKE CONCAT('%', #{book.book_author}, '%')");
            }
            sql.append("order by book_borrowtime");
        }
        System.out.println(sql.toString());
        return sql.toString();
    }

    public String selectMyBorrowed(Map<String, Object> params) {
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM book WHERE book_borrower = #{book.book_borrower} and book_status in('1','2') ");

        if (params.get("book") != null) {
            Book book = (Book) params.get("book");
            System.out.println("22222");
            System.out.println(book.getBook_name());

            if (book.getBook_name() != null) {
                System.out.println("getBook_name");
                sql.append(" AND book_name LIKE CONCAT('%', #{book.book_name}, '%')");
            }
            if (book.getBook_press() != null) {
                System.out.println("getBook_press");
                sql.append(" AND book_press LIKE CONCAT('%', #{book.book_press}, '%')");
            }

            if (book.getBook_author() != null) {
                System.out.println("getBook_author");
                sql.append(" AND book_author LIKE CONCAT('%', #{book.book_author}, '%')");
            }
            sql.append(" order by book_borrowtime");
        }
        System.out.println(sql.toString());
        return sql.toString();
    }

    public String searchRecord(Map<String, Object> params) {
        System.out.println("测试11");

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM record WHERE 1=1");
        System.out.println("测试22");

        if (params.get("record") != null) {
            Record record = (Record) params.get("record");
            System.out.println("333333");
            System.out.println(record.getBookname());
            if (record.getBorrower() != null) {
                System.out.println("getBorrower");
                sql.append(" AND record_borrower LIKE CONCAT('%', #{record.borrower}, '%')");
            }
            if(record.getBookname() != null) {
                System.out.println("getBookname");
                sql.append(" AND record_bookname LIKE CONCAT('%', #{record.bookname}, '%')");
            }
            sql.append(" order by record_remandtime desc");
        }
        System.out.println(sql.toString());
        return sql.toString();
    }
}
