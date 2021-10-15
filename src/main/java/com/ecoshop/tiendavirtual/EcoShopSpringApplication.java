package com.ecoshop.tiendavirtual;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class EcoShopSpringApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		System.setProperty("server.servlet.context-path", "/TiendaVirtualGrupo02Ecoshop");
		SpringApplication.run(EcoShopSpringApplication.class, args);
	}

}
