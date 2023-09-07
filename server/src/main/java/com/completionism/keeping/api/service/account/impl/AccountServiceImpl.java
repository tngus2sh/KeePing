package com.completionism.keeping.api.service.account.impl;

import com.completionism.keeping.api.service.account.AccountService;
import com.completionism.keeping.api.service.account.dto.AddAccountDto;
import com.completionism.keeping.domain.account.Account;
import com.completionism.keeping.domain.account.repository.AccountRepository;
import com.completionism.keeping.domain.member.Member;
import com.completionism.keeping.global.exception.NotFoundException;
import com.completionism.keeping.global.utils.RedisUtils;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.Random;

@Service
@Transactional
@RequiredArgsConstructor
public class AccountServiceImpl implements AccountService {

//    private final MemberRepository memberRepository;
    private final AccountRepository accountRepository;
    private final RedisUtils redisUtils;

    @Override
    public Long addAccount(String loginId, AddAccountDto dto) {
        Member member = null;
//        Member member = memberRepository.findByLoginId(loginId).orElseThrow(() -> new NotFoundException("404", HttpStatus.NOT_FOUND, "해당 회원이 존재하지 않습니다."));

        Random rand = new Random();
        int num = rand.nextInt(888889) + 111111;

        try {
            if(redisUtils.getRedisValue(String.valueOf(num), String.class).equals("")) {

            }
        } catch(JsonProcessingException e) {
            throw new RuntimeException(e);
        }


        String accountNumber = "171-" + "" + "" + ""; // 3-6-3-2

        Account account = Account.toAccount(member, accountNumber, dto.getAuthPassword(), 0l, true);
        Account saveAccount = accountRepository.save(account);

        return saveAccount.getId();
    }
}
