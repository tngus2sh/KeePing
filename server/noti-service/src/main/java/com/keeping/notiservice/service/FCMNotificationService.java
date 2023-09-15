package com.keeping.notiservice.service;

import com.completionism.keeping.sample.notification.api.request.FCMNotificationRequest;

public interface FCMNotificationService {
    public String sendNotification(FCMNotificationRequest request);
}
