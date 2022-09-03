import 'package:cafein_flutter/feature/main/main_page.dart';
import 'package:cafein_flutter/feature/onboard/widget/circle_step_indicator.dart';
import 'package:cafein_flutter/feature/onboard/widget/onboard_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  static const routeName = 'OnboardPage';

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  final controller = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.grey50,
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) => setState(() => pageIndex = index),
              itemBuilder: (context, index) => OnboardCard(
                index: index,
              ),
              itemCount: 4,
            ),
          ),
          SizedBox(
            height: bottomPadding > 0 ? 108 + bottomPadding : 108,
            child: Padding(
              padding: EdgeInsets.only(
                top: 16,
                right: 16,
                left: 16,
                bottom: bottomPadding > 0 ? 20 + bottomPadding : 20,
              ),
              child: Column(
                children: [
                  CircleStepIndicator(
                    index: pageIndex,
                  ),
                  const Spacer(),
                  pageIndex != 3
                      ? Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () => Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                    MainPage.routeName,
                                    (route) => false,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColor.white,
                                    onPrimary: AppColor.grey800,
                                    elevation: 0,
                                    textStyle: AppStyle.subTitle15Medium,
                                    side: const BorderSide(
                                      color: AppColor.grey400,
                                    ),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: const Text('건너뛰기'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SizedBox(
                                height: 44,
                                child: ElevatedButton(
                                  onPressed: () => controller.animateToPage(
                                    pageIndex + 1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.linear,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColor.orange400,
                                    onPrimary: AppColor.white,
                                    textStyle: AppStyle.subTitle15Medium,
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  child: const Text('다음'),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          height: 44,
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () =>
                                Navigator.of(context).pushNamedAndRemoveUntil(
                              MainPage.routeName,
                              (route) => false,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.orange400,
                              onPrimary: AppColor.white,
                              textStyle: AppStyle.subTitle15Medium,
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                            ),
                            child: const Text('시작하기'),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
