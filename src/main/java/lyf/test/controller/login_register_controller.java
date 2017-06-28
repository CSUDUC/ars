/**
 * Jun 6, 2017
8:55:27 AM
lyf
 */
package lyf.test.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
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
Jun 6, 2017
 *
 */
@Controller
@SessionAttributes({"UserName","PassWord","Id"})
public class login_register_controller {
	private static Logger logger = Logger.getLogger(controller.class); 
	//public static String serviceIP = "http://10.2.3.222:8080/";
	@Resource
	private t1userService t1userservice;
	@RequestMapping("/Dologin")
	public String Dologin(HttpServletRequest request,ModelMap model){
		//return "TRSQJC";
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		logger.info(username+","+pwd);
		if (username==null&&pwd==null) {
			return "redirect:login";
		}
		else{
			t1userKey key = new t1userKey();
			key.setUsername(username);
			
			String pwd_md5=MD5Util.getMD5String(pwd);
			key.setPaswd(pwd_md5);
			t1user t1user = t1userservice.selectByUserNameAndPwd_Service(key);
			logger.info(JSON.toJSONString(t1user)); 
			if (t1user != null) {
				model.addAttribute("UserName", username);
				model.addAttribute("PassWord", pwd_md5);
				model.addAttribute("Id", t1user.getId());
				
				HttpSession session=request.getSession();
				session.setAttribute("UserName", username);
				session.setAttribute("urlphoto", t1user.getUrlphoto());
				return "redirect:index";  
				//return "index"; 
			}
			else{
				return "redirect:login";
			}
		}
	} 
	@ResponseBody
	@RequestMapping("/doRegister")
	public t1user doRegister(String username,String pwd,String producttypeStr,String servicebegintime,String serviceendtime,HttpServletRequest request,ModelMap model)
	{
		t1user user = new t1user();
		user.setUsername(username);
		
		String pwd_md5=MD5Util.getMD5String(pwd);
		user.setPaswd(pwd_md5);
		user.setProducttype(producttypeStr);
		//设置默认头像
		String urlphoto=Params.serviceIP+"ars/imgs/urlphoto.jpg";
		user.setUrlphoto(urlphoto);
		
		try  
		{  
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date_start= sdf.parse(servicebegintime);  
		    
			user.setServstarttime(date_start);
			
			Date date_end= sdf.parse(serviceendtime); 
			user.setServendtime(date_end);
			
			
		}  
		catch (ParseException e)  
		{  
		    System.out.println(e.getMessage());  
		}  
		if((t1userservice.insertSelective_Service(user))>0)
		{
			t1userKey key = new t1userKey();
			key.setUsername(username);
			key.setPaswd(pwd_md5);
			
			t1user user1 = t1userservice.selectByUserNameAndPwd_Service(key);
			
			model.addAttribute("UserName", username);
			model.addAttribute("PassWord", pwd_md5);
			model.addAttribute("Id", user1.getId());
			
			HttpSession session=request.getSession();
			session.setAttribute("UserName", username);
			session.setAttribute("urlphoto", urlphoto);
			//logger.info(JSON.toJSONString(user1)); 
			
			return user1;  
		}
		else{
			return null;
		}
	}
}
