import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:once_upon_app/modules/entity/application/application_models.dart';

class TalesDatasource {
  final CollectionReference _talesCollection = FirebaseFirestore.instance.collection('tales');


  //Tale methods
  Future postTale(Tale tale) async {
    try {
      var snapshot = await _talesCollection
          .where('author', isEqualTo: tale.author)
          .where('title', isEqualTo: tale.title)
          .get();
      if(snapshot.docs.isNotEmpty) throw Exception('User already posted this tale');

      return await _talesCollection.doc(tale.id).set(tale.toJson());

    } catch (e) {
      if (kDebugMode) print("Error posting tale: $e");
      return null;
    }
  }

  Future<List<Tale>> getTales() async {
    try {
      var snapshot = await _talesCollection.get();

      return snapshot.docs.map((e) => Tale.fromJson(e.data() as Map<String, dynamic>)).toList();

    } catch (e) {
      if (kDebugMode) print("Error getting tales: $e");
      return [];
    }
  }

  Future deleteTale(Tale tale) async {
    try {
      var snapshot = await _talesCollection
          .where('id', isEqualTo: tale.id)
          .get();

      if(snapshot.docs.isEmpty) throw Exception('Tale does not exist');

      return await _talesCollection.doc(tale.id).delete();
    } catch (e) {
      if (kDebugMode) print("Error deleting tale: $e");
      return null;
    }
  }

}