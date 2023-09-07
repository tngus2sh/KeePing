package com.completionism.keeping.sample.question.service.impl;

import com.completionism.keeping.sample.question.service.GptService;
import com.completionism.keeping.sample.question.controller.request.GptRequest;
import com.completionism.keeping.sample.question.controller.response.GptResponse;
import com.completionism.keeping.sample.question.service.dto.Message;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.net.HttpHeaders;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class GptServiceImpl implements GptService {
    
    private final ObjectMapper objectMapper;
    private HttpClient httpClient;
    
    @Value("${gpt.apiUrl}")
    private String apiUrl;
    
    @Value("${gpt.openaiApiKey}")
    private String openaiApiKey;
    
    
    public String chat(String content) throws Exception {
        List<Message> messages = new ArrayList<>();
        messages.add(Message.builder()
                        .role("system")
                        .content(content)
                .build());
        GptRequest gptRequest = GptRequest.create(messages);
        String requestBody = objectMapper.writeValueAsString(gptRequest);
        String responseBody = sendRequest(requestBody);
        GptResponse gptResponse = objectMapper.readValue(responseBody, GptResponse.class);

        return gptResponse.getText().orElseThrow();
    }
    
    private String sendRequest(String requestBodyAsJson) throws Exception {
        URI url = URI.create(apiUrl);

        log.info("url: " + url);
        
        HttpRequest request = HttpRequest.newBuilder().uri(url)
                .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
                .header(HttpHeaders.AUTHORIZATION, "Bearer " + openaiApiKey)
                .POST(HttpRequest.BodyPublishers.ofString(requestBodyAsJson)).build();

        return httpClient.send(request, HttpResponse.BodyHandlers.ofString()).body();
    } 
}
