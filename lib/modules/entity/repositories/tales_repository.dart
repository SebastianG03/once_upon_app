import 'package:once_upon_app/modules/entity/application/tale.dart';

abstract class TalesRepositoryModel {
  Future postTale(Tale tale);
  Future<List<Tale>> getTales();
  Future deleteTale(Tale tale);
}