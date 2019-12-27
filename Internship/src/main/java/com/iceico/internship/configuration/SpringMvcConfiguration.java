/**
 * 
 */
package com.iceico.internship.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author PRAFUL MESHRAM
 * @version 0.1
 * 
 *          Created Date : 22/10/2019
 * 
 *          Updated Date :
 *
 */
@Configuration
@EnableWebMvc
public class SpringMvcConfiguration implements WebMvcConfigurer {
	/*
	 * @Autowired private RoleToUserProfileConverter roleToUserProfileConverter;
	 */
	/*
	 * @Override public void addFormatters(FormatterRegistry registry) {
	 * registry.addConverter(academicYearConverter);
	 * registry.addConverter(casteConverter);
	 * registry.addConverter(categoryConverter);
	 * registry.addConverter(courseConverter);
	 * registry.addConverter(genderConverter);
	 * registry.addConverter(roleToUserProfileConverter);
	 * registry.addConverter(subcasteConverter); }
	 */

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/static/**").addResourceLocations("/static/");
	}

}
