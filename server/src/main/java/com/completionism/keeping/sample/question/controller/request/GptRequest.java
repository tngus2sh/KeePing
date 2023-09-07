package com.completionism.keeping.sample.question.controller.request;

import com.completionism.keeping.sample.question.service.dto.Message;
import lombok.*;

import java.util.List;

@Data
@AllArgsConstructor
public class GptRequest {
    
    private String model;
    
    private List<Message> messages;

    /**
     * 사용자가 입력한 messages 값을 받아서 request에 필요한 데이터를 생성
     * @param messages 입력값
     * @return GptRequest
     */
    public static GptRequest create(List<Message> messages) {
        return new GptRequest("gpt-3.5-turbo", messages);
    }
}
