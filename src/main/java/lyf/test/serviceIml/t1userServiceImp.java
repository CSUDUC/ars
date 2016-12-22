/**
 * Dec 21, 2016
9:28:59 AM
lyf
 */
package lyf.test.serviceIml;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;
import lyf.test.mapper.t1userMapper;
import lyf.test.service.t1userService;

/**
 * @author lyf
Dec 21, 2016
 *
 */
@Service("t1userService")
public class t1userServiceImp implements t1userService{
	@Resource t1userMapper t1userDao;
	/* (non-Javadoc)
	 * @see lyf.test.service.t1userService#deleteByPrimaryKey_Service(lyf.test.entity.t1userKey)
	 */
	@Override
	public int deleteByPrimaryKey_Service(t1userKey key) {
		// TODO Auto-generated method stub
		return t1userDao.deleteByPrimaryKey(key);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t1userService#insertSelective_Service(lyf.test.entity.t1user)
	 */
	@Override
	public int insertSelective_Service(t1user record) {
		// TODO Auto-generated method stub
		return t1userDao.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t1userService#updateByPrimaryKeySelective_Service(lyf.test.entity.t1user)
	 */
	@Override
	public int updateByPrimaryKeySelective_Service(t1user record) {
		// TODO Auto-generated method stub
		return t1userDao.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t1userService#selectByPrimaryKey_Service(lyf.test.entity.t1userKey)
	 */
	@Override
	public t1user selectByPrimaryKey_Service(t1userKey key) {
		// TODO Auto-generated method stub
		return t1userDao.selectByPrimaryKey(key);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t1userService#selectByKey_Service(lyf.test.entity.t1userKey)
	 */
	@Override
	public t1user selectByKey_Service(t1userKey key) {
		// TODO Auto-generated method stub
		return t1userDao.selectByKey(key);
	}
	
}
