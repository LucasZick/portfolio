import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AnimatedTextWithButton extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  const AnimatedTextWithButton({
    super.key,
    required this.text,
    required this.textStyle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedTextWithButtonState createState() => _AnimatedTextWithButtonState();
}

class _AnimatedTextWithButtonState extends State<AnimatedTextWithButton> {
  bool isTextVisible = false;
  int? maxLines = 10; // Valor inicial de maxLines

  void toggleTextVisibility() {
    setState(() {
      isTextVisible = !isTextVisible;
      maxLines = isTextVisible ? null : 10; // Atualizando o valor de maxLines
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 250),
          crossFadeState: isTextVisible
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Text(
            widget.text,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            maxLines: maxLines, // Usando o valor atualizado de maxLines
            style: widget.textStyle,
          ),
          secondChild: Text(
            widget.text,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.start,
            maxLines: maxLines, // Usando o valor atualizado de maxLines
            style: widget.textStyle,
          ),
        ),
        TextButton(
          onPressed:
              toggleTextVisibility, // Usando a função para inverter a visibilidade do texto
          child: Text(
            isTextVisible ? "less".tr() : "more".tr(),
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
