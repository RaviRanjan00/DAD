package com.adidas.utils;

import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.util.Base64;

@UtilityClass
@Slf4j
public class CommonUtils {

    String regex = "\\{[^{}]+\\}";

    public String decodeString(String needTobeDecoded) {
        return new String(Base64.getDecoder().decode(needTobeDecoded));
    }

    public String replaceQueries(String originalQuery, String... replacedValues) {
        for (String replacedValue : replacedValues) {
            originalQuery = originalQuery.replaceFirst(regex, replacedValue);
        }
        return originalQuery;
    }
}
