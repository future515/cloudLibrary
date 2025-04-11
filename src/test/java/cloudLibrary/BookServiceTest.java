package cloudLibrary;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.hebtu.pojo.Book;
import edu.hebtu.service.BookService;

public class BookServiceTest {
	@Autowired
	// 注入BookService
	private BookService bookService;

//	@Test
//	public void findBookById() {
//		// 创建ApplicationContext对象，加载applicationContext.xml配置文件
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
//		// 从ApplicationContext中获取BookService对象
//		BookService bookService = (BookService) applicationContext.getBean("bookService");
//		// 调用BookService的findBookById方法，传入参数1
//		Book book = bookService.findBookById(1);
//		// 打印查询结果
//		System.out.println(book);
//
//	}
}
