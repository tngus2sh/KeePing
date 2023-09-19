package com.keeping.memberservice.api.service.sms.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class MessageDto {

    private String to;
    private String content;

    @Builder
    private MessageDto(String to, String content) {
        this.to = to;
        this.content = content;
    }
}
