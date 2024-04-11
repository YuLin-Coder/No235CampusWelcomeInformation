package com.ssm.dao.provider;

import com.ssm.pojo.DormInfo;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;

public class DormInfoDynaSqlProvider {


    public String count(DormInfo dormInfo){
        String sql=new SQL(){
            {
                SELECT("count(*)");
                FROM("dorm");
                WHERE("alreadyNumber<allNumber");
                if(dormInfo.getId()!=null&&!"".equals(dormInfo.getId())){
                    WHERE("id=#{id}");
                }
                if(dormInfo.getStatus()!=null&&!"".equals(dormInfo.getStatus())){
                    WHERE("status=#{status}");
                }
                if(dormInfo.getSex()!=null&&!"".equals(dormInfo.getSex())){
                    WHERE("sex=#{sex}");
                }
            }
        }.toString();
        return sql;
    }
    public String selectWithParam(Map<String,Object> params){
        String sql=new SQL(){
            {
                SELECT("*");
                FROM("dorm");
                if(params.get("dormInfo")!=null){
                    DormInfo dormInfo= (DormInfo) params.get("dormInfo");
                    if(dormInfo.getId()!=null&&!"".equals(dormInfo.getId())){
                        WHERE("id=#{dormInfo.id}");
                    }
                    if(dormInfo.getSex()!=null&&!"".equals(dormInfo.getSex())){
                        WHERE("sex=#{dormInfo.sex}");
                    }
                    if(dormInfo.getStatus()!=null&&!"".equals(dormInfo.getStatus())){
                        WHERE("status=#{dormInfo.status}");
                    }
                }
            }
        }.toString();
        if(params.get("pager")!=null){
            sql+=" limit #{pager.firstLimitParam},#{pager.perPageRows}";
        }
        return sql;
    }
}
