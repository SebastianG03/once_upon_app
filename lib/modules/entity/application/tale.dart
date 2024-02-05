
import 'package:once_upon_app/modules/entity/application/tale_details.dart';
import 'package:once_upon_app/modules/entity/application/user.dart';
import 'package:uuid/uuid.dart';

class Tale {
  final String id;
  final UserModel author;
  final String title;
  final String abstract;
  final List<String> images;
  final String content;
  final TaleDetails details;

  Tale({
    required this.title,
    required this.author,
    required  this.abstract,
    required this.images,
    required this.content,
    required this.details
  }) : id = const Uuid().v4();

  Tale.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        author = UserModel.fromJson(json['author']),
        title = json['title'],
        abstract = json['abstract'],
        images = json['images'].cast<String>(),
        content = json['content'],
        details = TaleDetails.fromJson(json['details']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'author': author.toJson(),
    'title': title,
    'abstract': abstract,
    'images': images,
    'content': content,
    'details': details.toJson()
  };
}