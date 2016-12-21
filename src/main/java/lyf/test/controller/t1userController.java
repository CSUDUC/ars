/**
 * Dec 21, 2016
10:32:22 AM
lyf
 */
package lyf.test.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lyf.test.entity.t1user;
import lyf.test.service.t1userService;

/**
 * @author lyf
Dec 21, 2016
 *
 */
@Controller
public class t1userController {
	@Resource
	private t1userService t1userservice;
	@RequestMapping("/login")
	public String toIndex(HttpServletRequest request,Model model){  
//      int Id = Integer.parseInt(request.getParameter("id")); 
//      
//      initfoldertreeKey key = new initfoldertreeKey();
//		key.setId(Id);
//		key.setKey("0");
//		
//      initfoldertree treeinfo = this.tree.getinitfoldertreeById(key);  
//      model.addAttribute("treeinfo", treeinfo);  
		
//		t1user user=new t1user();
//		user.setUsername("liuyunfei");
//		user.setPaswd("123");
//		t1userservice.insertSelective_Service(user);
		
		return "login";  
  } 
}
