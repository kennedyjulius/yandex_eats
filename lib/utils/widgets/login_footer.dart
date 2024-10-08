
import 'package:flutter/material.dart';
import 'package:yandex_eats/utils/widgets/tappable.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("Don't have an account? "),
        Tappable.faded(
          onTap: onTap,
          child: Text(
            text,
            style: context.bodyMedium?.copyWith(fontWeight: AppFontWeight.bold),
          ),
        ),
      ],
    );
  }
}