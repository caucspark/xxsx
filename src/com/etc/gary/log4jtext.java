package com.etc.gary;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class log4jtext {
	  public static void main(String[] args) {
	        
	        Logger logger = Logger.getLogger(log4jtext.class);
	        
	        //使用默认的配置信息，不需要写log4j.properties
	        BasicConfigurator.configure();
	        //设置日志输出级别为info，这将覆盖配置文件中设置的级别
	        logger.setLevel(Level.INFO);
	        //下面的消息将被输出
	        logger.info("this is an info 这是一个错误");
	        logger.warn("this is a warn");
	        logger.error("this is an error");
	        logger.fatal("this is a fatal");

	    }
}
