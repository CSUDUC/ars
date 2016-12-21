package lyf.test.mapper;

import lyf.test.entity.t3product;
import lyf.test.entity.t3productKey;

public interface t3productMapper {
    int deleteByPrimaryKey(t3productKey key);

    int insert(t3product record);

    int insertSelective(t3product record);

    t3product selectByPrimaryKey(t3productKey key);

    int updateByPrimaryKeySelective(t3product record);

    int updateByPrimaryKey(t3product record);
}