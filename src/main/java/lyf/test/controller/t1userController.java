/**
 * Dec 21, 2016
10:32:22 AM
lyf
 */
package lyf.test.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;
import lyf.test.service.t1userService;


/**
 * @author lyf
Dec 21, 2016
 *
 */
@Controller
public class t1userController {
	private static Logger logger = Logger.getLogger(t1userController.class); 
	@Resource
	private t1userService t1userservice;
	@RequestMapping("/login")
	public String tologin(HttpServletRequest request,Model model){  
//      int Id = Integer.parseInt(request.getParameter("id")); 
//      
//      initfoldertreeKey key = new initfoldertreeKey();
//		key.setId(Id);
//		key.setKey("0");
//		
//      initfoldertree treeinfo = this.tree.getinitfoldertreeById(key);  
//      model.addAttribute("treeinfo", treeinfo);  
		
//		t1user user=new t1user();
//		user.setUsername("liuyunfei11");
//		user.setPaswd("123");
//		int s = t1userservice.insertSelective_Service(user);
//		logger.info(JSON.toJSONString(user)); 
		return "login";  
  } 
	@RequestMapping("/TRSQJC")
	public String toTRSQJC(HttpServletRequest request,Model model){  
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		//logger.info(username+","+pwd);
		if (username==null&&pwd==null) {
			return "login";
		}
		else{
			t1userKey key = new t1userKey();
			key.setUsername(username);
			key.setPaswd(pwd);
			t1user t1user = t1userservice.selectByKey_Service(key);
			//logger.info(JSON.toJSONString(t1user)); 
			if (t1user != null) {
				return "TRSQJC"; 
			}
			else{
				return "login";
			}
		}
		
		 
  } 
}
