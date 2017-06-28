/**
 * Jun 6, 2017
9:50:46 AM
lyf
 */
package lyf.test.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

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
public class account_controller {
	private static Logger logger = Logger.getLogger(account_controller.class);
	//public static String m_SavePath = "/Users/lyf/Downloads";
	public static String m_SavePath = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/upload/image";
	//public static String serviceIP = "http://10.2.3.222:8080/";
	public static String serviceIP = Params.serviceIP;
	@Resource
	private t1userService t1userservice;
	@ResponseBody  
	@RequestMapping("doinitaccount")
	public JSONObject initaccountPage(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,ModelMap model) {  
        
        try {
	        	t1userKey key = new t1userKey();
	    		key.setUsername(userName);
	    		key.setPaswd(passWord);
	    		t1user user = t1userservice.selectByUserNameAndPwd_Service(key);
	    		
	    		JSONObject jsonObject = new JSONObject();
	    		jsonObject.put("producttype", user.getProducttype());
	    		
	    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
	    		String servstarttime=sdf.format(user.getServstarttime());
	    		String servendtime=sdf.format(user.getServendtime());
	    		jsonObject.put("servstarttime", servstarttime);
	    		jsonObject.put("servendtime", servendtime);
	        return jsonObject;   
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		
        return null;
         
    }
	@ResponseBody
	@RequestMapping("/doModifyServiceInfo")
	public JSONObject doModifyServiceInfo(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String producttypeStr,String servicebegintime,String serviceendtime,ModelMap model)
	{
		t1user user = new t1user();
		user.setUsername(userName);
		user.setPaswd(passWord);
		user.setId(id);
		user.setProducttype(producttypeStr);
		
		try  
		{  
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date_start= sdf.parse(servicebegintime);  
		    user.setServstarttime(date_start);
			Date date_end= sdf.parse(serviceendtime); 
			user.setServendtime(date_end);
			//更新数据库
			t1userservice.updateByPrimaryKeySelective_Service(user);
			
			//返回前端
			JSONObject jsonObject = new JSONObject();
	    		jsonObject.put("producttype", user.getProducttype());
	    		String servstarttime=sdf.format(user.getServstarttime());
	    		String servendtime=sdf.format(user.getServendtime());
	    		jsonObject.put("servstarttime", servstarttime);
	    		jsonObject.put("servendtime", servendtime);
	        return jsonObject;   
			
		}  
		catch (ParseException e)  
		{  
		    System.out.println(e.getMessage());  
		}  
		return null;
	}
	/**  
     * 文件上传功能  
     * @param file  
     * @return  
     * @throws IOException   
     */  
	@ResponseBody 
    @RequestMapping("/accountPicUpload")  
    public String accountPicUpload(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,MultipartFile file,HttpServletRequest request) throws IOException{  
        //String path = request.getSession().getServletContext().getRealPath("upload");  
		 
		//String path = "/Users/lyf/Downloads/image";
		//String fileName = file.getOriginalFilename();  
		String fileName = "urlphoto.png";
        File dir = new File(m_SavePath +"/"+id,fileName);          
        if(!dir.exists()){  
            dir.mkdirs();  
        }
        System.out.println(m_SavePath); 
        System.out.println(fileName); 
        //MultipartFile自带的解析方法  
        file.transferTo(dir);
        //更新数据库 保存头像地址
        t1user user = new t1user();
		user.setUsername(userName);
		user.setPaswd(passWord);
		user.setId(id);
		
		String DrawPicUrl = serviceIP + "upload/image/" + id + "/" + fileName;
		user.setUrlphoto(DrawPicUrl);
		t1userservice.updateByPrimaryKeySelective_Service(user);
		//将头像地址写入session 实现页面共享
		HttpSession session=request.getSession();
		session.setAttribute("urlphoto", DrawPicUrl);
		
        return DrawPicUrl;
    } 
	@ResponseBody
	@RequestMapping("doModifyPwd")
	public int doModifyPwd(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String oldpwd,String newpwd,ModelMap model)
	{
		String oldPwd=MD5Util.getMD5String(oldpwd);
		if (passWord.equals(oldPwd)) {//输入的旧密码和原始密码相同
			
			t1userKey userKey= new t1userKey();
			userKey.setUsername(userName);
			userKey.setPaswd(passWord);
			
			
			t1user user=t1userservice.selectByUserNameAndPwd_Service(userKey);
			if (user!=null) {
				String newPwd=MD5Util.getMD5String(newpwd);
				user.setPaswd(newPwd);
				t1userservice.updateByUserIDSelective_Service(user);
				model.addAttribute("PassWord", newPwd);
				logger.info(JSON.toJSONString(user));
				return 1;
			}
		}
		
		return 0;
	}
}
