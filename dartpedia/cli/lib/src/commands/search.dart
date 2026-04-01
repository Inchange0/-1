import 'dart:async';
import 'dart:io';

import 'package:command_runner/command_runner.dart';
import 'package:logging/logging.dart';
import 'package:wikipedia/wikipedia.dart';

class SearchCommand extends Command {
  SearchCommand({required this.logger});

  final Logger logger;

  @override
  String get description => 'Search for Wikipedia articles.';

  @override
  bool get requiresArgument => true;

  @override
  String get name => 'search';

  @override
  String get valueHelp => 'STRING';

  @override
  String get help =>
      'Prints a list of links to Wikipedia articles that match the given term.';

  @override
  FutureOr<String> run(ArgResults args) async {
    if (requiresArgument &&
        (args.commandArg == null || args.commandArg!.isEmpty)) {
      return 'Please include a search term';
    }

    final buffer = StringBuffer('Search results:');
    final SearchResults results = await search(args.commandArg!);

    for (var result in results.results) {
      buffer.writeln('${result.title} - ${result.url}');
    }
    return buffer.toString();
  }
}
