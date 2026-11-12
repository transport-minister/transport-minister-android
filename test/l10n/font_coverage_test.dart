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
  const flourishes = {0x21C4};

  for (final language in const ['en', 'tr', 'ru']) {
    test('every $language letter is drawn by the game font itself', () {
      for (final (index, covered) in fredoka.indexed) {
        final missing = _characters(language).difference(covered).difference(flourishes);

        expect(missing, isEmpty, reason: '${fredokaFiles[index]} lacks ${_show(missing)}');
      }
    });
  }

  test('Turkish and Russian letters never fall back to another font', () {
    for (final covered in fredoka) {
      expect(covered, containsAll('çÇğĞıİöÖşŞüÜ'.runes));
      expect(covered, containsAll([for (var letter = 0x0410; letter <= 0x044F; letter++) letter]));
      expect(covered, containsAll('ёЁ'.runes));
    }
  });
}
