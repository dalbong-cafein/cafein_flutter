import 'package:cafein_flutter/data/repository/user_repository.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:cafein_flutter/widget/card/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDetailPageArguments {
  final int initialPage;
  final List<String> imageUrls;

  ImageDetailPageArguments({
    required this.initialPage,
    required this.imageUrls,
  });
}

class ImageDetailPage extends StatefulWidget {
  const ImageDetailPage({
    super.key,
    required this.imageUrls,
    required this.initialPage,
  });

  static const routeName = 'ImageDetailPage';

  final List<String> imageUrls;
  final int initialPage;

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  final transformationController = TransformationController();

  late int currentPage = widget.initialPage + 1;

  late final PageController pageController = PageController(
    initialPage: widget.initialPage,
  );

  late final userData = context.watch<UserRepository>().getMemberData;

  bool isScale = false;

  @override
  void initState() {
    super.initState();
    transformationController.addListener(() {
      if (transformationController.value == Matrix4.identity()) {
        setState(() => isScale = false);
      }
    });
  }

  void handleDoubleTab() => transformationController.value = Matrix4.identity();

  @override
  void dispose() {
    pageController.dispose();
    transformationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.imageUrls.length,
            physics: isScale ? const NeverScrollableScrollPhysics() : null,
            onPageChanged: (index) => setState(() => currentPage = index + 1),
            itemBuilder: (context, index) => GestureDetector(
              onDoubleTap: handleDoubleTab,
              child: InteractiveViewer(
                transformationController: transformationController,
                maxScale: 3.0,
                minScale: 1.0,
                scaleFactor: 200,
                onInteractionEnd: (scaleEndDetails) {
                  final scale =
                      transformationController.value.getMaxScaleOnAxis();
                  if (scale == 1.0) {
                    setState(() => isScale = false);
                  } else {
                    setState(() => isScale = true);
                  }
                },
                child: CustomCachedNetworkImage(
                  imageUrl: widget.imageUrls[index],
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(
          //       top: MediaQuery.of(context).viewPadding.top + 12,
          //     ),
          //     child: Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         CircleProfileImage(
          //           imageUrl: userData?.imageIdPair?.imageUrl,
          //           radius: 10,
          //         ),
          //         const SizedBox(width: 6),
          //         Text(
          //           userData?.nickname ?? '',
          //           style: AppStyle.caption13Medium.copyWith(
          //             color: AppColor.grey200,
          //           ),
          //         ),
          //         Text(
          //           '의 제보',
          //           style: AppStyle.caption13Regular.copyWith(
          //             color: AppColor.grey300,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewPadding.top,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.of(context).pop(),
                icon: loadAsset(
                  AppIcon.left,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 20 + MediaQuery.of(context).viewPadding.bottom,
              ),
              child: Text(
                '$currentPage/${widget.imageUrls.length}',
                style: AppStyle.body15Regular.copyWith(
                  color: AppColor.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
