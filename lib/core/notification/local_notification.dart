import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:handover/core/utils/colors.dart';

class LocalNotification {
  static init() async {
    await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
              channelGroupKey: 'handover_group',
              channelKey: 'handover_key',
              channelName: 'Handover Notifications',
              channelDescription: 'Notification channel for Handover',
              defaultColor: primaryColor,
              ledColor: Colors.white)
        ],
        debug: true);
  }

  static pushNotification({required String title, required String body}) {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: Random().nextInt(999),
            channelKey: 'handover_key',
            title: title,
            body: body,
            actionType: ActionType.Default));
  }
}
