import 'package:cafein_flutter/feature/main/main_bottom_navigation_bar.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;
    return Scaffold(
      appBar: AppBar(
        title: const Text("나의 카페",style: AppStyle.title18Bold,),
        centerTitle: false,
        actions: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(48), // Image radius
              child: Image.network('https://googleflutter.com/sample_image.jpg', fit: BoxFit.cover),
            ),
          )
        ],
      ),
      bottomNavigationBar: MainBottomNavigationBar(),
      body: Center(
        child: Text('HomePage'),
      ),
    );
  }
}
