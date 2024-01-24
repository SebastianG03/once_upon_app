import 'package:flutter/material.dart';

class SearchStoryDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text("Build Actions")
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Text("Build Leading");
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("Build Results");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text("Build Suggestions");
  }

}