package com.bitkrx.config.dbinfo;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.jdbc.datasource.AbstractDataSource;
import org.springframework.jdbc.datasource.lookup.DataSourceLookup;
import org.springframework.jdbc.datasource.lookup.JndiDataSourceLookup;
import org.springframework.util.Assert;

public abstract class CmeAbstractRoutingDataSource extends AbstractDataSource implements InitializingBean{

    private Map<Object, Object> targetDataSources;

    private Object defaultTargetDataSource;

    private boolean lenientFallback = true;

    private DataSourceLookup dataSourceLookup = new JndiDataSourceLookup();

    private Map<Object, DataSource> resolvedDataSources;

    private DataSource resolvedDefaultDataSource;

    
    public void setTargetDataSources(Map<Object, Object> targetDataSources) {
        this.targetDataSources = targetDataSources;
    
    }

    
    public void setDefaultTargetDataSource(Object defaultTargetDataSource) {
        this.defaultTargetDataSource = defaultTargetDataSource;
    }

    
    public void setLenientFallback(boolean lenientFallback) {
        this.lenientFallback = lenientFallback;
    }

    
    public void setDataSourceLookup(DataSourceLookup dataSourceLookup) {
        this.dataSourceLookup = (dataSourceLookup != null ? dataSourceLookup : new JndiDataSourceLookup());
    }


    public void afterPropertiesSet() {
        if (this.targetDataSources == null) {
            throw new IllegalArgumentException("Property 'targetDataSources' is required");
        }
        this.resolvedDataSources = new HashMap<Object, DataSource>(this.targetDataSources.size());
        for (Map.Entry entry : this.targetDataSources.entrySet()) {
            Object lookupKey = resolveSpecifiedLookupKey(entry.getKey());
            DataSource dataSource = resolveSpecifiedDataSource(entry.getValue());
            this.resolvedDataSources.put(lookupKey, dataSource);
        }
        if (this.defaultTargetDataSource != null) {
            this.resolvedDefaultDataSource = resolveSpecifiedDataSource(this.defaultTargetDataSource);
        }
    }

    
    protected DataSource resolveSpecifiedDataSource(Object dataSource) throws IllegalArgumentException {
        if (dataSource instanceof DataSource) {
            return (DataSource) dataSource;
        }
        else if (dataSource instanceof String) {
            return this.dataSourceLookup.getDataSource((String) dataSource);
        }
        else {
            throw new IllegalArgumentException(
                    "Illegal data source value - only [javax.sql.DataSource] and String supported: " + dataSource);
        }
    }


    public Connection getConnection() throws SQLException {
        return determineTargetDataSource().getConnection();
    }

    public Connection getConnection(String username, String password) throws SQLException {
        return determineTargetDataSource().getConnection(username, password);
    }

    
    protected DataSource determineTargetDataSource() {
        Assert.notNull(this.resolvedDataSources, "DataSource router not initialized");
        Object lookupKey = determineCurrentLookupKey();
        DataSource dataSource = this.resolvedDataSources.get(lookupKey);
        if (dataSource == null && (this.lenientFallback || lookupKey == null)) {
            dataSource = this.resolvedDefaultDataSource;
        }
        if (dataSource == null) {
            throw new IllegalStateException("Cannot determine target DataSource for lookup key [" + lookupKey + "]");
        }
        return dataSource;
    }


    
    protected Object resolveSpecifiedLookupKey(Object lookupKey) {
        return lookupKey;
    }

    
    protected abstract Object determineCurrentLookupKey();  
    
}
