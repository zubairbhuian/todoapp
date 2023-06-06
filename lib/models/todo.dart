
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String? id;
  final String? title;
  final String? body;
  final Timestamp? addtime;

  
  TodoModel({
    this.id,
    this.title,
    this.body,
    this.addtime,
  });
  factory TodoModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return TodoModel(
      id: data?['id'],
      title: data?['title'],
      body: data?['body'],
      addtime: data?['addtime'],


    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (title != null) "title": title,
      if (body != null) "body": body,
      if (addtime != null) "addtime": addtime,
    };
  }
}

