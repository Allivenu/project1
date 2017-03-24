package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.niit.dao.Productdao;

import com.niit.model.Product;
@Repository
public class ProductdaoImpl implements Productdao{
	
	private static final Logger log=LoggerFactory.getLogger(ProductdaoImpl.class);
	
	
	@Autowired
	private SessionFactory sessionFactory;
	public ProductdaoImpl(SessionFactory sessionFactory)
	{
		log.info("session start");
		this.sessionFactory=sessionFactory;
		log.info("session creaetd");
		System.out.println("creating instance");
	}
    
	public Product saveproduct(Product product) {
		Session session=sessionFactory.openSession();
		session.save(product);
		session.flush();
		session.close();
		System.out.println(product.getId());
		return product;
	}
	public List<Product> getallproducts(){
		 Session session = sessionFactory.openSession();
		   List<Product> products = session.createQuery("from Product").list();
		   session.close();
		   return products;
	}
	public Product getProductById(int id){
		Session session = sessionFactory.openSession();
		Product product=(Product)session.get(Product.class, id);
		session.close();
		return product;
	}
	public void deleteProduct(int id) {
		 Session session = sessionFactory.openSession();
		 Product product =(Product)session.get(Product.class, id);
		 session.delete(product);
		 session.flush();
		 session.close();
		
	}

	public void updateProduct(Product product) {
		Session session = sessionFactory.openSession();
		System.out.println(product.getId());
		session.update(product);
		session.flush();
		session.close();
	}

	public byte[] loadImage(int productid){
		   Session session = sessionFactory.openSession();
		   Product product = (Product)session.get(Product.class, productid);
		   byte[] b = product.getPicture();
		   return b;
	   }
	
	public List<Product> getProductByDiscount(){
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Product where category.id=?");
		query.setInteger(0, 2);
		List<Product> product = query.list();
		return product;
	}
}
