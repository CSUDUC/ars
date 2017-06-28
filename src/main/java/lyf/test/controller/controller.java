/**
 * May 18, 2017
2:29:40 PM
lyf
 */
package lyf.test.controller;

import java.nio.channels.SeekableByteChannel;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSON;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;
import lyf.test.service.t1userService;

/**
 * @author lyf
May 18, 2017
 *
 */
@Controller
@SessionAttributes({"UserName","PassWord","Id"})   
public class controller {
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
	@RequestMapping("/index")
	public String toindex(HttpServletRequest request,Model model){  

		return "index";  
	}
	@RequestMapping("/myblock")
	public String tomyblock(HttpServletRequest request,Model model){  

		return "myblock";  
	}
	@RequestMapping("/download")
	public String todownload(HttpServletRequest request,Model model){  

		return "download";  
	} 
	@RequestMapping("/account")
	public String toaccount(HttpServletRequest request,Model model){  

		return "account";  
	}
	@RequestMapping("/test")
	public String totest(HttpServletRequest request,Model model){  

		return "test";  
	}
	
}
