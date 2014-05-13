package com.sonymobile.sonysales.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigReader {
    private ConfigReader() {
        
    }
    static Properties properties = new Properties();
    
    static {
        InputStream is = ConfigReader.class.getClassLoader()
                .getResourceAsStream("config.properties");
        try {
            properties.load(is);
        } catch (IOException e) {
            System.out.println("ConfigReader load config.properties error!!!");
            e.printStackTrace();
        }
    }

public static String getProperty(String key) {

    return properties.getProperty(key);
}

	
	
	public static void main(String[] args) {
		System.out.println("host:"+ConfigReader.getProperty("host"));
	}
}
