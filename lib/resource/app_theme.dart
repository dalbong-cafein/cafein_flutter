part of 'resource.dart';

abstract class AppTheme {
  static final light = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: 56,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.grey800,
      centerTitle: true,
      titleTextStyle: AppStyle.subTitle16Medium.copyWith(
        color: AppColor.grey800,
      ),
      titleSpacing: 0,
      iconTheme: const IconThemeData(
        color: AppColor.grey800,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: const TextTheme(
      subtitle1: AppStyle.body16Regular,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: AppStyle.body16Regular.copyWith(
        color: AppColor.grey400,
      ),
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.dialogBorderRadius),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppDimen.bottomSheetBoderRadius),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.orange500,
    ),
    scaffoldBackgroundColor: AppColor.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColor.orange100;
          }
          return AppColor.orange400;
        }),
        foregroundColor: MaterialStateProperty.all(
          AppColor.white,
        ),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          AppStyle.subTitle16Medium,
        ),
      ),
    ),
    fontFamily: 'Pretendard',
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );
}
