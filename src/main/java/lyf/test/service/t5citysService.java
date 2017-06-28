/**
 * May 27, 2017
2:55:57 PM
lyf
 */
package lyf.test.service;

import lyf.test.entity.t5citys;

/**
 * @author lyf
May 27, 2017
 *
 */
public interface t5citysService {
	int deleteByPrimaryKey(String codeid);

    int insert(t5citys record);

    int insertSelective(t5citys record);

    t5citys selectByPrimaryKey(String codeid);
    
    t5citys selectByShengShi(t5citys record);//通过省市获取citys
    
    t5citys selectByShengShiCodeAndXian(t5citys record);//通过省市code和县名获取citys

    int updateByPrimaryKeySelective(t5citys record);

    int updateByPrimaryKey(t5citys record);
}
