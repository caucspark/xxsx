package com.spark.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.spark.bean.Order;
import com.spark.util.ConnectionFactory;

public class OrderDao {
	
	public boolean setOrder(Order order) {
		
		boolean isSuccess = false;
		
		PreparedStatement preparedStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "insert into orderall (Userid,Ordersettime,Receivename,Readdress,Phone,Orderstate,Note) values (?,?,?,?,?,?,?)";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, order.getUserId());
			preparedStatement.setString(2, order.getOrderSetTime());
			preparedStatement.setString(3, order.getReName());
			preparedStatement.setString(4, order.getReAddress());
			preparedStatement.setString(5, order.getPhone());
			preparedStatement.setString(6, order.getOrderState());
			preparedStatement.setString(7, order.getNote());
			
			preparedStatement.executeUpdate();
			isSuccess = true;
			
		} catch (SQLException e) {
			System.err.println("插入订单失败");
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	public int getOrderId(Order order) {
		int orderId = 0;
		
		PreparedStatement preparedStatement = null;
		Connection connection = ConnectionFactory.getConnection();
		
		String sql = "SELECT Orderid FROM orderall WHERE Userid=? AND Ordersettime=? AND Receivename=? AND Readdress=?";
		
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, 1);
			preparedStatement.setString(2, order.getOrderSetTime());
			preparedStatement.setString(3, order.getReName());
			preparedStatement.setString(4, order.getReAddress());
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				orderId = resultSet.getInt(1);
			}
			
		} catch (SQLException e) {
			System.err.println("获取订单Id失败");
			e.printStackTrace();
		}
		
		return orderId;
	}
}
