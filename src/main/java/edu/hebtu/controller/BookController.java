package edu.hebtu.controller;

import edu.hebtu.entity.PageResult;
import edu.hebtu.entity.Result;
import edu.hebtu.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import edu.hebtu.pojo.Book;
import edu.hebtu.service.BookService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/book")
public class BookController {
	@Autowired
	private BookService bookService;

	@RequestMapping("/selectNewbooks")
	public ModelAndView selectNewbooks(Integer id) {
		int pageNum = 1;
		int pageSize = 5;
		PageResult pageResult = bookService.selectNewBooks(pageNum, pageSize);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("books_new");
		modelAndView.addObject("pageResult", pageResult);
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/findById")
	public Result<Book> findById(@RequestParam(value="bookId")int id) {
		System.out.println("########"+id);
		try{
			Book book = bookService.findById(id);
			//System.out.println("查询中"+id);
			if(book == null) {
				//System.out.println("查询失败"+id);
				return new Result(false, "查询失败");
			}
			System.out.println("查询成功"+id);
			Result<Book> re = new Result<Book>(true, "查询成功", book);
			System.out.println("success:"+re.isSuccess()+"   message:"+re.getMessage()+"   bookID:"+book.getBook_id());
			return re;
		}catch (Exception e){
			e.printStackTrace();
			//System.out.println("我我我我哦我哦我我"+id);
			return new Result(false, "查询失败");
		}
	}

	@ResponseBody
	@RequestMapping(value ="/borrowBook", method = RequestMethod.POST)
	public Result borrowBook(@RequestBody Book book, HttpSession session){
		System.out.println("接收");
		String pname = ((User)session.getAttribute("USER_SESSION")).getName();
		System.out.println(pname);
		book.setBook_borrower(pname);
		try{
			Integer count = bookService.borrowBook(book);
			System.out.println("count="+count);
			if (count != 1) {
				System.out.println("借书失败");
				return new Result(false, "借书失败");
			}
			System.out.println("借书成功");
			return new Result<Book>(true, "借书成功");
		}catch (Exception e) {
			System.out.println("借书失败--异常");
			e.printStackTrace();
			return new Result(false, "借书失败");
		}
	}

	@RequestMapping("/search")
	public ModelAndView search(Book book,
							   Integer pageNum,
							   Integer pageSize,
							   HttpServletRequest request) {
		if(pageNum==null){
			pageNum=1;
		}
		if(pageSize==null){
			pageSize=10;
		}
		PageResult pageResult = bookService.search(book, pageNum, pageSize);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("books");
		modelAndView.addObject("pageResult", pageResult);
		modelAndView.addObject("search",book);
		modelAndView.addObject("pageNum",pageNum);
		modelAndView.addObject("pageSize",pageSize);
		modelAndView.addObject("gourl",request.getRequestURI());
		return modelAndView;

	}

	@ResponseBody
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public Result addBook(@RequestBody Book book) {
		System.out.println(book.toString());
		try{
			Integer count = bookService.addBook(book);
			if (count != 1) {
				return new Result(false, "添加失败");
			}
			return new Result<Book>(true, "添加成功");
		}catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "添加失败");
		}
	}

	@ResponseBody
	@RequestMapping("/editBook")
	public Result editBook(@RequestBody Book book) {
		try{
			Integer count = bookService.editBook(book);
			if (count != 1) {
				return new Result(false, "修改失败");
			}
			return new Result<Book>(true, "修改成功");
		}catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "修改失败");
		}
	}

	@ResponseBody
	@RequestMapping("/searchBorrowed")
	public ModelAndView searchBorrowed(Book book,
									   Integer pageNum,
									   Integer pageSize,
									   HttpServletRequest request) {
		if (pageNum == null) {
			pageNum = 1;
		}
		if (pageSize == null) {
			pageSize = 10;
		}
		System.out.println("searchBorrowed"+book+" pageNum="+pageNum+" pageSize="+pageSize);
		User user = ((User) request.getSession().getAttribute("USER_SESSION"));
		System.out.println("aaaaaaaa#");
		PageResult pageResult = bookService.searchBorrowed(book,user, pageNum, pageSize);
		System.out.println("bbbbbbbb#");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("books_borrowed");
		modelAndView.addObject("pageResult", pageResult);
		modelAndView.addObject("search", book);
		modelAndView.addObject("pageNum", pageNum);
		modelAndView.addObject("pageSize", pageSize);
		modelAndView.addObject("gourl", request.getRequestURI());
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("/returnBook")
    public Result returnBook(String id, HttpServletRequest request) {
		System.out.println("returnBook###+="+id);
		User user = ((User) request.getSession().getAttribute("USER_SESSION"));
		try{
			boolean flag = bookService.returnBook(id,user);
			if (flag) {
				System.out.println("1111=");
				return new Result(true, "还书成功");
			}
			return new Result(false, "还书失败1");
		}catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "还书失败2");
		}
	}

	@ResponseBody
	@RequestMapping("/returnConfirm")
	public Result returnConfirm(String id) {
		try{
			Integer count = bookService.returnConfirm(id);
			System.out.println("countcount="+count);
			if (count != 1) {
				return new Result(false, "确认失败");
			}
			return new Result(true, "确认成功");
		}catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "确认失败");
		}
	}
}
