import 'package:flutter/material.dart';
import 'package:libertaspeople/generated/l10n.dart';

import '../colors.dart';

class ButtonBorderedWithBackArrow extends StatelessWidget {
  final Function() onPressed;
  final String previousButtonLabel;

  const ButtonBorderedWithBackArrow(
      {Key key, this.onPressed, this.previousButtonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: AppColors.lightBlue),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.white,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.lightBlue, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Icon(Icons.arrow_back_ios),
          ),
          Text(
            previousButtonLabel ?? S.of(context).previous,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
