import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class TermsDetailPage extends StatelessWidget {
  const TermsDetailPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  static const routeName = 'TermsDetailPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: loadAsset(
            AppIcon.clear24S,
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(title),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
