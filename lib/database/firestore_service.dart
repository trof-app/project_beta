// import 'package:flutter_starter/models/vendor_model/vendor_model.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._();
  static final instance = FirestoreService._();

  Future<void> setData(
      {@required String path,
      @required Map<String, dynamic> data,
      bool merge = true}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path: $data');
    await reference.set(data, SetOptions(merge: merge));
  }

  Future<dynamic> getData({
    @required String path,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('$path');
    await reference.get().then((documentSnapshot) => documentSnapshot.data());
  }

  Future<void> bulkSet({
    @required String path,
    @required List<Map<String, dynamic>> datas,
    bool merge = false,
  }) async {
    final reference = FirebaseFirestore.instance.doc(path);
    final batchSet = FirebaseFirestore.instance.batch();

    print('$path: $datas');
  }

  Future<void> deleteData({@required String path}) async {
    final reference = FirebaseFirestore.instance.doc(path);
    print('Delete: $path');
    await reference.delete();
  }

  Future<List<T>> collectionGet<T>(
      {@required String path,
      @required T builder(Map<String, dynamic> data, String documentID),
      Query queryBuilder(Query query),
      int sort(T lhs, T rhs)}) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Future<QuerySnapshot> snapshots = query.get();
    return snapshots.then((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<T>> collectionStream<T>(
      {@required String path,
      @required T builder(Map<String, dynamic> data, String documentID),
      Query queryBuilder(Query query),
      int sort(T lhs, T rhs)}) {
    Query query = FirebaseFirestore.instance.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<T>> collectionFilteredStream<T>(
      {@required String path,
      @required String filterKey,
      @required String filterValue,
      @required T builder(Map<String, dynamic> data, String documentID),
      Query queryBuilder(Query query),
      int sort(T lhs, T rhs)}) {
    Query query = FirebaseFirestore.instance
        .collection(path)
        .where(filterKey, isEqualTo: filterValue);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<List<T>> collectionFilteredArrayStream<T>(
      {@required String path,
      @required String filterKey,
      @required String filterValue,
      @required T builder(Map<String, dynamic> data, String documentID),
      Query queryBuilder(Query query),
      int sort(T lhs, T rhs)}) {
    Query query = FirebaseFirestore.instance
        .collection(path)
        .where(filterKey, arrayContains: filterValue);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final Stream<QuerySnapshot> snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    @required String path,
    @required T builder(Map<String, dynamic> data, String documentId),
  }) {
    final DocumentReference reference = FirebaseFirestore.instance.doc(path);
    final Stream<DocumentSnapshot> snapshots = reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }
}
