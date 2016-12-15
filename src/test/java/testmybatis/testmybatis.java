/**
 * Nov 25, 2016
2:36:30 PM
lyf
 */
package testmybatis;
import javax.annotation.Resource;  

import org.apache.log4j.Logger;  
import org.junit.Before;  
import org.junit.Test;  
import org.junit.runner.RunWith; 
import org.springframework.context.ApplicationContext;  
import org.springframework.context.support.ClassPathXmlApplicationContext;  
import org.springframework.test.context.ContextConfiguration;  
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;  

import com.alibaba.fastjson.JSON;  
import lyf.test.entity.initfoldertreeKey;
import lyf.test.entity.initfoldertree;
import lyf.test.service.IInitfoldertree;
 

/**
 * @author lyf
Nov 25, 2016
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
public class testmybatis {
	private static Logger logger = Logger.getLogger(testmybatis.class); 
	private ApplicationContext ac = null;
	@Resource  
    private IInitfoldertree userService; 
//  @Before  
//  public void before() {  
//      ac = new ClassPathXmlApplicationContext("applicationContext.xml");  
//      userService = (IUserService) ac.getBean("userService");  
//  }  
  
    @Test  
    public void test1() {  
    		initfoldertreeKey key = new initfoldertreeKey();
    		key.setId(149);
    		key.setKey("0");
    		initfoldertree user = userService.getinitfoldertreeById(key);  
        // System.out.println(user.getUserName());  
        // logger.info("值："+user.getUserName());  
        logger.info(JSON.toJSONString(user));  
    }  
}
