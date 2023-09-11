package com.keeping.memberservice.api.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Random;
import java.util.concurrent.TimeUnit;

@RequiredArgsConstructor
@Service
@Transactional(readOnly = true)
@Slf4j
public class AuthService {

    private final RedisTemplate<String, String> redisTemplate;
    private static final String CERTIFICATION_REQUEST = "certification_request";
    private static final long CERTIFICATION_NUMBER_EXPIRE = 200;


    public String getRandomCertification(String phone) {
        String number = createRandomNumCode();

        String certification_request = CERTIFICATION_REQUEST + phone;
        redisTemplate.opsForValue().append(CERTIFICATION_REQUEST + phone, number);
        redisTemplate.expire(certification_request, CERTIFICATION_NUMBER_EXPIRE, TimeUnit.SECONDS);

        return number;
    }

    public String createRandomNumCode() {
        Random rand = new Random();
        StringBuilder numStr = new StringBuilder();

        for (int i = 0; i < 6; i++) {
            String ran = String.valueOf(rand.nextInt(10));
            numStr.append(ran);
        }

        return numStr.toString();
    }
}
