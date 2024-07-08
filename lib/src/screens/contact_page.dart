import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/controllers/contacts.dart';
import 'package:flutter_contacts/src/routes.dart';
import 'package:get/get.dart';

class ContactsPage extends StatelessWidget {
  final ContactsController contactsController = Get.put(ContactsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Get.toNamed(Routes.settings);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (contactsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: contactsController.contacts.length,
          itemBuilder: (context, index) {
            final contact = contactsController.contacts[index];

            return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => contactsController.deleteContact(contact.id),
                ),
                // onTap: () => Get.to(() => EditContactPage(contact: contact)),
                onTap: () =>
                    Get.toNamed(Routes.editContact, arguments: contact));
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.toNamed(Routes.editContact, arguments: null),
      ),
    );
  }
}
