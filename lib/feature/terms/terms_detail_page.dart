import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsDetailPage extends StatefulWidget {
  const TermsDetailPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const routeName = 'TermsDetailPage';

  @override
  State<TermsDetailPage> createState() => _TermsDetailPageState();
}

class _TermsDetailPageState extends State<TermsDetailPage> {
  int index = 0;
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: loadAsset(
            AppIcon.clear24S,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          if (widget.title == '이용약관')
            Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColor.grey50,
                  ),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 0;
                        opacity = 0;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 116,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: index == 0 ? AppColor.grey100 : AppColor.white,
                      ),
                      child: Center(
                        child: Text(
                          '서비스 이용 약관',
                          style: index == 0
                              ? AppStyle.subTitle14Medium
                              : AppStyle.body14Regular.copyWith(
                                  color: AppColor.grey500,
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        index = 1;
                        opacity = 0;
                      });
                    },
                    child: Container(
                      height: 30,
                      width: 164,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: index == 1 ? AppColor.grey100 : AppColor.white,
                      ),
                      child: Center(
                        child: Text(
                          '위치기반서비스 이용 약관',
                          style: index == 1
                              ? AppStyle.subTitle14Medium
                              : AppStyle.body14Regular.copyWith(
                                  color: AppColor.grey500,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Expanded(
            child: widget.title == '이용약관'
                ? (index == 0
                    ? AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(milliseconds: 200),
                        child: WebView(
                          key: const ValueKey(
                              'https://cafeinofficial.notion.site/075f4673bc9f48ef95fa800214acf495'),
                          initialUrl:
                              'https://cafeinofficial.notion.site/075f4673bc9f48ef95fa800214acf495',
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (controller) {
                            setState(() {
                              opacity = 1;
                            });
                          },
                        ),
                      )
                    : AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(milliseconds: 200),
                        child: WebView(
                          key: const ValueKey(
                              'https://cafeinofficial.notion.site/053249e22ca94923b7f0549e1ba4879d'),
                          initialUrl:
                              'https://cafeinofficial.notion.site/053249e22ca94923b7f0549e1ba4879d',
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated: (controller) {
                            setState(() {
                              opacity = 1;
                            });
                          },
                        ),
                      ))
                : AnimatedOpacity(
                    opacity: opacity,
                    duration: const Duration(milliseconds: 200),
                    child: WebView(
                      initialUrl:
                          'https://cafeinofficial.notion.site/7285f1a3bcd940349dccfdf040a1f532',
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (controller) {
                        setState(() {
                          opacity = 1;
                        });
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
