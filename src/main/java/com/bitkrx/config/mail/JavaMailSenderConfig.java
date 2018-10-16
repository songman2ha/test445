package com.bitkrx.config.mail;

import java.util.Properties;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.runtime.RuntimeConstants;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@Configuration
@ComponentScan("com.bitkrx")
public class JavaMailSenderConfig {
    
    @Bean
    public JavaMailSenderImpl javaMailSender() {
    	 final String host = "mail.planbit.io";
         final int port = 25;
         final String protocol = "smtp";
         final String user = "no-reply@planbit.io";
         final String pass = "Rjfoth3838!@#";
         final String encoding = "UTF-8";
   
        
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost(host);
        mailSender.setPort(port);  
        mailSender.setProtocol(protocol);
        mailSender.setUsername(user);
        mailSender.setPassword(pass);
        mailSender.setDefaultEncoding(encoding);
        
        Properties javaMailProps = new Properties();
        javaMailProps.put("mail.smtp.auth", true);
        javaMailProps.put("mail.smtp.starttls.enable", true);
        javaMailProps.put("mail.debug", true);
        javaMailProps.put("mail.transport.protocol", protocol);
         
        mailSender.setJavaMailProperties(javaMailProps);
         
        return mailSender;  
    }
    
    
    @Bean
    public VelocityEngine getVelocityEngine() throws Exception {
        //System.out.println("==========getVelocityEngine start==========");
        /*Properties props = new Properties();
        props.put("resource.loader", "webapp");
        props.put("class.resource.loader.class", "org.apache.velocity.tools.view.WebappResourceLoader");
        props.put("class.resource.loader.path", "/WEB-INF/templates");
        props.put("velocity.engine.resource.manager.cache.enabled",true); */
        VelocityEngine velocityEngine = new VelocityEngine();
        velocityEngine.setProperty(RuntimeConstants.RESOURCE_LOADER, "class,file");
        velocityEngine.setProperty(RuntimeConstants.RUNTIME_LOG_LOGSYSTEM_CLASS, "org.apache.velocity.runtime.log.Log4JLogChute");
        velocityEngine.setProperty("runtime.log.logsystem.log4j.logger", "VELLOGGER");
        velocityEngine.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        velocityEngine.setProperty("runtime.log.logsystem.class", "org.apache.velocity.runtime.log.NullLogSystem");
        velocityEngine.init();
        
        return velocityEngine;
    }

}
