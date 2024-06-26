package com.adidas.dataproviders.model;

import lombok.Builder;
import lombok.Data;


@Builder
@Data
public class User {
    private String email;
    private String password;
    private String accessToken;
}
