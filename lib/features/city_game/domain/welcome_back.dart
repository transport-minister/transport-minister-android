import 'package:freezed_annotation/freezed_annotation.dart';

part 'welcome_back.freezed.dart';

@freezed
abstract class WelcomeBack with _$WelcomeBack {
  const factory WelcomeBack({required int awaySeconds, required int earnings}) = _WelcomeBack;
}
