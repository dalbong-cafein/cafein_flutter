import 'package:cafein_flutter/feature/main/more_view/faq/bloc/faq_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/widget/custom_expansion_tile.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/widget/button/bottom_out_lined_button.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  static const routeName = 'FaqPage';

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<FaqBloc>().add(
            const FaqRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocListener<FaqBloc, FaqState>(
      listener: (context, state) {
        if (state is FaqError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('자주 묻는 질문'),
        ),
        body: Column(
          children: [
            BlocBuilder<FaqBloc, FaqState>(
              buildWhen: (pre, next) => next is FaqLoaded,
              builder: (context, state) {
                if (state is FaqLoaded) {
                  if (state.faqs.isEmpty) {
                    return const Center(
                      child: Text('빈화면'),
                    );
                  }
                  return Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      itemBuilder: (context, index) => CustomExpansionTile(
                        title: RichText(
                          text: TextSpan(
                            text: 'Q  ',
                            style: AppStyle.subTitle15Medium.copyWith(
                              color: AppColor.orange500,
                            ),
                            children: [
                              TextSpan(
                                text: state.faqs[index].title,
                                style: AppStyle.subTitle15Medium.copyWith(
                                  color: AppColor.grey800,
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              color: AppColor.grey50,
                            ),
                            child: Text(
                              state.faqs[index].content,
                              style: AppStyle.body14Regular,
                            ),
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        width: width - 40,
                        color: AppColor.grey50,
                      ),
                      itemCount: state.faqs.length,
                    ),
                  );
                }
                return const CircleLoadingIndicator();
              },
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BottomOutLinedButton(
                buttonTitle: '1:1 문의하기',
                onTap: () async => await launchUrl(
                  Uri.parse(
                    'mailto:dalbong.cafein@gmail.com',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
