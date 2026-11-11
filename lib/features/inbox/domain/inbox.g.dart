// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GameNotification _$GameNotificationFromJson(Map<String, dynamic> json) => _GameNotification(
  id: (json['id'] as num).toInt(),
  kind: $enumDecode(_$NotificationKindEnumMap, json['kind']),
  createdAtMs: (json['createdAtMs'] as num).toInt(),
  data:
      (json['data'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(k, e as String)) ?? const {},
  read: json['read'] as bool? ?? false,
);

Map<String, dynamic> _$GameNotificationToJson(_GameNotification instance) => <String, dynamic>{
  'id': instance.id,
  'kind': _$NotificationKindEnumMap[instance.kind]!,
  'createdAtMs': instance.createdAtMs,
  'data': instance.data,
  'read': instance.read,
};

const _$NotificationKindEnumMap = {
  NotificationKind.decision: 'decision',
  NotificationKind.disaster: 'disaster',
  NotificationKind.autoDecision: 'autoDecision',
  NotificationKind.project: 'project',
  NotificationKind.buses: 'buses',
  NotificationKind.budget: 'budget',
  NotificationKind.levelUp: 'levelUp',
  NotificationKind.promotion: 'promotion',
  NotificationKind.achievement: 'achievement',
  NotificationKind.badge: 'badge',
  NotificationKind.warning: 'warning',
  NotificationKind.averted: 'averted',
  NotificationKind.dismissed: 'dismissed',
};

_Inbox _$InboxFromJson(Map<String, dynamic> json) => _Inbox(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => GameNotification.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  nextId: (json['nextId'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$InboxToJson(_Inbox instance) => <String, dynamic>{
  'items': instance.items.map((e) => e.toJson()).toList(),
  'nextId': instance.nextId,
};
