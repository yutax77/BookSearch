package com.yutax77.controller;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.yutax77.model.Book;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml")
public class BookControllerTest {
	Book book1;
	@Before
	public void setUp() throws Exception {
		book1 = new Book();
		book1.setName("aaa");
		book1.setAuthors("aaa");
		book1.setPublisher("aaa");
		book1.setISBN("aaa");
		book1.persist();		
	}

	@After
	public void tearDown() throws Exception {
		book1.remove();
	}

	@SuppressWarnings("unchecked")
	@Test
	public void test() {
		
		Model books = 	new ExtendedModelMap();
		BookController bookController = new BookController();
		bookController.findBooksByNameEquals("aaa", books);

		List<Book> bookresult = (List<Book>)books.asMap().get("books");
		assertEquals(1, bookresult.size());
		assertEquals("aaa", bookresult.get(0).getName());
		
		
		
	}

}
    