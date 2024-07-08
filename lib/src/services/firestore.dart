import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/src/models/contact.dart';

class FirestoreService {
  final CollectionReference contactsCollection =
      FirebaseFirestore.instance.collection('contacts');

  Future<void> addContact(Contact contact) {
    return contactsCollection.doc(contact.id).set(contact.toMap());
  }

  Future<void> updateContact(Contact contact) {
    return contactsCollection.doc(contact.id).update(contact.toMap());
  }

  Future<void> deleteContact(String id) {
    return contactsCollection.doc(id).delete();
  }

  Stream<List<Contact>> getContacts() {
    return contactsCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Contact.fromMap(doc.data() as Map<String, dynamic>)).toList());
  }
}