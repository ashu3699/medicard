import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

import '../user_model.dart';
import 'details.dart';

class FindUser extends StatefulWidget {
  const FindUser({super.key});

  @override
  State<FindUser> createState() => _FindUserState();
}

class _FindUserState extends State<FindUser> {
  final box = Hive.box<Person>('personList');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Patient'),
      ),
      body: ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
          final person = box.getAt(index);
          return ListTile(
            title: Text(person!.name),
            subtitle: Text(person.phone),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(person: person),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
