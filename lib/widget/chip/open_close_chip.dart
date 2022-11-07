import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class OpenCloseChip extends StatelessWidget {
  const OpenCloseChip({
    Key? key,
    required this.isOpen,
  }) : super(key: key);

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isOpen ? 37 : 47,
      decoration: BoxDecoration(
        border: Border.all(
          color: isOpen ? AppColor.orange500 : AppColor.grey500,
        ),
        borderRadius: BorderRadius.circular(4),
        color: AppColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 1.5, bottom: 3),
        child: Center(
          child: Text(
            isOpen ? '영업중' : '영업종료',
            style: AppStyle.caption11Regular.copyWith(
              height: 1,
              color: isOpen ? AppColor.orange500 : AppColor.grey500,
            ),
          ),
        ),
      ),
    );
  }
}
