package lyf.test.mapper;

import lyf.test.entity.initfoldertree;
import lyf.test.entity.initfoldertreeKey;

public interface initfoldertreeMapper {
    int deleteByPrimaryKey(initfoldertreeKey key);

    int insert(initfoldertree record);

    int insertSelective(initfoldertree record);

    initfoldertree selectByPrimaryKey(initfoldertreeKey key);

    int updateByPrimaryKeySelective(initfoldertree record);

    int updateByPrimaryKey(initfoldertree record);
}