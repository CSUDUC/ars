/**
 * May 10, 2017
10:22:21 PM
lyf
 */
package lyf.test.serviceIml;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lyf.test.entity.t6order;
import lyf.test.entity.t6orderKey;
import lyf.test.mapper.t6orderMapper;
import lyf.test.service.t6orderService;

/**
 * @author lyf
May 10, 2017
 *
 */
@Service("t6orderService")
public class t6orderServiceImp implements t6orderService{
	@Resource t6orderMapper t6orderDao;
	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#deleteByPrimaryKey_Service(lyf.test.entity.t6orderKey)
	 */
	@Override
	public int deleteByPrimaryKey_Service(t6orderKey key) {
		// TODO Auto-generated method stub
		return t6orderDao.deleteByPrimaryKey(key);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#insert_Service(lyf.test.entity.t6order)
	 */
	@Override
	public int insert_Service(t6order record) {
		// TODO Auto-generated method stub
		return t6orderDao.insert(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#insertSelective_Service(lyf.test.entity.t6order)
	 */
	@Override
	public int insertSelective_Service(t6order record) {
		// TODO Auto-generated method stub
		return t6orderDao.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#selectByPrimaryKey_Service(lyf.test.entity.t6orderKey)
	 */
	@Override
	public t6order selectByPrimaryKey_Service(t6orderKey key) {
		// TODO Auto-generated method stub
		return t6orderDao.selectByPrimaryKey(key);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#updateByPrimaryKeySelective_Service(lyf.test.entity.t6order)
	 */
	@Override
	public int updateByPrimaryKeySelective_Service(t6order record) {
		// TODO Auto-generated method stub
		return t6orderDao.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#updateByPrimaryKey_Service(lyf.test.entity.t6order)
	 */
	@Override
	public int updateByPrimaryKey_Service(t6order record) {
		// TODO Auto-generated method stub
		return t6orderDao.updateByPrimaryKey(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t6orderService#selectByUserId_Service(int)
	 */
	@Override
	public List<t6order> selectByUserId_Service(int userid) {
		// TODO Auto-generated method stub
		return t6orderDao.selectByUserId(userid);
	}

	

}
