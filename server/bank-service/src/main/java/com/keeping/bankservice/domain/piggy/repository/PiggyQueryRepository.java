package com.keeping.bankservice.domain.piggy.repository;

import com.keeping.bankservice.api.service.piggy.dto.ShowPiggyDto;
import com.querydsl.core.types.Projections;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;

import static com.keeping.bankservice.domain.piggy.Completed.INCOMPLETED;
import static com.keeping.bankservice.domain.piggy.QPiggy.piggy;

@Repository
public class PiggyQueryRepository {

    private final JPAQueryFactory queryFactory;

    public PiggyQueryRepository(EntityManager em) {
        this.queryFactory = new JPAQueryFactory(em);
    }

    public List<ShowPiggyDto> showPiggy(String memberKey) {
        List<ShowPiggyDto> result = queryFactory
                .select(Projections.fields(ShowPiggyDto.class,
                        piggy.id,
                        piggy.childKey,
                        piggy.accountNumber,
                        piggy.content,
                        piggy.goalMoney,
                        piggy.balance,
                        piggy.savedImage,
                        piggy.completed,
                        piggy.createdDate))
                .from(piggy)
                .where(piggy.childKey.eq(memberKey), piggy.completed.eq(INCOMPLETED))
                .fetch();

        return result;
    }
}
