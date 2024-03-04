import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lucaszick/providers/configs.dart';
import 'package:lucaszick/utils/send_message.dart';
import 'package:lucaszick/utils/validators.dart';
import 'package:provider/provider.dart';

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
  bool loading = false;

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

  void _toggleLoading(bool state) {
    setState(() {
      loading = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    Configs configsProvider = Provider.of<Configs>(context, listen: true);
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
                          _toggleLoading(true);
                          String result = await MessageSender.sendMessage({
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "message": _messageController.text,
                            "language": configsProvider.getLanguage(),
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result),
                            duration: const Duration(seconds: 3),
                            action: SnackBarAction(
                              label: 'Dismiss',
                              onPressed: ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar,
                            ),
                          ));
                          _resetControllers();
                          _toggleLoading(false);
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
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: loading
                              ? const CircularProgressIndicator()
                              : const Icon(Icons.send_rounded, size: 20)),
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
