import 'package:cafein_flutter/feature/login/login_page.dart';
import 'package:cafein_flutter/feature/profile/profile_page.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';

class PhoneCertificationDonePage extends StatefulWidget {
  const PhoneCertificationDonePage({
    super.key,
  });

  static const routeName = 'PhoneCertificationDonePage';

  @override
  State<PhoneCertificationDonePage> createState() => _PhoneCertificationDonePageState();
}

class _PhoneCertificationDonePageState extends State<PhoneCertificationDonePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        ProfilePage.routeName,
        ModalRoute.withName(LoginPage.routeName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 360;

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '본인 인증이\n완료되었습니다.',
              style: AppStyle.title25Bold,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 72),
            loadAsset(
              AppImage.phoneSuccess,
              width: 140 * width,
              height: 140 * width,
            ),
          ],
        ),
      ),
    );
  }
}
