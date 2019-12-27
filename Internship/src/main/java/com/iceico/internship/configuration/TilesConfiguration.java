/**
 * 
 */
package com.iceico.internship.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

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
public class TilesConfiguration {

	@Bean
	public UrlBasedViewResolver tilesViewResolver() {
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		return tilesViewResolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer tilesConfigurer = new TilesConfigurer();
		String[] defs = { "classpath:admin-panel.xml" };
		tilesConfigurer.setDefinitions(defs);
		return tilesConfigurer;
	}
}
