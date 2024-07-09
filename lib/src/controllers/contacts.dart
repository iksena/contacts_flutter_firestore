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
    isLoading.value = true;
    firestoreService.getContacts().listen((contactData) {
      contacts.assignAll(contactData);
      isLoading.value = false;
    });
  }

  Future<bool> addContact(Contact contact) async {
    try {
      isLoading.value = true;
      await firestoreService.addContact(contact);
    } catch (e) {
      isLoading.value = false;
      return false;
    }

    isLoading.value = false;
    return true;
  }

  Future<bool> updateContact(Contact contact) async {
    try {
      isLoading.value = true;
      await firestoreService.updateContact(contact);
    } catch (e) {
      isLoading.value = false;
      return false;
    }

    isLoading.value = false;
    return true;
  }

  void deleteContact(String id) {
    firestoreService.deleteContact(id);
  }
}
