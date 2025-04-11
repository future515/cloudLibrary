package edu.hebtu.dao;

import com.github.pagehelper.Page;
import edu.hebtu.pojo.Record;
import edu.hebtu.util.BookSqlProvider;
import org.apache.ibatis.annotations.*;

@Mapper
public interface RecordMapper {

    @Insert("insert into record(record_bookname, record_bookisbn, record_borrower, record_borrowtime, record_remandtime) values(#{bookname}, #{bookisbn}, #{borrower}, #{borrowTime}, #{remandTime})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    Integer addRecord(Record record);

    @SelectProvider(type = BookSqlProvider.class, method = "searchRecord")
    @Results(id="recordMap",value={
            @Result(id = true, property = "id", column = "record_id"),
            @Result(property = "bookname", column = "record_bookname"),
            @Result(property = "bookisbn", column = "record_bookisbn"),
            @Result(property = "borrower", column = "record_borrower"),
            @Result(property = "borrowTime", column = "record_borrowtime"),
            @Result(property = "remandTime", column = "record_remandtime")
    })
    Page<Record> searchRecord(@Param("record")Record record);
}