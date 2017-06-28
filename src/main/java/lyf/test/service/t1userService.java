/**
 * Dec 21, 2016
9:26:20 AM
lyf
 */
package lyf.test.service;

import java.util.List;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;
import lyf.test.entity.t6order;

/**
 * @author lyf
Dec 21, 2016
 *
 */
public interface t1userService {
	
	public int deleteByPrimaryKey_Service(t1userKey key);

    public int insert_Service(t1user record);

    public int insertSelective_Service(t1user record);

    public t1user selectByPrimaryKey_Service(t1userKey key);
    
    public t1user selectByUserNameAndPwd_Service(t1userKey key);

    public int updateByPrimaryKeySelective_Service(t1user record);
    
    public int updateByUserIDSelective_Service(t1user record);

    public int updateByPrimaryKey_Service(t1user record);
    
    
}
