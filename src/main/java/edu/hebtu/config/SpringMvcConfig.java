package edu.hebtu.config;

import edu.hebtu.interceptor.ResourcesInterceptor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.*;

import java.util.List;

@Configuration
@PropertySource("classpath:ignoreUrl.properties")
@ComponentScan("edu.hebtu.controller")
@EnableWebMvc
public class SpringMvcConfig implements WebMvcConfigurer {
    @Value("#{'${ignoreUrl}'.split(',')}")
    private List<String> ignoreUrl;
    @Bean
    public ResourcesInterceptor resourcesInterceptor(){
        System.out.println("%%%%%%%%%%%"+ignoreUrl);
        return new ResourcesInterceptor(ignoreUrl);
    }

    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer){
        configurer.enable();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(resourcesInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/css/**","/js/**","/images/**");
    }

    public void configureViewResolvers(ViewResolverRegistry registry){
        registry.jsp("/admin/",".jsp");
    }

}
