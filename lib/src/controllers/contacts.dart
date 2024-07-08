import 'package:flutter_contacts/src/models/contact.dart';
import 'package:flutter_contacts/src/services/firestore.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  final FirestoreService firestoreService = FirestoreService();
  var contacts = <Contact>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchContacts();
    super.onInit();
  }

  void fetchContacts() {
    firestoreService.getContacts().listen((contactData) {
      contacts.assignAll(contactData);
      isLoading.value = false;
    });
  }

  void addContact(Contact contact) {
    firestoreService.addContact(contact);
  }

  void updateContact(Contact contact) {
    firestoreService.updateContact(contact);
  }

  void deleteContact(String id) {
    firestoreService.deleteContact(id);
  }
}