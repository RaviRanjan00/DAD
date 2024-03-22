package com.adidas.config;

import com.adidas.dataproviders.UserDataProvider;
import com.adidas.exceptions.EnvNotSetException;
import com.adidas.exceptions.MissedPropertyFileException;
import com.adidas.utils.PropertiesReader;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

@UtilityClass
@Slf4j
public class Configuration {
    public String devPropFilePath = "dev.properties";
    public String stgPropFilePath = "stg.properties";
    public PropertiesReader props;

    public void setup() {
        log.info("Setting up the configurations");
        if (props == null) read_properties();
        log.info("Creating test users");
        UserDataProvider.createUsers(props);
    }

    private void read_properties() {
        String env = System.getProperty("env");
        log.info("Reading properties for env {}", env);
        String propertyFilePath = "";
        try {
            if (env.equalsIgnoreCase("dev")) {
                propertyFilePath = devPropFilePath;
            } else if (env.equalsIgnoreCase("stg")) {
                propertyFilePath = stgPropFilePath;
            }
            props = PropertiesReader.getInstance(propertyFilePath);
        } catch (NullPointerException e) {
            log.error(e.getMessage());
            throw new EnvNotSetException(e.getMessage());
        } catch (Exception e) {
            log.error(e.getMessage());
            throw new MissedPropertyFileException(e.getMessage(), e.getCause());
        }
    }

    public void clean_properties() {
        log.info("Cleaning properties");
        props = null;
    }

    public String getEndpointByRange(int range) {
        return String.format(Configuration.props.getProperty("range_articles"), range);
    }

    public String getEndpointByWrongRange(String range) {
        return String.format(Configuration.props.getProperty("range_articles_negative"), range);
    }

    public String getEndpointByRangeAndArticleNumber(int range, String articleNumber) {
        return String.format(Configuration.props.getProperty("range_articles_by_article_number"), range, articleNumber);
    }

    public String getEndpointByRangeAndArticleNumberManualMode(int range, String articleNumber) {
        return String.format(Configuration.props.getProperty("range_articles_by_article_number_manual_mode"), range, articleNumber);
    }

    public String getEndpointByRangeAndArticleNumber(int range, String endpoint, String articleNumber) {
        return String.format(Configuration.props.getProperty(endpoint), range, articleNumber);
    }

    public String getAccessPrivateEndpointByRange(int range) {
        return String.format(Configuration.props.getProperty("range_access_private"), range);
    }
}