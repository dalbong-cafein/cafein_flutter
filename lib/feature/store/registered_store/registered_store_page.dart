import 'package:cafein_flutter/feature/store/registered_store/bloc/registered_store_bloc.dart';
import 'package:cafein_flutter/feature/store/registered_store/widget/registered_store_card.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisteredStorePage extends StatefulWidget {
  const RegisteredStorePage({Key? key}) : super(key: key);

  static const routeName = 'RegisteredStorePage';

  @override
  State<RegisteredStorePage> createState() => _RegisteredStorePageState();
}

class _RegisteredStorePageState extends State<RegisteredStorePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<RegisteredStoreBloc>().add(
            const RegisteredStoreRequested(),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return BlocListener<RegisteredStoreBloc, RegisteredStoreState>(
      listener: (context, state) {
        if (state is RegisteredStoreError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '내가 등록한 카페',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 42,
              width: width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: BlocBuilder<RegisteredStoreBloc, RegisteredStoreState>(
                    buildWhen: (pre, next) => next is RegisteredStoreLoaded,
                    builder: (context, state) {
                      int count = 0;
                      if (state is RegisteredStoreLoaded) {
                        count = state.storeCount;
                      }
                      return Text(
                        '총 $count개',
                        style: AppStyle.subTitle14Medium.copyWith(
                          color: AppColor.grey600,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              width: width,
              color: AppColor.grey50,
            ),
            Expanded(
              child: BlocBuilder<RegisteredStoreBloc, RegisteredStoreState>(
                buildWhen: (pre, next) => next is RegisteredStoreLoaded,
                builder: (context, state) {
                  if (state is! RegisteredStoreLoaded) {
                    return const CustomCircleLoadingIndicator();
                  }

                  if (state.storeList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          loadAsset(AppIcon.textBlank),
                          const SizedBox(height: 16),
                          Text(
                            '등록된 카페가 없어요',
                            style: AppStyle.caption13Regular.copyWith(
                              color: AppColor.grey600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    itemBuilder: (context, index) => RegisteredStoreCard(
                      store: state.storeList[index],
                      index: index,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 8,
                    ),
                    itemCount: state.storeList.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
