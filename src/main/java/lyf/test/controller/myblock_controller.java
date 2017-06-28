/**
 * Jun 6, 2017
9:44:05 AM
lyf
 */
package lyf.test.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;
import lyf.test.entity.t6order;
import lyf.test.entity.t6orderKey;
import lyf.test.service.t1userService;
import lyf.test.service.t6orderService;

/**
 * @author lyf
Jun 6, 2017
 *
 */
@Controller
@SessionAttributes({"UserName","PassWord","Id"})
public class myblock_controller {
	@Resource
	private t1userService t1userservice;
	@Resource
	private t6orderService t6orderService;
	@ResponseBody  
	@RequestMapping("doinitmyblock")
	public List<t6order> initfieldsPage(@ModelAttribute("Id") Integer id,ModelMap model) {  
        
        
        try {
        		List<t6order> orders = t6orderService.selectByUserId_Service(id);
        		return orders;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
        
        return null;
         
    }
	@ResponseBody  
	@RequestMapping("doUpdateBlock")
	public t6order doUpdateBlock(@ModelAttribute("Id") Integer id,String codeid,String drawareaName,String cropKinds,ModelMap model) {  
        
        
        try {
        		t6order order= new t6order();
        		order.setUserid(id);
        		order.setCodeid(codeid);
        		order.setOrdername(drawareaName);
        		order.setCropkinds(cropKinds);
        		
        		t6orderService.updateByPrimaryKeySelective_Service(order);
        		
        		t6orderKey orderKey= new t6orderKey();
        		orderKey.setUserid(id);
        		orderKey.setCodeid(codeid);
        		t6order order1 = t6orderService.selectByPrimaryKey_Service(orderKey);
        		return order1;
        		
//        	System.out.println("id:"+id);
//        	System.out.println("codeid:"+codeid);
//        	System.out.println("drawareaName:"+drawareaName);
        //	return 1;
        		
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
        
        return null;
         
    }
	@ResponseBody  
	@RequestMapping("doDeleteBlock")
	public int doDeleteBlock(@ModelAttribute("UserName") String userName,@ModelAttribute("PassWord") String passWord,@ModelAttribute("Id") Integer id,String codeid,ModelMap model) {  
        
        
        try {
        	
	        	t6orderKey orderKey= new t6orderKey();
	    		orderKey.setUserid(id);
	    		orderKey.setCodeid(codeid);
        		
	    		t1userKey key = new t1userKey();
			key.setUsername(userName);
			key.setPaswd(passWord);
			t1user t1user = t1userservice.selectByUserNameAndPwd_Service(key);
			//System.out.println("locno:"+t1user.getLocno());
			String[] locnos = t1user.getLocno().split("/");
			//System.out.println("length:"+locnos.length);
			String new_locnos="";
			for(int i =0;i<locnos.length;i++)
			{
				if(!(locnos[i].equals(codeid)))
				{
					new_locnos = locnos[i]+"/";
				}
			}
			t1user.setLocno(new_locnos);
			
			t1userservice.updateByPrimaryKeySelective_Service(t1user);//更新用户表
        		return t6orderService.deleteByPrimaryKey_Service(orderKey);
        		
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
        
        return 0;
         
    }
}
