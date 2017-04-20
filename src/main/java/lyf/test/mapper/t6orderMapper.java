package lyf.test.mapper;

import lyf.test.entity.t6order;
import lyf.test.entity.t6orderKey;

public interface t6orderMapper {
    int deleteByPrimaryKey(t6orderKey key);

    int insert(t6order record);

    int insertSelective(t6order record);

    t6order selectByPrimaryKey(t6orderKey key);

    int updateByPrimaryKeySelective(t6order record);

    int updateByPrimaryKey(t6order record);
}