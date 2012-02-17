package com.yutax77.model;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.TypedQuery;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml")
public class BookTest {

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		Book book1 = new Book();
		book1.setName("aaa");
		book1.setAuthors("aaa");
		book1.setPublisher("aaa");
		book1.setISBN("aaa");
		book1.persist();
		List<Book> books = Book.findBooksByNameEquals("aaa").getResultList();
		assertEquals(1, books.size());
		assertEquals("aaa", books.get(0).getName());
	}

}
