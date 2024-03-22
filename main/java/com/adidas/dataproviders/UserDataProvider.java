package com.adidas.dataproviders;

import com.adidas.dataproviders.model.User;
import com.adidas.utils.PropertiesReader;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;
import java.util.Map;

@UtilityClass
@Slf4j
public class UserDataProvider {
    public Map<String, User> users;

    public void createUsers(PropertiesReader properties) {
        users = new HashMap<>();

        users.put("main", User.builder()
                .email(properties.getProperty("svc.ta1_email"))
                .password(System.getProperty("svc.ta1_password"))
                .build());
        users.put("rst", User.builder()
                .email(properties.getProperty("svc.rst_email"))
                .password(System.getProperty("svc.rst_password"))
                .build());
        users.put("ust", User.builder()
                .email(properties.getProperty("svc.ust_email"))
                .password(System.getProperty("svc.ust_password"))
                .build());
        users.put("dst", User.builder()
                .email(properties.getProperty("svc.dst_email"))
                .password(System.getProperty("svc.dst_password"))
                .build());
        users.put("rpst", User.builder()
                .email(properties.getProperty("svc.rpst_email"))
                .password(System.getProperty("svc.rpst_password"))
                .build());
        users.put("all_95", User.builder()
                .email(properties.getProperty("svc.all_95_email"))
                .password(System.getProperty("svc.all_95_password"))
                .build());
    }

    public User getUser(String userType) {
        return users.get(userType);
    }
}
