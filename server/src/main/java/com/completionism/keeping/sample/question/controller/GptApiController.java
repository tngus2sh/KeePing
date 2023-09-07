package com.completionism.keeping.sample.question.controller;

import com.completionism.keeping.api.ApiResponse;
import com.completionism.keeping.sample.question.service.GptService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping
public class GptApiController {
    
    private GptService gptService;
    
    @PostMapping("/api/gpt")
    public ApiResponse<String> chat(
            @RequestBody String content
    ) {
        try {
            String chat = gptService.chat(content);
            log.info("chat: " + chat);
            return ApiResponse.ok(chat);
        } catch (Exception e) {
            return ApiResponse.of(404, HttpStatus.NOT_FOUND, "오류 발생", null);
        }
    }
}
