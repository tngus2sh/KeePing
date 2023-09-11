package com.keeping.memberservice.api.service.member;

import com.keeping.memberservice.api.service.member.dto.AddParentDto;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.transaction.annotation.Transactional;

import static org.junit.jupiter.api.Assertions.*;

@Transactional
class MemberServiceTest {

    @DisplayName("[부모 회원가입-service] 아이디 길이가 5자 미만이거나, 20자 초과면 예외가 발생한다.")
    @Test
    void test() {
        //given
        AddParentDto dto = createAddParentDto();

        //when

        //then

    }

    private static AddParentDto createAddParentDto() {
        return AddParentDto.builder()
                .loginId("keep")
                .loginPw("loginPw123!")
                .name("양수원")
                .phone("010-1234-1234")
                .birth("2000-05-05")
                .build();
    }
}