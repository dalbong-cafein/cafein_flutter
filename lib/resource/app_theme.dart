part of 'resource.dart';

abstract class AppTheme {
  static final light = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 56,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColor.grey800,
      centerTitle: true,
      titleTextStyle: AppStyle.subTitle2Medium,
      titleSpacing: 0,
      iconTheme: IconThemeData(
        color: AppColor.grey800,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),
    textTheme: const TextTheme(
      subtitle1: AppStyle.body1,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: AppStyle.body1.copyWith(
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
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColor.grey100;
          }
          return AppColor.orange400;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColor.grey400;
          }
          return AppColor.white;
        }),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        elevation: MaterialStateProperty.all(0),
        textStyle: MaterialStateProperty.all(
          AppStyle.subTitle2Medium,
        ),
      ),
    ),
    fontFamily: 'SpoqaHanSansNeo',
  );
}
