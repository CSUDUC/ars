/**
 * Dec 21, 2016
9:26:20 AM
lyf
 */
package lyf.test.service;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;

/**
 * @author lyf
Dec 21, 2016
 *
 */
public interface t1userService {
	public int deleteByPrimaryKey_Service(t1userKey key);
	public int insertSelective_Service(t1user record);
	public int updateByPrimaryKeySelective_Service(t1user record);
	public t1user selectByPrimaryKey_Service(t1userKey key);
	public t1user selectByKey_Service(t1userKey key);
}
