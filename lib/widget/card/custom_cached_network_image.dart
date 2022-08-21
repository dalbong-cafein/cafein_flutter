import 'package:cached_network_image/cached_network_image.dart';
import 'package:cafein_flutter/widget/indicator/circle_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomCachedNetworkImage extends StatefulWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.fit,
  });

  final String imageUrl;
  final double width;
  final double height;
  final BoxFit? fit;

  @override
  State<CustomCachedNetworkImage> createState() => _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage> {
  late String imageUrl;

  @override
  void didChangeDependencies() {
    imageUrl = widget.imageUrl;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: widget.height,
      width: widget.width,
      placeholder: (context, url) => const CustomCircleLoadingIndicator(),
      errorWidget: (context, url, error) => const SizedBox.shrink(),
      fit: widget.fit ?? BoxFit.contain,
      fadeInDuration: const Duration(milliseconds: 200),
      fadeOutDuration: const Duration(milliseconds: 200),
      placeholderFadeInDuration: const Duration(milliseconds: 200),
    );
  }
}
