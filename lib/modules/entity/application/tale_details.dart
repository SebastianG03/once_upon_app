import 'package:once_upon_app/modules/entity/application/tale.dart';

class TaleDetails {
  Tale tale;
  final List<double> rates;
  final List<String> reactions;
  final List<String> tags;

  TaleDetails({
    required this.tale,
    required this.rates,
    required this.reactions,
    required this.tags
  });

}