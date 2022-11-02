import 'package:cafein_flutter/feature/main/more_view/notice/bloc/notice_bloc.dart';
import 'package:cafein_flutter/feature/main/more_view/notice/notice_detail_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticePage extends StatefulWidget {
  const NoticePage({Key? key}) : super(key: key);

  static const routeName = 'NoticePage';

  @override
  State<NoticePage> createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<NoticeBloc>().add(
            const NoticeRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoticeBloc, NoticeState>(
      listener: (context, state) {
        if (state is NoticeError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('공지사항'),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: loadAsset(AppIcon.left),
          ),
        ),
        body: BlocBuilder<NoticeBloc, NoticeState>(
          buildWhen: (pre, next) => next is NoticeLoaded,
          builder: (context, state) {
            if (state is NoticeLoaded) {
              if (state.boards.isEmpty) {
                return const Center(
                  child: Text('등록된 공지사항이 없어요'),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    NoticeDetailPage.routeName,
                    arguments: state.boards[index].boardId ,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.boards[index].title,
                          style: AppStyle.subTitle15Medium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          ymdDotFormat(state.boards[index].registeredDateTime),
                          style: AppStyle.caption13Regular.copyWith(
                            color: AppColor.grey400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: state.boards.length,
                separatorBuilder: (context, index) => Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  color: AppColor.grey50,
                ),
              );
            }
            return const CustomCircleLoadingIndicator();
          },
        ),
      ),
    );
  }
}
