import 'dart:io';

import 'package:flutter/services.dart';

const fredokaFiles = [
  'assets/fonts/fredoka/Fredoka-Medium.ttf',
  'assets/fonts/fredoka/Fredoka-SemiBold.ttf',
  'assets/fonts/fredoka/Fredoka-Bold.ttf',
];

Future<void> loadGameFonts() async {
  final loader = FontLoader('Fredoka');
  for (final file in fredokaFiles) {
    loader.addFont(Future.value(ByteData.sublistView(File(file).readAsBytesSync())));
  }
  await loader.load();
}

Set<int> fontCharacters(String file) {
  final data = ByteData.sublistView(File(file).readAsBytesSync());
  final tables = data.getUint16(4);
  for (var index = 0; index < tables; index++) {
    final record = 12 + index * 16;
    if (String.fromCharCodes(data.buffer.asUint8List(data.offsetInBytes + record, 4)) == 'cmap') {
      return _cmapCharacters(data, data.getUint32(record + 8));
    }
  }
  return const {};
}

Set<int> _cmapCharacters(ByteData data, int cmap) {
  final characters = <int>{};
  final subtables = data.getUint16(cmap + 2);
  for (var index = 0; index < subtables; index++) {
    final offset = cmap + data.getUint32(cmap + 4 + index * 8 + 4);
    switch (data.getUint16(offset)) {
      case 4:
        characters.addAll(_format4(data, offset));
      case 12:
        characters.addAll(_format12(data, offset));
    }
  }
  return characters;
}

Iterable<int> _format4(ByteData data, int offset) sync* {
  final segments = data.getUint16(offset + 6) ~/ 2;
  final ends = offset + 14;
  final starts = ends + segments * 2 + 2;
  final deltas = starts + segments * 2;
  final ranges = deltas + segments * 2;
  for (var segment = 0; segment < segments; segment++) {
    final start = data.getUint16(starts + segment * 2);
    final end = data.getUint16(ends + segment * 2);
    final delta = data.getUint16(deltas + segment * 2);
    final rangeAt = ranges + segment * 2;
    final range = data.getUint16(rangeAt);
    for (var character = start; character <= end && character != 0xFFFF; character++) {
      final glyph = range == 0
          ? (character + delta) & 0xFFFF
          : data.getUint16(rangeAt + range + (character - start) * 2);
      if (glyph != 0) {
        yield character;
      }
    }
  }
}

Iterable<int> _format12(ByteData data, int offset) sync* {
  final groups = data.getUint32(offset + 12);
  for (var group = 0; group < groups; group++) {
    final record = offset + 16 + group * 12;
    for (
      var character = data.getUint32(record);
      character <= data.getUint32(record + 4);
      character++
    ) {
      yield character;
    }
  }
}
