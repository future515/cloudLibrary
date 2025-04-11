package edu.hebtu.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.hebtu.dao.RecordMapper;
import edu.hebtu.entity.PageResult;
import edu.hebtu.pojo.Record;
import edu.hebtu.pojo.User;
import edu.hebtu.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("RecordService")
public class RecordServiceImpl implements RecordService {

    @Autowired
    RecordMapper recordMapper;


    @Override
    public Integer addRecord(Record record) {
        System.out.println("######################record2"+record);
        return recordMapper.addRecord(record);
    }

    @Override
    public PageResult searchRecords(Record record, User user, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        System.out.println("######################record"+record);
        if(!"ADMIN".equalsIgnoreCase(user.getRole())) {
            record.setBorrower(user.getName());
        }
        System.out.println("@@@@@userRole="+user.getRole());
        Page<Record> records = recordMapper.searchRecord(record);
        System.out.println("uuuuuuuuuu");
        return new PageResult((int) records.getTotal(), records.getResult());
    }
}
