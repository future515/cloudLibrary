package edu.hebtu.pojo;

public class Book {
	private Integer book_id;
	private String book_name;
	private String book_isbn;
	private String book_press;
	private String book_author;
	private Integer book_pagination;
	private Double book_price;
	private String book_uploadtime;
	private String book_status;
	private String book_borrower;
	private String book_borrowtime;
	private String book_returntime;

	@Override
	public String toString() {
		return "Book{" +
				"book_id=" + book_id +
				", book_name='" + book_name + '\'' +
				", book_isbn='" + book_isbn + '\'' +
				", book_press='" + book_press + '\'' +
				", book_author='" + book_author + '\'' +
				", book_pagination=" + book_pagination +
				", book_price=" + book_price +
				", book_uploadtime='" + book_uploadtime + '\'' +
				", book_status='" + book_status + '\'' +
				", book_borrower='" + book_borrower + '\'' +
				", book_borrowtime='" + book_borrowtime + '\'' +
				", book_returntime='" + book_returntime + '\'' +
				'}';
	}

	public Integer getBook_id() {
		return book_id;
	}

	public void setBook_id(Integer book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getBook_isbn() {
		return book_isbn;
	}

	public void setBook_isbn(String book_isbn) {
		this.book_isbn = book_isbn;
	}

	public String getBook_press() {
		return book_press;
	}

	public void setBook_press(String book_press) {
		this.book_press = book_press;
	}

	public String getBook_author() {
		return book_author;
	}

	public void setBook_author(String book_author) {
		this.book_author = book_author;
	}

	public Integer getBook_pagination() {
		return book_pagination;
	}

	public void setBook_pagination(Integer book_pagination) {
		this.book_pagination = book_pagination;
	}

	public Double getBook_price() {
		return book_price;
	}

	public void setBook_price(Double book_price) {
		this.book_price = book_price;
	}

	public String getBook_uploadtime() {
		return book_uploadtime;
	}

	public void setBook_uploadtime(String book_uploadtime) {
		this.book_uploadtime = book_uploadtime;
	}

	public String getBook_status() {
		return book_status;
	}

	public void setBook_status(String book_status) {
		this.book_status = book_status;
	}

	public String getBook_borrower() {
		return book_borrower;
	}

	public void setBook_borrower(String book_borrower) {
		this.book_borrower = book_borrower;
	}

	public String getBook_borrowtime() {
		return book_borrowtime;
	}

	public void setBook_borrowtime(String book_borrowtime) {
		this.book_borrowtime = book_borrowtime;
	}

	public String getBook_returntime() {
		return book_returntime;
	}

	public void setBook_returntime(String book_returntime) {
		this.book_returntime = book_returntime;
	}
}
