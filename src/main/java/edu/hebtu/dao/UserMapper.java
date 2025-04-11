package edu.hebtu.dao;
import edu.hebtu.pojo.User;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    @Select("select * from user where user_email=#{email} and user_password=#{password} and user_status!='1'")
    @Results(id="userMap",value = {
            @Result(id = true, property = "id", column = "user_id"),
            @Result(property = "name", column = "user_name"),
            @Result(property = "password", column = "user_password"),
            @Result(property = "email", column = "user_email"),
            @Result(property = "role", column = "user_role"),
            @Result(property = "status", column = "user_status")
    })
    public User login(User user);
}
