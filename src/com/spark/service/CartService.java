package com.spark.service;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.spark.bean.CartDetail;
import com.spark.bean.ProductOfCart;
import com.spark.dao.CartDao;
import com.spark.dao.CartDetailDao;
import com.spark.dao.ProductDao;
/**
 * 
 * 
 * CartService
 * 创建人:Liyang 
 * 时间：2018年7月13日-下午5:32:21 
 * @version 1.0.0
 *
 */
public class CartService {
	
	
	public float getTotalPriceByCartid(int cartId) {
		
		float totalPrice = 0;
		CartDetailDao cartDetailDao = new CartDetailDao();
		ProductDao productDao = new ProductDao();
		
		ArrayList<CartDetail> cartDetails = new ArrayList<>();
		cartDetails = cartDetailDao.getCartDetailsByCartid(cartId);//获取购物车ID对应所有购物车详情
		
		for(CartDetail cartDetail: cartDetails) {
			totalPrice = totalPrice + cartDetail.getNum() * productDao.getPriceByProductid(cartDetail.getProductId());
		}
		
		return totalPrice;
		
	}
	
	public ArrayList<CartDetail> getCartDetailsByCartid(int cartid){
		
		CartDetailDao cartDetailDao = new CartDetailDao();
		
		return cartDetailDao.getCartDetailsByCartid(cartid);
	}
	
	public ArrayList<ProductOfCart> getProductListByCartid(int cartId){
		
		ArrayList<ProductOfCart> productOfCarts = new ArrayList<>();
		
		ArrayList<CartDetail> cartDetails = new ArrayList<>();
		CartDetailDao cartDetailDao = new CartDetailDao();
		ProductDao productDao = new ProductDao();
		cartDetails = cartDetailDao.getCartDetailsByCartid(cartId);//获取购物车ID对应所有购物车详情
		
		for(CartDetail cartDetail: cartDetails) {
			int cartDetailId = cartDetail.getCartDetailId();
			int productId = cartDetail.getProductId();
			String url = productDao.getPic1UrlByProductid(productId);
			String productName = productDao.getProductNameByProductid(productId);
			float price = productDao.getPriceByProductid(productId);
			int num = cartDetail.getNum();
			
			productOfCarts.add(new ProductOfCart(cartDetailId,productId, url, productName, price, num));
		}
		
		return productOfCarts;
		
	}
	
	public ArrayList<ProductOfCart> getProductListByUserid(int userId){
		
		ArrayList<ProductOfCart> productOfCarts = new ArrayList<>();
		CartDao cartDao = new CartDao();
		
		int cartId = cartDao.getCartidByUserid(userId);
		
		productOfCarts = getProductListByCartid(cartId);//调用上面的函数
		
		return productOfCarts;
		
	}
	
	public boolean addNumOFCartDetailId(int cartDetailid) {
		
		boolean isSuccess = false;
		
		CartDetailDao cartDetailDao = new CartDetailDao();
		isSuccess = cartDetailDao.addNumOFCartDetailId(cartDetailid);
		
		return isSuccess;
	}
	
	public boolean addNumOFTrId(String trId) {
		
		boolean isSuccess = false;
		
		String regEx="[^0-9]";  
		Pattern p = Pattern.compile(regEx);  
		Matcher m = p.matcher(trId);  
		
		int cartDetailid = Integer.parseInt(m.replaceAll("").trim());

		CartDetailDao cartDetailDao = new CartDetailDao();
		isSuccess = cartDetailDao.addNumOFCartDetailId(cartDetailid);
		
		return isSuccess;
	}
	
	public boolean decNumOFTrId(String trId) {
		
		boolean isSuccess = false;
		
		String regEx="[^0-9]";  
		Pattern p = Pattern.compile(regEx);  
		Matcher m = p.matcher(trId);  
		
		int cartDetailid = Integer.parseInt(m.replaceAll("").trim());

		CartDetailDao cartDetailDao = new CartDetailDao();
		isSuccess = cartDetailDao.decNumOFCartDetailId(cartDetailid);
		
		return isSuccess;
	}

	public int getNumOFTrId(String trId) {

		int num = 0;
		
		String regEx="[^0-9]";  
		Pattern p = Pattern.compile(regEx);  
		Matcher m = p.matcher(trId);  
		
		int cartDetailid = Integer.parseInt(m.replaceAll("").trim());

		CartDetailDao cartDetailDao = new CartDetailDao();
		num = cartDetailDao.getNumByCartDetailid(cartDetailid);
		
		return num;
	}
	
	public void deleteOneProductByTrId(String trId) {
		
		String regEx="[^0-9]";  
		Pattern p = Pattern.compile(regEx);  
		Matcher m = p.matcher(trId);  
		
		int cartDetailid = Integer.parseInt(m.replaceAll("").trim());

		CartDetailDao cartDetailDao = new CartDetailDao();
		cartDetailDao.deleteDetailByCartDetailId(cartDetailid);
		
	}
}
