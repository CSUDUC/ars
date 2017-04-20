package lyf.test.mapper;

import lyf.test.entity.t2data;
import lyf.test.entity.t2dataKey;

public interface t2dataMapper {
    int deleteByPrimaryKey(t2dataKey key);

    int insert(t2data record);

    int insertSelective(t2data record);

    t2data selectByPrimaryKey(t2dataKey key);

    int updateByPrimaryKeySelective(t2data record);

    int updateByPrimaryKey(t2data record);
}