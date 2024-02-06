class TaleDetails {
  final List<double> rates;
  final List<String> reactions;
  final List<String> tags;

  TaleDetails({
    required this.rates,
    required this.reactions,
    required this.tags
  });

  TaleDetails.fromJson(Map<String, dynamic> json)
      : rates = json['rates'].cast<double>(),
        reactions = json['reactions'].cast<String>(),
        tags = json['tags'].cast<String>();

  Map<String, dynamic> toJson() => {
    'rates': rates,
    'reactions': reactions,
    'tags': tags
  };

}