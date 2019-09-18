import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByString(String searchField) {
    return Firestore.instance
        .collection('client')
        .where('taskname',
            isEqualTo: searchField.substring(0, 1).toUpperCase())
        .getDocuments();
  }
}