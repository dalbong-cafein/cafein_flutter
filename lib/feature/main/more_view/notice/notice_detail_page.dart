
import 'package:cafein_flutter/feature/main/more_view/notice/bloc/notice_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/datetime/ymd_dot_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoticeDetailPage extends StatelessWidget {
  const NoticeDetailPage({
    Key? key,
    required this.boardId,
  }) : super(key: key);

  final int boardId;

  static const routeName = 'NoticeDetailPage';

  @override
  Widget build(BuildContext context) {
    context.read<NoticeBloc>().add(
      NoticeDetailRequested(clickedBoardId: boardId),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('공지사항'),
      ),
      body: BlocBuilder<NoticeBloc, NoticeState>(
        builder: (context, state) {
          if(state is NoticeDetailLoaded){
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
                          state.board.title,
                          style: AppStyle.subTitle16Medium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ymdDotFormat(state.board.registeredDateTime),
                          style: AppStyle.caption13Regular.copyWith(
                            color: AppColor.grey400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      state.board.content,
                      style: AppStyle.body14Regular,
                    ),
                  ),
                ],
              ),
            );
          }else{
            return const SizedBox.shrink();
          }

        }
      ),
    );
  }
}
