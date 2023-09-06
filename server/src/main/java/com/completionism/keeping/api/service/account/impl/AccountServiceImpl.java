package com.completionism.keeping.api.service.account.impl;

import com.completionism.keeping.api.service.account.AccountService;
import com.completionism.keeping.domain.account.repository.AccountRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {

    private final AccountRepository accountRepository;

}
