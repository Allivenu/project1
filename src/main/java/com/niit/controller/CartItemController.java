package com.niit.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.Product;
import com.niit.service.CartItemService;
import com.niit.service.CartService;
import com.niit.service.CustomerService;
import com.niit.service.Productservice;

@Controller
public class CartItemController {
	 
	
  @Autowired
  private CartItemService cartItemService;
  @Autowired
  private CustomerService customerService;
  @Autowired
  private Productservice productService;
  @Autowired
  private CartService cartService;
  
  @RequestMapping("/cart/addCartItem/{pid}")
  @ResponseStatus(value=HttpStatus.NO_CONTENT)
  public void addCartItem(@PathVariable(value="pid") int productId){
	  
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  String name = auth.getName();
	  System.out.println("my username is : "+name);
	  
	  
	System.out.println("iam in cartitemcontroller"+productId);
      User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	  String username = user.getUsername();
	  
	  Customer customer = customerService.getCustomerByUsername(username);
	  Cart cart = customer.getCart();
	  List<CartItem> cartItems = cart.getCartItems();
	  Product product = productService.getProductById(productId);
	  
	  
	  for(int i=0;i<cartItems.size();i++){
		  CartItem cartItem = cartItems.get(i);
		  Product p = cartItem.getProduct();
		  if(p.getId() == productId){
			  cartItem.setQuantity(cartItem.getQuantity()+1);
			  cartItem.setTotalPrice(cartItem.getQuantity() * p.getPrice());
			  cartItemService.addCartItem(cartItem);
			  return;
		  }
	   
	  }
	  
	 // @RequestMapping("/updatecart")
	// public String updatethecart(){
		  
		// return "redirect:/home";
	// }
	  
	  CartItem cartItem = new CartItem();
	  cartItem.setQuantity(1);
	  cartItem.setTotalPrice(cartItem.getQuantity() *  product.getPrice());
	  cartItem.setProduct(product);
	  cartItem.setCart(cart);
	  cartItemService.addCartItem(cartItem);
	   
	  
	 
  }
 @RequestMapping("/updatecart")
	public String updatethecart(){
		  
		 return "redirect:/home";
	 }
	  
  
  
  @RequestMapping("/cart/removeCartItem/{cartItemId}")
  @ResponseStatus(value=HttpStatus.NO_CONTENT)
  public void removeCartItem(@PathVariable int cartItemId){
	  CartItem cartItem= cartItemService.getCartItem(cartItemId);
	  cartItemService.removeCartItem(cartItem);
  }
  @RequestMapping("/cart/removeAllCartItems/{cartId}")
  @ResponseStatus(value=HttpStatus.NO_CONTENT)
  public void removeAllCartItems(@PathVariable int cartId){
	  Cart cart = cartService.getCart(cartId);
	  cartItemService.removeAllCartItems(cart);
  }
  
}
  