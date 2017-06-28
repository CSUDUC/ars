/**
 * Jun 6, 2017
9:47:44 AM
lyf
 */
package lyf.test.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.alibaba.fastjson.JSONObject;

import lyf.test.entity.t6order;
import lyf.test.service.t6orderService;

/**
 * @author lyf
Jun 6, 2017
 *
 */
@Controller
@SessionAttributes({"UserName","PassWord","Id"})
public class download_controller {
	@Resource
	private t6orderService t6orderService;
	@ResponseBody  
	@RequestMapping("doinitDownload")
	public JSONObject doinitDownload(@ModelAttribute("Id") Integer id,ModelMap model) {  
        
        
        try {
        		List<t6order> orders = t6orderService.selectByUserId_Service(id);
        		
        		JSONObject jsonObject = new JSONObject();
        		ArrayList<ArrayList> data = new ArrayList<ArrayList>();
        		for(int i=0;i<orders.size();i++)
        		{
        			ArrayList<String> order = new ArrayList<String>();
        			order.add(String.valueOf(i+1));
        			order.add(orders.get(i).getOrdername().toString());
        			order.add("2017-06-02");
        			//order.add("button");
        			order.add(orders.get(i).getCodeid().toString());
        			data.add(order);
        		}
        		jsonObject.put("data", data);
        		return jsonObject;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
        
        return null;
         
    }
}
