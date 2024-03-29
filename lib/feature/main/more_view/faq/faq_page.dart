import 'dart:math';

import 'package:cafein_flutter/data/model/board/board.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/bloc/faq_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/faq/widget/custom_expansion_tile.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/button/bottom_out_lined_button.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
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

  late final width = MediaQuery.of(context).size.width;
  late final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

  @override
  Widget build(BuildContext context) {
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
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: loadAsset(AppIcon.left),
          ),
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
                      itemBuilder: (context, index) => _FaqCard(
                        faq: state.faqs[index],
                      ),
                      separatorBuilder: (context, index) => Container(
                        height: 1,
                        width: width - 40,
                        color: AppColor.grey100,
                      ),
                      itemCount: state.faqs.length,
                    ),
                  );
                }
                return const CustomCircleLoadingIndicator();
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
            SizedBox(
              height: bottomPadding != 0 ? bottomPadding : 12,
            ),
          ],
        ),
      ),
    );
  }
}

class _FaqCard extends StatefulWidget {
  const _FaqCard({
    required this.faq,
  });

  final Board faq;

  @override
  State<_FaqCard> createState() => __FaqCardState();
}

class __FaqCardState extends State<_FaqCard>
    with AutomaticKeepAliveClientMixin {
  bool isExpanded = false;

  late final width = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomExpansionTile(
      tilePadding: EdgeInsets.zero,
      trailing: Transform.rotate(
        angle: pi * 3 / 2,
        child: loadAsset(
          AppIcon.left,
          width: 16,
        ),
      ),
      onExpansionChanged: (value) => setState(() => isExpanded = !isExpanded),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: 'Q  ',
                  style: AppStyle.subTitle15Medium.copyWith(
                    color: AppColor.orange500,
                  ),
                  children: [
                    TextSpan(
                      text: widget.faq.title,
                      style: AppStyle.subTitle15Medium.copyWith(
                        color: AppColor.grey800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedRotation(
              turns: isExpanded ? 0.5 : 0,
              duration: const Duration(milliseconds: 200),
              child: loadAsset(
                AppIcon.downXS,
                width: 20,
                color: AppColor.grey400,
              ),
            ),
          ],
        ),
      ),
      childrenPadding: EdgeInsets.zero,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            color: AppColor.grey100,
          ),
          child: Text(
            widget.faq.content,
            style: AppStyle.body14Regular,
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
