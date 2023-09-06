package com.completionism.keeping.api.controller.account;

import com.completionism.keeping.api.service.account.AccountService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/api/account")
public class AccountApiController {

    private final AccountService accountService;


}
