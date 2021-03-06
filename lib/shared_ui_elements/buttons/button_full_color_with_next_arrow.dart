import 'package:flutter/material.dart';
import 'package:libertaspeople/generated/l10n.dart';

import '../colors.dart';

class ButtonFullColorWithNextArrow extends StatelessWidget {
  final Function() onPressed;
  final bool isFinalQuestion;
  const ButtonFullColorWithNextArrow(
      {Key key, this.onPressed, this.isFinalQuestion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: AppColors.white),
        ),
        backgroundColor: MaterialStateProperty.all(AppColors.lightBlue),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              side: const BorderSide(color: AppColors.lightBlue, width: 2),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
            child: Text(
              isFinalQuestion ? S.of(context).complete : S.of(context).next,
              style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppColors.white,
          )
        ],
      ),
    );
  }
}
