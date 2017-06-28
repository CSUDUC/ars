/**
 * May 27, 2017
2:57:04 PM
lyf
 */
package lyf.test.serviceIml;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lyf.test.entity.t5citys;
import lyf.test.mapper.t5citysMapper;
import lyf.test.service.t5citysService;

/**
 * @author lyf
May 27, 2017
 *
 */
@Service("t5citysService")
public class t5citysServiceImp implements t5citysService{
	@Resource t5citysMapper t5citysdao;
	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#deleteByPrimaryKey(java.lang.String)
	 */
	@Override
	public int deleteByPrimaryKey(String codeid) {
		// TODO Auto-generated method stub
		return t5citysdao.deleteByPrimaryKey(codeid);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#insert(lyf.test.entity.t5citys)
	 */
	@Override
	public int insert(t5citys record) {
		// TODO Auto-generated method stub
		return t5citysdao.insert(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#insertSelective(lyf.test.entity.t5citys)
	 */
	@Override
	public int insertSelective(t5citys record) {
		// TODO Auto-generated method stub
		return t5citysdao.insertSelective(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#selectByPrimaryKey(java.lang.String)
	 */
	@Override
	public t5citys selectByPrimaryKey(String codeid) {
		// TODO Auto-generated method stub
		return t5citysdao.selectByPrimaryKey(codeid);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#selectByShengShi(lyf.test.entity.t5citys)
	 */
	@Override
	public t5citys selectByShengShi(t5citys record) {
		// TODO Auto-generated method stub
		return t5citysdao.selectByShengShi(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#updateByPrimaryKeySelective(lyf.test.entity.t5citys)
	 */
	@Override
	public int updateByPrimaryKeySelective(t5citys record) {
		// TODO Auto-generated method stub
		return t5citysdao.updateByPrimaryKeySelective(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#updateByPrimaryKey(lyf.test.entity.t5citys)
	 */
	@Override
	public int updateByPrimaryKey(t5citys record) {
		// TODO Auto-generated method stub
		return t5citysdao.updateByPrimaryKey(record);
	}

	/* (non-Javadoc)
	 * @see lyf.test.service.t5citysService#selectByShengShiCodeAndXian(lyf.test.entity.t5citys)
	 */
	@Override
	public t5citys selectByShengShiCodeAndXian(t5citys record) {
		// TODO Auto-generated method stub
		return t5citysdao.selectByShengShiCodeAndXian(record);
	}

}
