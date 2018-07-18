package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.spark.bean.Order;
import com.spark.bean.Orderdetail;
import com.spark.util.ConnectionFactory;

public class OrderDetailDao {
	
	public boolean setOrderDetail(Orderdetail orderdetail) {
		
		boolean isSuccess = false;
		
		PreparedStatement preparedStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "insert into orderdetail (Orderid,Productid,Num) values (?,?,?)";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, orderdetail.getOrderId());
			preparedStatement.setInt(2, orderdetail.getProductId());
			preparedStatement.setInt(3, orderdetail.getNum());
			
			preparedStatement.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e) {
			System.err.println("插入订单失败");
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
}
