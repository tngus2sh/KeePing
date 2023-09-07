package com.completionism.keeping.api.controller.account;

import com.completionism.keeping.api.ApiResponse;
import com.completionism.keeping.api.controller.account.request.AddAccountRequest;
import com.completionism.keeping.api.service.account.AccountService;
import com.completionism.keeping.api.service.account.dto.AddAccountDto;
import com.completionism.keeping.global.utils.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/account")
public class AccountApiController {

    private final AccountService accountService;

    @PostMapping
    public ApiResponse<Void> addAccount(@RequestBody AddAccountRequest request) {
        log.debug("AddAccountRequest={}", request);

        String loginId = SecurityUtils.getCurrentLoginId();
        AddAccountDto dto = AddAccountDto.toDto(request);

//        try {
//            Long accountId = accountService.addAccount(loginId, dto);
//        }

        return null;
    }
}
