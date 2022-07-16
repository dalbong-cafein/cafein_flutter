import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        centerTitle: false,
        title: const Text("알림", style: AppStyle.title3,),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right : 16),
            child: Icon(Icons.event),
          )
        ],
      ),

    );
  }
}
