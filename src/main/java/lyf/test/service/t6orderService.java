/**
 * May 10, 2017
10:19:50 PM
lyf
 */
package lyf.test.service;

import java.util.List;

import lyf.test.entity.t6order;
import lyf.test.entity.t6orderKey;

/**
 * @author lyf
May 10, 2017
 *
 */
public interface t6orderService {
	int deleteByPrimaryKey_Service(t6orderKey key);

    int insert_Service(t6order record);

    int insertSelective_Service(t6order record);

    t6order selectByPrimaryKey_Service(t6orderKey key);

    int updateByPrimaryKeySelective_Service(t6order record);

    int updateByPrimaryKey_Service(t6order record);
    
    public List<t6order> selectByUserId_Service(int userid);
}
