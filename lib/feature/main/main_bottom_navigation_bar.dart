import 'package:cafein_flutter/feature/main/bloc/main_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
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
        color: AppColor.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _BottomTab(
            currentIndex: 0,
            offIcon: CupertinoIcons.home,
            onIcon: CupertinoIcons.house_fill,
          ),
          _BottomTab(
            currentIndex: 1,
            offIcon: CupertinoIcons.search_circle,
            onIcon: CupertinoIcons.search_circle_fill,
          ),
          _BottomTab(
            currentIndex: 2,
            offIcon: CupertinoIcons.bell,
            onIcon: CupertinoIcons.bell_fill,
          ),
          _BottomTab(
            currentIndex: 3,
            offIcon: CupertinoIcons.person,
            onIcon: CupertinoIcons.person_fill,
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
  }) : super(key: key);

  final IconData onIcon;
  final IconData offIcon;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainNavigationSelected) {
            return InkWell(
              onTap: () => context.read<MainBloc>().add(MainTabChanged(index: currentIndex)),
              child: Icon(
                currentIndex == state.index ? onIcon : offIcon,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
