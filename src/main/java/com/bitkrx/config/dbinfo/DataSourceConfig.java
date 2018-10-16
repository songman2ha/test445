package com.bitkrx.config.dbinfo;

import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import com.bitkrx.constant.DBInfoConstant;

/**
 * DB connection 설정
 * DataSource 설정 및 DB 정보를 관리한다.
 * 
 */
@Configuration
@Component
public class DataSourceConfig {
    
    @Bean 
    public CmeRoutingDataSource multiDataSource() {
       CmeRoutingDataSource cliDataSource =  new CmeRoutingDataSource();
       
       Map<Object, Object> targetDataSource = new HashMap<Object, Object>();

       targetDataSource.put(DataSourceType.BITKRX, bitkrx());

       cliDataSource.setTargetDataSources(targetDataSource);
       cliDataSource.setDefaultTargetDataSource(bitkrx());

       cliDataSource.afterPropertiesSet();
       return cliDataSource;
    }

    @Bean(name="bitkrx",destroyMethod="close")
    public DataSource bitkrx() {

        BasicDataSource dataSource = new BasicDataSource();
        
        dataSource.setDriverClassName(DBInfoConstant.Log4JdbcDriverClassName);

        dataSource.setUrl("jdbc:log4jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=222.239.119.238)(PORT=1521)))(CONNECT_DATA=(SERVICE_NAME=cme.orcl)))"); //20180524 변경
        dataSource.setUsername("WMUICO");
        dataSource.setPassword("WMUICO123");

        dataSource.setValidationQuery(DBInfoConstant.validationQuery);
        dataSource.setTestOnBorrow(true);
        dataSource.setTestOnReturn(true);
        dataSource.setTestWhileIdle(true);
        dataSource.setTimeBetweenEvictionRunsMillis(1800000);
        dataSource.setNumTestsPerEvictionRun(3);
        dataSource.setMinEvictableIdleTimeMillis(1800000);
     
        return dataSource;
    }

}