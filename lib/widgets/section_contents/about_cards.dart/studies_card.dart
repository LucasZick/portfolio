import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

class StudiesCard extends StatelessWidget {
  const StudiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'FORMAL STUDIES',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.school_outlined),
                  title: const Text('Web Development - SENAI SC'),
                  subtitle: const Text('Technical Course'),
                  trailing: CircleFlag('br'),
                ),
                ListTile(
                  leading: const Icon(Icons.school_outlined),
                  title: const Text('Information Systems - UDESC'),
                  subtitle: const Text('Graduation Degree'),
                  trailing: CircleFlag('br'),
                ),
                ListTile(
                  leading: const Icon(Icons.school_outlined),
                  title: const Text('International Business - HTW Berlin'),
                  subtitle: const Text('Graduation Degree'),
                  trailing: CircleFlag('de'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
