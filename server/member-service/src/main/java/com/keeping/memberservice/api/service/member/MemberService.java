package com.keeping.memberservice.api.service.member;

import com.keeping.memberservice.api.service.member.dto.AddParentDto;
import com.keeping.memberservice.domain.Member;
import com.keeping.memberservice.domain.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@RequiredArgsConstructor
@Service
@Transactional
@Slf4j
public class MemberService {

    //    private final ParentRepository parentRepository;
    private final MemberRepository memberRepository;

    public String addParent(AddParentDto dto) {
        // 아이디 중복 검사
        Optional<Member> findMember = memberRepository.findByLoginId(dto.getLoginId());

        if (findMember.isPresent()) {
            throw new IllegalArgumentException("이미 존재하는 아이디입니다.");
        }


        //번호 인증 검사

        //가입
        return "";
    }
}
