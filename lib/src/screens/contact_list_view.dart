import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/models/contact.dart';
import 'package:flutter_contacts/src/screens/sample_item_details_view.dart';

import '../settings/settings_view.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({
    super.key,
    this.items = const [
      Contact(1, "Sena", "sena@aol.com", "alamat"),
      Contact(2, "Sena2", "sena@aol.com", "alamat"),
      Contact(3, "Sena3", "sena@aol.com", "alamat")
    ],
  });

  static const routeName = '/';

  final List<Contact> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'contactItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.name),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                Navigator.restorablePushNamed(
                  context,
                  SampleItemDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
