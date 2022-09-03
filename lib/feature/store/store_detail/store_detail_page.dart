import 'package:cafein_flutter/feature/store/store_detail/bloc/store_detail_bloc.dart';
import 'package:cafein_flutter/widget/dialog/error_dialog.dart';
import 'package:cafein_flutter/widget/indicator/custom_circle_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailPage extends StatefulWidget {
  const StoreDetailPage({
    Key? key,
    required this.storeId,
  }) : super(key: key);

  static const routeName = 'StoreDetailPage';

  final int storeId;

  @override
  State<StoreDetailPage> createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<StoreDetailBloc>().add(
            StoreDetailRequested(
              storeId: widget.storeId,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreDetailBloc, StoreDetailState>(
      listener: (context, state) {
        if (state is StoreDetailError) {
          ErrorDialog.show(
            context,
            error: state.error,
            refresh: state.event,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<StoreDetailBloc, StoreDetailState>(
          buildWhen: (pre, next) => next is StoreDetailLoaded,
          builder: (context, state) {
            if (state is StoreDetailLoaded) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(),
                ],
              );
            }

            return const CustomCircleLoadingIndicator();
          },
        ),
      ),
    );
  }
}
