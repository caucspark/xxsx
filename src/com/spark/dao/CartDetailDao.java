package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.spark.bean.CartDetail;
import com.spark.bean.Orderdetail;
import com.spark.bean.ProductOfOrderdetail;
import com.spark.util.ConnectionFactory;

public class CartDetailDao {
	
	/*
	 * liyang
	 */
	public ArrayList<CartDetail> getCartDetailsByCartid(int cartId) {
		
		ArrayList<CartDetail> cartDetails = new ArrayList<CartDetail>();
		CartDetail cartDetail = null;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "select Cartdetailid,Cartid, Productid,Num from cartdetail where Cartid =?";

		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, cartId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			while (rs.next()) {
				cartDetail = new CartDetail(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
				System.out.println(rs.getInt(3));
				cartDetails.add(cartDetail);
			}
		} catch (SQLException e) {
			System.err.println("查询Username、Password失败");
			e.printStackTrace();
		}
		
		return cartDetails;
	}
	
	/*
	 * liyang
	 */
	public ProductOfOrderdetail getOrderdetailByCartDetailId(int cartDetailId) {
		
		ProductOfOrderdetail productOfOrderdetail = null;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		ProductDao productDao = new ProductDao();
		
		int productId = 0;
		int num = 0;
		float price = 0;
		String productName = "";
		
		String sql = "select Productid,Num from cartdetail where Cartdetailid =?";

		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, cartDetailId);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			while (rs.next()) {
				productId = rs.getInt(1);
				num = rs.getInt(2);
			}
			price = productDao.getPriceByProductid(productId);
			productName = productDao.getProductNameByProductid(productId);
			productOfOrderdetail = new ProductOfOrderdetail(cartDetailId, productId, productName, price, num);
			
		} catch (SQLException e) {
			System.err.println("创建订单时获取商品列表失败");
			e.printStackTrace();
		}
		
		return productOfOrderdetail;
	}
	
	/*
	 * liyang
	 */
	public int getNumByCartDetailid(int cartDetailid) {
		
		int num = 0;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "select Num from cartdetail where Cartdetailid =?";

		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, cartDetailid);
			//执行查询
			ResultSet rs = pStatement.executeQuery();
			//取得查询结果
			while (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.err.println("查询num失败");
			e.printStackTrace();
		}
		
		return num;
	}
	
	/*
	 * liyang
	 */
	public boolean addNumOFCartDetailId(int cartDetailId) {
		
		boolean isSuccess = false;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "UPDATE cartdetail SET Num=Num+1 WHERE Cartdetailid=?";
		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, cartDetailId);
			//执行查询
			pStatement.executeUpdate();
			isSuccess = true;
		} catch (SQLException e) {
			System.err.println("购物车商品加1失败");
			e.printStackTrace();
		}

		return isSuccess;
	}
	
	/*
	 * liyang
	 */
	public boolean decNumOFCartDetailId(int cartDetailId) {
		
		boolean isSuccess = false;
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		int num = getNumByCartDetailid(cartDetailId);

		if(num==1) {
			isSuccess =false;
		}else {
			String sql = "update cartdetail set Num=Num-1 where Cartdetailid=?";
			try {
				pStatement = connection.prepareStatement(sql);
				pStatement.setInt(1, cartDetailId);
				//执行查询
				pStatement.executeUpdate();
				isSuccess = true;
			} catch (SQLException e) {
				System.err.println("购物车商品减1失败");
				e.printStackTrace();
			}
		}
		
		return isSuccess;
	}
	
	/*
	 * liyang
	 */
	public void deleteDetailByCartDetailId(int cartDetailId) {
		
		PreparedStatement pStatement = null;
		Connection connection = ConnectionFactory.getConnection();

		String sql = "delete from cartdetail where Cartdetailid=?";

		try {
			pStatement = connection.prepareStatement(sql);
			pStatement.setInt(1, cartDetailId);
			//执行查询
			pStatement.executeUpdate();
		} catch (SQLException e) {
			System.err.println("购物车删除一行商品失败");
			e.printStackTrace();
		}
		
	}
}
