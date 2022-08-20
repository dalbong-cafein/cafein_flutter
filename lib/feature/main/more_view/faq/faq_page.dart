import 'package:cafein_flutter/feature/main/more_view/faq/bloc/faq_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/widget/custom_expansion_tile.dart';
import 'package:cafein_flutter/resource/resource.dart';
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
                        title: Text(
                          state.faqs[index].title,
                          style: AppStyle.subTitle15Medium,
                        ),
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
            const SizedBox(height: 12),
            SizedBox(
              height: 44,
              width: width - 40,
              child: ElevatedButton(
                onPressed: () async => await launchUrl(
                  Uri.parse(
                    'mailto:dalbong.cafein@gmail.com',
                  ),
                ),
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
                child: const Text('1:1 문의하기'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
