import 'package:flutter/material.dart';

class ContactContent extends StatefulWidget {
  const ContactContent({super.key});

  @override
  State<ContactContent> createState() => _ContactContentState();
}

class _ContactContentState extends State<ContactContent> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool ableToSend = false;

  void updateButton(String _) {
    setState(() {
      ableToSend = _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _messageController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  child: TextFormField(
                    controller: _nameController,
                    onChanged: updateButton,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outlined),
                      label: Text('Name'),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: updateButton,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      label: Text('E-mail'),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _messageController,
              maxLines: 10,
              onChanged: updateButton,
              decoration: const InputDecoration(
                label: Text('Message'),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: ableToSend
                    ? () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text('Send', style: TextStyle(fontSize: 20)),
                      SizedBox(width: 10),
                      Icon(Icons.send_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
