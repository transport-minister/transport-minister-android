import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../helpers/game_fonts.dart';

Set<int> _characters(String language) {
  final strings = jsonDecode(File('lib/l10n/app_$language.arb').readAsStringSync()) as Map;
  final characters = <int>{};
  for (final entry in strings.entries) {
    final key = entry.key as String;
    if (key.startsWith('@')) {
      continue;
    }
    final text = (entry.value as String)
        .replaceAll(RegExp(r'\{\w+, plural,'), '')
        .replaceAll(RegExp(r'(=\d+|zero|one|two|few|many|other)\{'), '')
        .replaceAll(RegExp(r'\{\w+\}'), '');
    characters.addAll(text.runes.where((rune) => rune > 0x20 && rune != 0x7B && rune != 0x7D));
  }
  return characters;
}

String _show(Iterable<int> runes) => runes.map(String.fromCharCode).join(' ');

void main() {
  final fredoka = [for (final file in fredokaFiles) fontCharacters(file)];
  final fallback = [for (final file in fallbackFiles) fontCharacters(file)];
  const flourishes = {0x21C4};

  for (final language in const ['en', 'tr']) {
    test('every $language letter is drawn by the game font itself', () {
      for (final (index, covered) in fredoka.indexed) {
        final missing = _characters(language).difference(covered).difference(flourishes);

        expect(missing, isEmpty, reason: '${fredokaFiles[index]} lacks ${_show(missing)}');
      }
    });
  }

  test('every Russian letter is drawn by the game fonts', () {
    for (var weight = 0; weight < fredoka.length; weight++) {
      final covered = {...fredoka[weight], ...fallback[weight]};
      final missing = _characters('ru').difference(covered).difference(flourishes);

      expect(missing, isEmpty, reason: 'weight $weight lacks ${_show(missing)}');
    }
  });

  test('Turkish letters never fall back to another font', () {
    for (final covered in fredoka) {
      expect(covered, containsAll('çÇğĞıİöÖşŞüÜ'.runes));
    }
  });
}
