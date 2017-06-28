package lyf.test.mapper;

import lyf.test.entity.t1user;
import lyf.test.entity.t1userKey;

public interface t1userMapper {
    int deleteByPrimaryKey(t1userKey key);

    int insert(t1user record);

    int insertSelective(t1user record);

    t1user selectByPrimaryKey(t1userKey key);
    
    t1user selectByUserNameAndPwd(t1userKey key);

    int updateByPrimaryKeySelective(t1user record);

    int updateByUserIDSelective(t1user record);
    
    int updateByPrimaryKey(t1user record);
}