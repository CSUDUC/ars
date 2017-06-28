/**
 * May 10, 2017
2:20:25 PM
lyf
 */
package lyf.test.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.json.JsonObject;
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
import lyf.test.entity.t5citys;
import lyf.test.entity.t6order;
import lyf.test.entity.t6orderKey;
import lyf.test.service.t1userService;
import lyf.test.service.t5citysService;
import lyf.test.service.t6orderService;

/**
 * @author lyf
May 10, 2017
 *
 */
@Controller
@SessionAttributes({"UserName","PassWord","Id"})
public class doAjax {
	private static Logger logger = Logger.getLogger(doAjax.class);
	@Resource
	private t1userService t1userservice;
	@Resource
	private t5citysService t5citysService;
	@Resource
	private t6orderService t6orderService;
	//public static String m_SavePath = "/Users/lyf/Downloads";
	public static String m_SavePath = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/upload/image";
	public static String serviceIP = "http://10.2.3.222:8080/";
//	@ResponseBody  
//	@RequestMapping("doDrawSave")
//	public int doDrawSave(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String resultPicUrl,String drawareaName,String cropKinds,String GraphicOfDrawStr,ModelMap model) {  
//        System.out.println("UserName:"+userName);   //modelMap中的Save将自动绑定在save上 
//        System.out.println("resultPicUrl:"+resultPicUrl);
//        System.out.println("drawareaName:"+drawareaName);
//        System.out.println("cropKinds:"+cropKinds);
//        System.out.println("GraphicOfDrawStr:"+GraphicOfDrawStr);
//        try {
//        	String mCodeIdOfArea="";
//        	if(GraphicOfDrawStr.length()==6)//通过行政区域选择产生的地块
//        	{
//        		mCodeIdOfArea = GraphicOfDrawStr;
//        		t6orderKey orderKey = new t6orderKey();
//        		orderKey.setCodeid(mCodeIdOfArea);
//        		orderKey.setUserid(id);
//        		if(t6orderService.selectByPrimaryKey_Service(orderKey)!=null)//已经存在
//        		{
//        			return 0;
//        		}
//        		
//        	}
//        	else{//通过画图产生地块
//        		mCodeIdOfArea = "10"+ (int)((Math.random()*9+1)*1000);
//        	}
//        //String mCodeIdOfArea="10"+ (int)((Math.random()*9+1)*1000);
//        //获取当前系统时间
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
//        Date curDate =new Date(System.currentTimeMillis());
//        String DateStr = formatter.format(curDate);
//        String DrawPicName = DateStr+"_"+mCodeIdOfArea+".png";//图片名称
//        	download(resultPicUrl, DrawPicName,m_SavePath,id);
//        	//更新t1user-添加订购区域
//        	t1userKey userkey = new t1userKey();
//        	userkey.setUsername(userName);
//        	userkey.setPaswd(passWord);
//        	userkey.setId(id);
//		UpdateUserTable(userkey,mCodeIdOfArea);
//        	//更新t6order表-添加订购区域详细信息
//        	t6order order  = new t6order();
//        	order.setUserid(id);
//        	order.setCodeid(mCodeIdOfArea);
//        	String DrawPicUrl = serviceIP + "upload/image/" + id + "/" + DrawPicName;
//        	order.setSdpath(DrawPicUrl);
//        	order.setGeometry(GraphicOfDrawStr);
//        	order.setOrdername(drawareaName);
//        	order.setCropkinds(cropKinds);
//        	UpdateOrderTable(order);
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//        
//        return 1;
//        //return "login";  
//    }
//	public void UpdateUserTable(t1userKey userkey,String newCodeStr) throws Exception {
//		t1user user = t1userservice.selectByPrimaryKey_Service(userkey);
//		if (user.getLocno()!=null) {
//			user.setLocno(user.getLocno()+newCodeStr+"/");
//		}
//		else{
//			user.setLocno(newCodeStr+"/");
//		}
//		t1userservice.updateByPrimaryKeySelective_Service(user);
//		
//	}
//	public void UpdateOrderTable(t6order order) throws Exception {
//		t6orderService.insert_Service(order);
//	}
//	public static void download(String urlString, String filename,String savePath,int id) throws Exception {  
//		String encoded = URLEncoder.encode(urlString, "UTF-8");
//		// 构造URL  
//        URL url = new URL(urlString);  
//        // 打开连接  
//        URLConnection con = url.openConnection();  
//        //设置请求超时为5s  
//        con.setConnectTimeout(5*1000);  
//        // 输入流  
//        InputStream is = con.getInputStream();  
//      
//        // 1K的数据缓冲  
//        byte[] bs = new byte[1024];  
//        // 读取到的数据长度  
//        int len;  
//        // 输出的文件流  
//       File sf=new File(savePath+"/"+id);  
//       if(!sf.exists()){  
//           sf.mkdirs();  
//       }  
//       OutputStream os = new FileOutputStream(sf.getPath()+"/"+filename);  
//        // 开始读取  
//        while ((len = is.read(bs)) != -1) {  
//          os.write(bs, 0, len);  
//        }  
//        // 完毕，关闭所有链接  
//        os.close();  
//        is.close();  
//    }
//	@ResponseBody  
//	@RequestMapping("doinitmyblock")
//	public List<t6order> initfieldsPage(@ModelAttribute("Id") Integer id,ModelMap model) {  
//        
//        
//        try {
//        		List<t6order> orders = t6orderService.selectByUserId_Service(id);
//        		return orders;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//        
//        return null;
//         
//    }
//	@ResponseBody  
//	@RequestMapping("doinitaccount")
//	public JSONObject initaccountPage(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,ModelMap model) {  
//        
//        try {
//	        	t1userKey key = new t1userKey();
//	    		key.setUsername(userName);
//	    		key.setPaswd(passWord);
//	    		t1user user = t1userservice.selectByUserNameAndPwd_Service(key);
//	    		
//	    		JSONObject jsonObject = new JSONObject();
//	    		jsonObject.put("producttype", user.getProducttype());
//	    		
//	    		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
//	    		String servstarttime=sdf.format(user.getServstarttime());
//	    		String servendtime=sdf.format(user.getServendtime());
//	    		jsonObject.put("servstarttime", servstarttime);
//	    		jsonObject.put("servendtime", servendtime);
//	        return jsonObject;   
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//		
//        return null;
//         
//    }
//	@ResponseBody  
//	@RequestMapping("doinitindex")//跳转进入
//	public JSONObject doinitindex(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String codeid,ModelMap model) {  
//        
//        
//        try {
//        		JSONObject jsonObject = new JSONObject();
//        		
//        		t6orderKey orderKey= new t6orderKey();
//        		orderKey.setUserid(id);
//        		orderKey.setCodeid(codeid);
//        		t6order order = t6orderService.selectByPrimaryKey_Service(orderKey);
//        		
//        		jsonObject.put("order", order);
//        		
//        		t1userKey key = new t1userKey();
//    			key.setUsername(userName);
//    			key.setPaswd(passWord);
//    			t1user t1user = t1userservice.selectByUserNameAndPwd_Service(key);
//    			
//    			jsonObject.put("user", t1user);
//    			
//        		return jsonObject;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//        
//        return null;
//         
//    }
//	@ResponseBody  
//	@RequestMapping("doUpdateBlock")
//	public t6order doUpdateBlock(@ModelAttribute("Id") Integer id,String codeid,String drawareaName,String cropKinds,ModelMap model) {  
//        
//        
//        try {
//        		t6order order= new t6order();
//        		order.setUserid(id);
//        		order.setCodeid(codeid);
//        		order.setOrdername(drawareaName);
//        		order.setCropkinds(cropKinds);
//        		
//        		t6orderService.updateByPrimaryKeySelective_Service(order);
//        		
//        		t6orderKey orderKey= new t6orderKey();
//        		orderKey.setUserid(id);
//        		orderKey.setCodeid(codeid);
//        		t6order order1 = t6orderService.selectByPrimaryKey_Service(orderKey);
//        		return order1;
//        		
////        	System.out.println("id:"+id);
////        	System.out.println("codeid:"+codeid);
////        	System.out.println("drawareaName:"+drawareaName);
//        //	return 1;
//        		
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//        
//        return null;
//         
//    }
//	@ResponseBody  
//	@RequestMapping("doDeleteBlock")
//	public int doDeleteBlock(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String codeid,ModelMap model) {  
//        
//        
//        try {
//        	
//	        	t6orderKey orderKey= new t6orderKey();
//	    		orderKey.setUserid(id);
//	    		orderKey.setCodeid(codeid);
//        		
//	    		t1userKey key = new t1userKey();
//			key.setUsername(userName);
//			key.setPaswd(passWord);
//			t1user t1user = t1userservice.selectByUserNameAndPwd_Service(key);
//			//System.out.println("locno:"+t1user.getLocno());
//			String[] locnos = t1user.getLocno().split("/");
//			//System.out.println("length:"+locnos.length);
//			String new_locnos="";
//			for(int i =0;i<locnos.length;i++)
//			{
//				if(!(locnos[i].equals(codeid)))
//				{
//					new_locnos = locnos[i]+"/";
//				}
//			}
//			t1user.setLocno(new_locnos);
//			
//			t1userservice.updateByPrimaryKeySelective_Service(t1user);//更新用户表
//        		return t6orderService.deleteByPrimaryKey_Service(orderKey);
//        		
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//        
//        return 0;
//         
//    }
//	@ResponseBody  
//	@RequestMapping("doProcessRegion")
//	public String doProcessRegion(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String region,ModelMap model) {  
//        
//        String[] regions = region.split("-");
//        //System.out.println(JSON.toJSONString(regions));
//        String city1=regions[0];//省
//        String city2=regions[1];//市
//        String city3=regions[2];//县
//        
//        t5citys ciT5citys=new t5citys();
//        ciT5citys.setCity1(city1);
//        ciT5citys.setCity2(city2);
//        
//        
//        t5citys cityinfo=t5citysService.selectByShengShi(ciT5citys);
//        String codeid = cityinfo.getCodeid();//根据省市获取行政代码
//        String ShengShiCode = codeid.substring(0, 4);
//        
//        t5citys city = new t5citys();
//        city.setCodeid(ShengShiCode+"%");
//        city.setCity3(city3);
//        t5citys cityinfo1=t5citysService.selectByShengShiCodeAndXian(city);
//        
//        System.out.println(JSON.toJSONString(cityinfo1));
//        return cityinfo1.getCodeid();
//         
//    }
//	@ResponseBody
//	@RequestMapping("/doModifyServiceInfo")
//	public JSONObject doModifyServiceInfo(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String producttypeStr,String servicebegintime,String serviceendtime,ModelMap model)
//	{
//		t1user user = new t1user();
//		user.setUsername(userName);
//		user.setPaswd(passWord);
//		user.setId(id);
//		user.setProducttype(producttypeStr);
//		
//		try  
//		{  
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
//		    Date date_start= sdf.parse(servicebegintime);  
//		    user.setServstarttime(date_start);
//			Date date_end= sdf.parse(serviceendtime); 
//			user.setServendtime(date_end);
//			//更新数据库
//			t1userservice.updateByPrimaryKeySelective_Service(user);
//			
//			//返回前端
//			JSONObject jsonObject = new JSONObject();
//	    		jsonObject.put("producttype", user.getProducttype());
//	    		String servstarttime=sdf.format(user.getServstarttime());
//	    		String servendtime=sdf.format(user.getServendtime());
//	    		jsonObject.put("servstarttime", servstarttime);
//	    		jsonObject.put("servendtime", servendtime);
//	        return jsonObject;   
//			
//		}  
//		catch (ParseException e)  
//		{  
//		    System.out.println(e.getMessage());  
//		}  
//		return null;
//	}
//	/**  
//     * 文件上传功能  
//     * @param file  
//     * @return  
//     * @throws IOException   
//     */  
//	@ResponseBody 
//    @RequestMapping("/accountPicUpload")  
//    public String accountPicUpload(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,MultipartFile file,HttpServletRequest request) throws IOException{  
//        //String path = request.getSession().getServletContext().getRealPath("upload");  
//		 
//		//String path = "/Users/lyf/Downloads/image";
//		//String fileName = file.getOriginalFilename();  
//		String fileName = "urlphoto.png";
//        File dir = new File(m_SavePath +"/"+id,fileName);          
//        if(!dir.exists()){  
//            dir.mkdirs();  
//        }
//        System.out.println(m_SavePath); 
//        System.out.println(fileName); 
//        //MultipartFile自带的解析方法  
//        file.transferTo(dir);
//        //更新数据库 保存头像地址
//        t1user user = new t1user();
//		user.setUsername(userName);
//		user.setPaswd(passWord);
//		user.setId(id);
//		
//		String DrawPicUrl = serviceIP + "upload/image/" + id + "/" + fileName;
//		user.setUrlphoto(DrawPicUrl);
//		t1userservice.updateByPrimaryKeySelective_Service(user);
//		//将头像地址写入session 实现页面共享
//		HttpSession session=request.getSession();
//		session.setAttribute("urlphoto", DrawPicUrl);
//		
//        return DrawPicUrl;
//    }  
//	@ResponseBody  
//	@RequestMapping("doinitDownload")
//	public JSONObject doinitDownload(@ModelAttribute("Id") Integer id,ModelMap model) {  
//        
//        
//        try {
//        		List<t6order> orders = t6orderService.selectByUserId_Service(id);
//        		
//        		JSONObject jsonObject = new JSONObject();
//        		ArrayList<ArrayList> data = new ArrayList<ArrayList>();
//        		for(int i=0;i<orders.size();i++)
//        		{
//        			ArrayList<String> order = new ArrayList<String>();
//        			order.add(String.valueOf(i+1));
//        			order.add(orders.get(i).getOrdername().toString());
//        			order.add("2017-06-02");
//        			//order.add("button");
//        			order.add(orders.get(i).getCodeid().toString());
//        			data.add(order);
//        		}
//        		jsonObject.put("data", data);
//        		return jsonObject;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.out.println(e.getMessage());
//		}
//        
//        return null;
//         
//    }
//	@ResponseBody
//	@RequestMapping("doModifyPwd")
//	public int doModifyPwd(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String oldpwd,String newpwd,ModelMap model)
//	{
//		String oldPwd=MD5Util.getMD5String(oldpwd);
//		if (passWord.equals(oldPwd)) {//输入的旧密码和原始密码相同
//			
//			t1userKey userKey= new t1userKey();
//			userKey.setUsername(userName);
//			userKey.setPaswd(passWord);
//			
//			
//			t1user user=t1userservice.selectByUserNameAndPwd_Service(userKey);
//			if (user!=null) {
//				String newPwd=MD5Util.getMD5String(newpwd);
//				user.setPaswd(newPwd);
//				t1userservice.updateByUserIDSelective_Service(user);
//				model.addAttribute("PassWord", newPwd);
//				logger.info(JSON.toJSONString(user));
//				return 1;
//			}
//		}
//		
//		return 0;
//	}
}
