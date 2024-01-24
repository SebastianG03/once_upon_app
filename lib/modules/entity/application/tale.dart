
class Tale {
  final int id;
  final String title;
  final String abstract;
  final List<String> images;
  final String content;

  Tale({
    this.id = 0,
    required this.title,
    required  this.abstract,
    required this.images,
    required this.content
  });
}