import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox.freezed.dart';
part 'inbox.g.dart';

enum NotificationKind {
  decision,
  disaster,
  autoDecision,
  project,
  buses,
  budget,
  levelUp,
  promotion,
  achievement,
  badge,
  warning,
  averted,
  dismissed,
  technology,
  metro,
  cityComplete,
}

@freezed
abstract class GameNotification with _$GameNotification {
  const factory GameNotification({
    required int id,
    required NotificationKind kind,
    required int createdAtMs,
    @Default({}) Map<String, String> data,
    @Default(false) bool read,
  }) = _GameNotification;

  factory GameNotification.fromJson(Map<String, dynamic> json) => _$GameNotificationFromJson(json);
}

@freezed
abstract class Inbox with _$Inbox {
  const factory Inbox({@Default([]) List<GameNotification> items, @Default(1) int nextId}) = _Inbox;

  const Inbox._();

  factory Inbox.fromJson(Map<String, dynamic> json) => _$InboxFromJson(json);

  int get unread => items.where((item) => !item.read).length;
}
