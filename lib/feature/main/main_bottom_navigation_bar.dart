import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainBottomNavigationBar extends StatelessWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      height: bottomPadding > 0 ? bottomPadding + 56 : 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -0.4),
            blurRadius: 12,
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomTab(
            currentIndex: 0,
            offIcon: AppIcon.homeOff,
            onIcon: AppIcon.homeOn,
            height: bottomPadding > 0 ? bottomPadding + 56 : 56,
          ),
          _BottomTab(
            currentIndex: 1,
            offIcon: AppIcon.searchOff,
            onIcon: AppIcon.searchOn,
            height: bottomPadding > 0 ? bottomPadding + 56 : 56,
          ),
          _BottomTab(
            currentIndex: 2,
            offIcon: AppIcon.notificationOff,
            onIcon: AppIcon.notificationOn,
            height: bottomPadding > 0 ? bottomPadding + 56 : 56,
          ),
          _BottomTab(
            currentIndex: 3,
            offIcon: AppIcon.moreViewOff,
            onIcon: AppIcon.moreViewOn,
            height: bottomPadding > 0 ? bottomPadding + 56 : 56,
          ),
        ],
      ),
    );
  }
}

class _BottomTab extends StatelessWidget {
  const _BottomTab({
    Key? key,
    required this.currentIndex,
    required this.offIcon,
    required this.onIcon,
    required this.height,
  }) : super(key: key);

  final String onIcon;
  final String offIcon;
  final int currentIndex;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainNavigationSelected) {
          return Container(
            height: height,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  currentIndex == 0 ? 16 : 0,
                ),
                topRight: Radius.circular(
                  currentIndex == 3 ? 16 : 0,
                ),
              ),
            ),
            child: InkWell(
              onTap: () => context.read<MainBloc>().add(
                    MainTabChanged(
                      index: currentIndex,
                    ),
                  ),
              child: loadAsset(
                currentIndex == state.index ? onIcon : offIcon,
                fit: BoxFit.scaleDown,
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
