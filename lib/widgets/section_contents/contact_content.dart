import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/utils/validators.dart';

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

  void _updateButton(String _) {
    setState(() {
      ableToSend = _nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _messageController.text.isNotEmpty;
    });
  }

  void _resetControllers() {
    _nameController.text = '';
    _emailController.text = '';
    _messageController.text = '';
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
                    onChanged: _updateButton,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_outlined),
                      label: Text("name".tr()),
                      border: const OutlineInputBorder(),
                    ),
                    validator: Validators.validateName,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: _updateButton,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      label: Text("email".tr()),
                      border: const OutlineInputBorder(),
                    ),
                    validator: Validators.validateEmail,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _messageController,
              maxLines: 10,
              onChanged: _updateButton,
              decoration: InputDecoration(
                label: Text("message".tr()),
                border: const OutlineInputBorder(),
              ),
              validator: Validators.validateMessage,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: ableToSend
                    ? () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          await Future.delayed(const Duration(seconds: 5));
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Message sent')),
                          );
                          _resetControllers();
                          _updateButton('');
                        }
                      }
                    : null,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("send_message".tr(),
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(width: 10),
                      const Icon(Icons.send_rounded),
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
