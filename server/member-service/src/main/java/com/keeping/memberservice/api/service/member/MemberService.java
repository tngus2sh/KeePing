package com.keeping.memberservice.api.service.member;

import com.keeping.memberservice.api.service.member.dto.AddParentDto;
import com.keeping.memberservice.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@RequiredArgsConstructor
@Service
@Transactional
@Slf4j
public class MemberService {

    //    private final ParentRepository parentRepository;
    private final MemberRepository memberRepository;

    public String addParent(AddParentDto dto) {
        return "";
    }
}
