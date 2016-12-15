/**
 * Nov 25, 2016
2:01:16 PM
lyf
 */
package lyf.test.serviceIml;

import lyf.test.entity.initfoldertree;
import lyf.test.entity.initfoldertreeKey;
import lyf.test.mapper.initfoldertreeMapper;
import lyf.test.service.IInitfoldertree;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * @author lyf
Nov 25, 2016
 *
 */
@Service("userService")  
public class initserviceiml implements IInitfoldertree{
	@Resource  
	private initfoldertreeMapper initfoldertreeDao;
	/* (non-Javadoc)
	 * @see lyf.test.service.IInitfoldertree#getinitfoldertreeById(lyf.test.entity.initfoldertreeKey)
	 */
	@Override
	public initfoldertree getinitfoldertreeById(initfoldertreeKey key) {
		// TODO Auto-generated method stub
		return this.initfoldertreeDao.selectByPrimaryKey(key);
	}
	
	
}
