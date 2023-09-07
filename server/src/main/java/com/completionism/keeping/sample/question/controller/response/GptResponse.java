package com.completionism.keeping.sample.question.controller.response;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
import java.util.Optional;

@Data
public class GptResponse {
    
    private List<Choice> choices;

    /**
     * OpenAI에 받아온 Response에서 GPT의 응답 값인 text를 추출해준다.
     * @return text
     */
    public Optional<String> getText() {
        if (choices == null || choices.isEmpty()) {
            return Optional.empty();
        }
        return Optional.of(choices.get(0).text);
    }

    @Data
    private static class Choice {
        private String text;
    }
    
}
