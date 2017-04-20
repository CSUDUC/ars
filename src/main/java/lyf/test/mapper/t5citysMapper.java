package lyf.test.mapper;

import lyf.test.entity.t5citys;

public interface t5citysMapper {
    int deleteByPrimaryKey(String codeid);

    int insert(t5citys record);

    int insertSelective(t5citys record);

    t5citys selectByPrimaryKey(String codeid);

    int updateByPrimaryKeySelective(t5citys record);

    int updateByPrimaryKey(t5citys record);
}