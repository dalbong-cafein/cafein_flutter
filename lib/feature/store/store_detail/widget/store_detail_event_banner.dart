import 'package:flutter/material.dart';

class StoreDetailEventBanner extends StatelessWidget {
  const StoreDetailEventBanner({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(imageUrl),
      ),
    );
  }
}
