package com.keeping.memberservice.api.controller;

import com.keeping.memberservice.api.ApiResponse;
import com.keeping.memberservice.api.controller.request.PasswordCheckRequest;
import com.keeping.memberservice.api.controller.request.SetFcmTokenRequest;
import com.keeping.memberservice.api.controller.request.UpdateLoginPwRequest;
import com.keeping.memberservice.api.controller.response.MemberResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RequiredArgsConstructor
@RestController
@RequestMapping("/member-service/auth")
@Slf4j
public class MemberAuthController {


    @PostMapping("/{memberKey}/fcm-token")
    public ApiResponse<String> setFcmToken(@PathVariable String memberKey,
                                           @RequestBody @Valid SetFcmTokenRequest request) {
        // TODO: 2023-09-14 fcm token
        return ApiResponse.ok("");
    }

    @PostMapping("/{memberKey}/profile/{imageNum}")
    public ApiResponse<String> updateProfileImage(@PathVariable String memberKey,
                                                  @PathVariable String imageNum) {
        // TODO: 2023-09-14 프로필 이미지 변경
        return ApiResponse.ok("");
    }

    @GetMapping("/member/{memberKey}")
    public ApiResponse<MemberResponse> getMember(@PathVariable String memberKey) {
        // TODO: 2023-09-14 회원정보조회
        return ApiResponse.ok(MemberResponse.builder().build());
    }

    @DeleteMapping("/member/{memberKey}")
    public ApiResponse<String> deleteMember(@PathVariable String memberKey) {
        // TODO: 2023-09-14 회원 탈퇴
        return ApiResponse.ok("탈퇴되었습니다.");
    }

    @PatchMapping("/member/{memberKey}")
    public ApiResponse<String> updateLoginPw(@PathVariable String memberKey,
                                             @RequestBody @Valid UpdateLoginPwRequest request) {
        // TODO: 2023-09-14 비밀번호 변경
        return ApiResponse.ok("변경되었습니다. 다시 로그인하세요.");
    }

    @PostMapping("/password-check")
    public ApiResponse<String> passwordCheck(@RequestBody @Valid PasswordCheckRequest request) {
        // TODO: 2023-09-14 정보 변경 시 비밀번호 체크
        return ApiResponse.ok("");
    }
}
