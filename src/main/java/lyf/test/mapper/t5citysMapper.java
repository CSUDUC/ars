package lyf.test.mapper;

import lyf.test.entity.t5citys;

public interface t5citysMapper {
    int deleteByPrimaryKey(String codeid);

    int insert(t5citys record);

    int insertSelective(t5citys record);

    t5citys selectByPrimaryKey(String codeid);
    
    t5citys selectByShengShi(t5citys record);//通过省市获取citys

    t5citys selectByShengShiCodeAndXian(t5citys record);//通过省市code和县名获取citys
    
    int updateByPrimaryKeySelective(t5citys record);

    int updateByPrimaryKey(t5citys record);
}