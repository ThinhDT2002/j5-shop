package com.assignment;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
	@Bean("viewResolver")
	public ViewResolver getResolver() {
		UrlBasedViewResolver basedViewResolver = new UrlBasedViewResolver();
		basedViewResolver.setViewClass(TilesView.class);
		return basedViewResolver;
	}
	
	@Bean("tilesConfigurer")
	public TilesConfigurer getTilesConfigurer() {
		TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions("/WEB-INF/tiles.xml");
		return configurer;
	}
	
}
