package com.keeping.memberservice.api.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.keeping.memberservice.api.ApiResponse;
import com.keeping.memberservice.api.controller.request.SmsRequest;
import com.keeping.memberservice.api.service.AuthService;
import com.keeping.memberservice.api.service.sms.SmsService;
import com.keeping.memberservice.api.service.sms.dto.MessageDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jetbrains.annotations.NotNull;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;
import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@RequiredArgsConstructor
@RestController
@RequestMapping("/member-service")
@Slf4j
public class MemberController {

    private final AuthService authService;
    private final SmsService smsService;

    @PostMapping("/phone")
    public ApiResponse<String> sendJoinSms(@RequestBody @Valid SmsRequest request) throws UnsupportedEncodingException, NoSuchAlgorithmException, URISyntaxException, InvalidKeyException, JsonProcessingException {
        log.debug("인증번호 요청 들어옴");
        String phone = makeUserPhone(request);

        String randomNumber = authService.getRandomCertification(phone);

        MessageDto message = MessageDto.builder()
                .to(phone)
                .content(randomNumber)
                .build();

        smsService.sendSmsMessage(message);
        return ApiResponse.ok("인증번호가 전송되었습니다.");
    }

    @NotNull
    private static String makeUserPhone(SmsRequest request) {
        String requestPhone = request.getPhone();
        String[] phone = requestPhone.split("-");

        return phone[0] + phone[1] + phone[2];
    }


}
