package lyf.test.mapper;

import lyf.test.entity.t4division;
import lyf.test.entity.t4divisionKey;

public interface t4divisionMapper {
    int deleteByPrimaryKey(t4divisionKey key);

    int insert(t4division record);

    int insertSelective(t4division record);

    t4division selectByPrimaryKey(t4divisionKey key);

    int updateByPrimaryKeySelective(t4division record);

    int updateByPrimaryKey(t4division record);
}