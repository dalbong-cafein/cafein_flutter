import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomOutLinedButton extends StatelessWidget {
  const BottomOutLinedButton({
    Key? key,
    required this.buttonTitle,
    required this.onTap,
  }) : super(key: key);

  final String buttonTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 44,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: AppColor.white,
          onPrimary: AppColor.grey800,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: AppColor.grey400,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
        child: Text(buttonTitle),
      ),
    );
  }
}
