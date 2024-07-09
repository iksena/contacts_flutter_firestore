import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/controllers/contacts.dart';
import 'package:flutter_contacts/src/models/contact.dart';
import 'package:get/get.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({super.key});

  @override
  _EditContactPageState createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _phone;
  late String _email;
  late String _address;
  Contact? contact;

  @override
  void initState() {
    super.initState();
    contact = Get.arguments;
    _name = contact?.name ?? '';
    _phone = contact?.phone ?? '';
    _email = contact?.email ?? '';
    _address = contact?.address ?? '';
  }

  String? nameValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name';
    }
    if (value.length <= 3 || value.length > 100) {
      return 'Name should be more than 3 chars and under 100 chars';
    }
    return null;
  }

  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }

    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value) || value.length > 300) {
      return 'Please enter a valid email';
    }

    return null;
  }

  String? phoneValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  String? addressValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an address';
    }
    if (value.length <= 3 || value.length > 500) {
      return 'Address should be more than 3 chars and under 500 chars';
    }
    return null;
  }

  void Function() onPressedSubmit(contactsController) {
    return () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        final savedContact = Contact(
            id: contact?.id ?? DateTime.now().toString(),
            name: _name,
            phone: _phone,
            email: _email,
            address: _address);

        if (contact == null) {
          contactsController.addContact(savedContact);
        } else {
          contactsController.updateContact(savedContact);
        }

        Get.back();
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    final contactsController = Get.find<ContactsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(contact == null ? 'New Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: nameValidator,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _phone,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: phoneValidator,
                onSaved: (value) => _phone = value!,
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: emailValidator,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                initialValue: _address,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: addressValidator,
                onSaved: (value) => _address = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onPressedSubmit(contactsController),
                child: Text(contact == null ? 'Add' : 'Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
