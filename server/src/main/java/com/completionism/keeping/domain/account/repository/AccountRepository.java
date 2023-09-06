package com.completionism.keeping.domain.account.repository;

import com.completionism.keeping.domain.account.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountRepository extends JpaRepository<Account, Long> {
}
