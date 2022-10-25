import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

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
          foregroundColor: AppColor.grey800,
          backgroundColor: AppColor.white,
          elevation: 0,
          textStyle: AppStyle.subTitle15Medium,
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
