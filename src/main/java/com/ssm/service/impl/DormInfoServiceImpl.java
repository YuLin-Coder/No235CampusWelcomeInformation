package com.ssm.service.impl;

import com.ssm.dao.DormInfoDao;
import com.ssm.pojo.DormInfo;
import com.ssm.pojo.Pager;
import com.ssm.service.DormInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("dormInfoService")
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT)
public class DormInfoServiceImpl implements DormInfoService {

    @Autowired
    DormInfoDao dormInfoDao;

    @Override
    public List<DormInfo> getAll() {
        return dormInfoDao.getAll();
    }

    @Override
    public int count(DormInfo dormInfo) {
        return dormInfoDao.count(dormInfo);
    }

    @Override
    public List<DormInfo> findDormInfo(DormInfo dormInfo, Pager pager) {
      Map<String,Object> params=new HashMap<>();
      //将封装有查询条件的宿舍对象放入params
        params.put("dormInfo",dormInfo);
        //计算满足条件的宿舍总数
        int total=dormInfoDao.count(dormInfo);
        //给pager对象设置rowCount属性值
        pager.setRowCount(total);
        if(total>0){
            params.put("pager",pager);
        }
        return dormInfoDao.selectByPage(params);
    }

    @Override
    public int updateDormById(String id) {
        return dormInfoDao.updateDormById(id);
    }

    @Override
    public List<DormInfo> getDormNumber() {
        return dormInfoDao.getAll();
    }


}
