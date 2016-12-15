/**
 * Nov 25, 2016
5:09:21 PM
lyf
 */
package lyf.test.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lyf.test.entity.initfoldertree;
import lyf.test.entity.initfoldertreeKey;
import lyf.test.service.IInitfoldertree;

/**
 * @author lyf
Nov 25, 2016
 *
 */
@Controller
//@RequestMapping("/tree")
public class initfoldertreecontroller {
	@Resource
	private IInitfoldertree tree;
	 
    @RequestMapping("/showinfo")  
    public String toIndex(HttpServletRequest request,Model model){  
//        int Id = Integer.parseInt(request.getParameter("id")); 
//        
//        initfoldertreeKey key = new initfoldertreeKey();
//		key.setId(Id);
//		key.setKey("0");
//		
//        initfoldertree treeinfo = this.tree.getinitfoldertreeById(key);  
//        model.addAttribute("treeinfo", treeinfo);  
        return "showinfo";  
    } 
    @RequestMapping("/TRSQJC")  
    public String showTRSQJC(HttpServletRequest request,Model model){  
    		return "TRSQJC";  
    }
    @RequestMapping("/NZWJXFL")  
    public String showNZWJXFL(HttpServletRequest request,Model model){  
    		return "NZWJXFL";  
    }  
    @RequestMapping("/YMJZSJC")  
    public String showYMJZSJC(HttpServletRequest request,Model model){  
    		return "YMJZSJC";  
    }
    @RequestMapping("/NYBCHJC")  
    public String showNYBCHJC(HttpServletRequest request,Model model){  
    		return "NYBCHJC";  
    }
    @RequestMapping("/NZWZSJC_GC")  
    public String showNZWZSJC_GC(HttpServletRequest request,Model model){  
    		return "NZWZSJC_GC";  
    }
}
