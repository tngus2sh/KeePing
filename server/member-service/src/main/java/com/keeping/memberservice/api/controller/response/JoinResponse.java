package com.keeping.memberservice.api.controller.response;

import lombok.Builder;
import lombok.Data;

@Data
public class JoinResponse {

    private String name;

    @Builder
    public JoinResponse(String name) {
        this.name = name;
    }
}
