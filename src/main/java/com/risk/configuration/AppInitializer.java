package com.risk.configuration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

@Override
protected Class<?>[] getRootConfigClasses() {
// TODO Auto-generated method stub
return null;
}

@Override
protected Class<?>[] getServletConfigClasses() {
return new Class[] {AppConfig.class };
}

@Override
protected String[] getServletMappings() {
return new String[] {"/"};
}

}
