package com.keeping.notiservice.api;

import com.completionism.keeping.sample.notification.api.request.FCMNotificationRequest;
import com.completionism.keeping.sample.notification.service.FCMNotificationService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/notification")
public class FCMNotificationApiController {

    private final FCMNotificationService fcmNotificationService;

    @PostMapping
    public String sendNotification(@RequestBody FCMNotificationRequest request) {
        return fcmNotificationService.sendNotification(request);
    }
}
