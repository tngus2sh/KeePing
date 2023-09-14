package com.keeping.questionservice.api.controller;

import com.keeping.questionservice.api.ApiResponse;
import com.keeping.questionservice.api.controller.request.AddQuestionRequest;
import com.keeping.questionservice.api.controller.response.QuestionResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@RequestMapping("/question-service/{memberKey}")
@Slf4j
public class QuestionController {


    @GetMapping("/questions/{date}")
    private ApiResponse<QuestionResponse> getQuestion(@PathVariable String memberKey,
                                                      @PathVariable String date) {
        return ApiResponse.ok(QuestionResponse.builder().build());
    }

    @PostMapping
    public ApiResponse<String> addQuestion(@RequestBody @Valid AddQuestionRequest request,
                                           @PathVariable String memberKey) {
        // TODO: 2023-09-14 질문 등록
        return ApiResponse.ok("");
    }
}
