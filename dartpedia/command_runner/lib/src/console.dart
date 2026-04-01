import 'dart:io';

const String ansiEscapeLiteral = '\x1B';

Future<void> write(String text, {int duration = 50}) async {
  final List<String> lines = text.split('\n');
  for (final String l in lines) {
    await _delayedPrint('$l \n', duration: duration);
  }
}

/// Prints line-by-line
Future<void> _delayedPrint(String text, {int duration = 0}) async {
  return Future<void>.delayed(
    Duration(milliseconds: duration),
    () => stdout.write(text),
  );
}

enum ConsoleColor {
  lightBlue(184, 234, 254),
  red(242, 93, 80),
  yellow(249, 248, 196),
  grey(240, 240, 240),
  white(255, 255, 255);

  const ConsoleColor(this.r, this.g, this.b);

  final int r;
  final int g;
  final int b;
}
