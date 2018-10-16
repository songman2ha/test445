package com.bitkrx.config.dbinfo;

import java.io.FileInputStream;
import java.lang.reflect.Method;
import java.util.Properties;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import com.bitkrx.config.annotation.CommonDataSource;
import com.bitkrx.config.logging.CmeCommonLogger;

import javax.servlet.ServletContext;

@Aspect
@Component
@Order(value=1)
public class CmeDbExcutionLoggingAspect implements InitializingBean{
    protected CmeCommonLogger log = new CmeCommonLogger(this.getClass());

    @Autowired
    private ServletContext servletContext;

    public Object doServiceProfiling(ProceedingJoinPoint joinPoint) throws Throwable{

        //log.DebugLog("=======================CmeDbExcutionLoggingAspect start============================");
        String strlog = "DataSource Binding Start|";
        final String methodName = joinPoint.getSignature().getName();
        final MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod();

        if(method.getDeclaringClass().isInterface()){
            method = joinPoint.getTarget().getClass().getDeclaredMethod(methodName, method.getParameterTypes());
        }
        //Annotation을 가져온다.
        CommonDataSource dataSource = null;
        try {
            dataSource = (CommonDataSource) method.getAnnotation(CommonDataSource.class);
        } catch (Exception e) {
            //log.ViewErrorLog("Error:"+e.getMessage());
        }

        DataContextHolder.setDataSourceType(DataSourceType.BITKRX);

        //log.DebugLog(strlog);
        Object returnValue = joinPoint.proceed();
        //log.DebugLog("returnValue:::"+ returnValue);
        DataContextHolder.clearDataSourceType();

        return returnValue;
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        // TODO Auto-generated method stub
    }

}
