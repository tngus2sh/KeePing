package com.completionism.keeping.api.service.account;

import com.completionism.keeping.api.service.account.dto.AddAccountDto;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface AccountService {
    Long addAccount(String loginId, AddAccountDto dto);
}
