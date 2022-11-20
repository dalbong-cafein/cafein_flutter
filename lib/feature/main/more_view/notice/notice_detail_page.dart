import 'package:cafein_flutter/feature/main/more_view/notice/bloc/notice_detail_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/link_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({
    Key? key,
  }) : super(key: key);

  static const routeName = 'NoticeDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
      ),
      body: BlocBuilder<NoticeDetailBloc, NoticeDetailState>(
        builder: (context, state) {
          if (state is NoticeDetailLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColor.grey50,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.notice.title,
                          style: AppStyle.subTitle16Medium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ymdDotFormat(state.notice.registeredDateTime),
                          style: AppStyle.caption13Regular.copyWith(
                            color: AppColor.grey400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if ((state.notice.imageIdPairs ?? []).isNotEmpty)
                    const SizedBox(
                      height: 20,
                    ),
                  if ((state.notice.imageIdPairs ?? []).isNotEmpty)
                    ...state.notice.imageIdPairs!.map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: Image.network(
                            e.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: LinkText(
                      state.notice.content,
                      linkStyle: AppStyle.body14Regular.copyWith(
                        color: AppColor.orange500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
