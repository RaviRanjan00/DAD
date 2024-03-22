package com.adidas.utils;

import com.adidas.exceptions.MissedPropertyFileException;
import groovy.lang.MissingPropertyException;
import lombok.extern.slf4j.Slf4j;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@Slf4j
public class PropertiesReader {

    private final Properties properties = new Properties();


    private PropertiesReader(String propertyFileName) {
        Properties commonProperties = new Properties();
        try {
            log.info("Loading properties from file {}", propertyFileName);
            properties.load(getInputStream(propertyFileName));

            log.info("Loading properties from file {}", "common.properties");
            commonProperties.load(getInputStream("common.properties"));
            log.info("Putting all properties together");
            properties.putAll(commonProperties);
        } catch (IOException e) {
            log.error(e.getMessage());
            throw new MissedPropertyFileException(e.getMessage(), e.getCause());
        }
    }

    public static PropertiesReader getInstance(String propertyFileName) {
        return new PropertiesReader(propertyFileName);
    }


    private static InputStream getInputStream(String filename) {
        return PropertiesReader.class.getClassLoader().getResourceAsStream(filename);

    }

    public String getProperty(String propertyName) {
        String output = properties.getProperty(propertyName);
        log.info("Getting property {} by name {}", output, propertyName);
        if (output != null) {
            return output;
        } else {
            throw new MissingPropertyException("Property " + propertyName + " is missing in target file");
        }
    }
}
