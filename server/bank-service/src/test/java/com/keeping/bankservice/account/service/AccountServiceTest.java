package com.keeping.bankservice.account.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.keeping.bankservice.api.controller.account.request.AuthPhoneRequest;
import com.keeping.bankservice.api.controller.account.request.CheckPhoneRequest;
import com.keeping.bankservice.api.service.account.AccountService;
import com.keeping.bankservice.api.service.account.dto.AuthPhoneDto;
import com.keeping.bankservice.api.service.account.dto.CheckPhoneDto;
import com.keeping.bankservice.global.exception.NoAuthorizationException;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;

@SpringBootTest
@Transactional
public class AccountServiceTest {

    @Autowired
    AccountService accountService;

    @Test
    @DisplayName("인증번호 발송")
    void checkPhone() throws UnsupportedEncodingException, NoSuchAlgorithmException, URISyntaxException, InvalidKeyException, JsonProcessingException {
        // given
        String memberKey = "0986724";

        CheckPhoneRequest request = CheckPhoneRequest.builder()
                .phone("010-7745-1098")
                .build();

        // when
        CheckPhoneDto dto = CheckPhoneDto.toDto(request);

        // then
        accountService.checkPhone(memberKey, dto);
    }

    @Test
    @DisplayName("인증번호 확인 # 일치할 때")
    void authPhone() throws JsonProcessingException {
        // given
        String memberKey = "0986724";
        String code = "333739";

        AuthPhoneRequest request = AuthPhoneRequest.builder()
                .code(code)
                .build();

        // when
        AuthPhoneDto dto = AuthPhoneDto.toDto(request);

        // then
        accountService.authPhone(memberKey, dto);
    }

    @Test
    @DisplayName("인증번호 확인 # 불일치할 때")
    void authPhoneException() throws JsonProcessingException {
        // given
        String memberKey = "0986724";
        String code = "123456";

        AuthPhoneRequest request = AuthPhoneRequest.builder()
                .code(code)
                .build();

        // when
        AuthPhoneDto dto = AuthPhoneDto.toDto(request);

        // then
        assertThatThrownBy(() -> accountService.authPhone(memberKey, dto))
                .isInstanceOf(NoAuthorizationException.class);
    }

}
