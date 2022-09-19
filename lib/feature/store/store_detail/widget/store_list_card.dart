import 'package:cafein_flutter/data/model/store/store.dart';
import 'package:flutter/material.dart';

class StoreListCard extends StatelessWidget {
  const StoreListCard({
    super.key,
    required this.storeList,
  });

  final List<Store> storeList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 240,
      ),
    );
  }
}
