import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_repository.g.dart';

@riverpod
String docId(DocIdRef ref) {
  return FirebaseFirestore.instance.collection('users').doc().id;
}

class FirebaseRepository<T> {
  FirebaseRepository(
      {required this.fromFirestore,
      required this.toFirestore,
      required this.collection});

  final T Function(DocumentSnapshot<Map<String, dynamic>>, SnapshotOptions?)
      fromFirestore;
  final Map<String, dynamic> Function(T, SetOptions?) toFirestore;
  final CollectionReference collection;

  Future<void> add(T item, String docId) async {
    await collection
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .doc(docId)
        .set(item);
  }

  Future<T?>? getDocument(String id) async {
    return (await collection
            .withConverter(
                fromFirestore: fromFirestore, toFirestore: toFirestore)
            .doc(id)
            .get())
        .data();
  }

  Future<void> deleteDocument(String id) async {
    await collection.doc(id).delete();
  }

  Stream<List<T>> streamDocuments() {
    return collection
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .snapshots()
        .map((event) {
      return event.docs.map((e) => e.data()).toList();
    });
  }

  Stream<T> streamDocument(String id) {
    return collection
        .withConverter(fromFirestore: fromFirestore, toFirestore: toFirestore)
        .doc(id)
        .snapshots()
        .map((event) {
      return event.data()!;
    });
  }
}
