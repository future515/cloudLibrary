package edu.hebtu.service;

import edu.hebtu.entity.PageResult;
import edu.hebtu.pojo.Record;
import edu.hebtu.pojo.User;

public interface RecordService {
    Integer addRecord(Record record);

    PageResult searchRecords(Record record, User user, Integer pageNum, Integer pageSize);
}
