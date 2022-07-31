import 'package:cafein_flutter/resource/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeRecomCafe extends StatelessWidget {
  const HomeRecomCafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;
    return Padding(
      padding: const EdgeInsets.only(top : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left : 16),
            child: Text("근처에 있는 카공 카페를 찾아봤어요", style: AppStyle.subTitle17SemiBold,),
          ),
          Padding(
            padding: const EdgeInsets.only(top : 16 , left : 4),
            child: SizedBox(
              width : width,
              height: 170 * heightPercent,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (BuildContext context , int index){
                    return Padding(
                      padding: const EdgeInsets.only(left : 12),
                      child: Container(
                        color : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width : widthPercent * 70,
                                    height: heightPercent * 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8), // Image border
                                      child: SizedBox.fromSize(
                                        size: const Size.fromRadius(48), // Image radius
                                        child: Image.network('imageurl', fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left : 6),
                                    child: SizedBox(
                                      width : widthPercent * 70,
                                      height: heightPercent * 70,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.network('imageurl', fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left : 6),
                                    child: SizedBox(
                                      width : widthPercent * 70,
                                      height: heightPercent * 70,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8), // Image border
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(48), // Image radius
                                          child: Image.network('imageurl', fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top : 10),
                                child: Text("엔제리너스 L7홍대점", style: AppStyle.subTitle15Medium,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top : 8),
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color : true?
                                              AppColor.orange500 : AppColor.grey300
                                          ),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(4.0)
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(top : 3, bottom: 3 , left : 4 , right : 4),
                                          child: true?
                                          Text("영업중", style: AppStyle.caption11Regular.copyWith(color : AppColor.orange500),)
                                              : Text("영업종료", style : AppStyle.caption11Regular.copyWith(color : AppColor.grey500)),
                                        )
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 4),
                                      child: _confuse(1),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( top : 8),
                                child: Row(
                                  children: [
                                    const Icon(Icons.near_me_rounded, color : AppColor.grey500, size : 16),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 2),
                                      child: Text("150m", style: AppStyle.caption12Regular,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 4),
                                      child: const Icon(Icons.thumb_up_alt_rounded, color : AppColor.orange400 , size : 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 2),
                                      child: Text("79%", style: AppStyle.caption12Regular,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 4),
                                      child: const Icon(Icons.favorite_rounded, color : AppColor.orange400, size : 16),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left : 2),
                                      child: Text("12", style: AppStyle.caption12Regular,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left :77 ),
                                      child: Icon(Icons.favorite_border_rounded, size : 16),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
  Widget _confuse(int conf){
    if(conf==0){
      return const Text("혼잡도 정보가 없습니다.");
    }
    if(conf==1){
      return Container(
          decoration: const BoxDecoration(
            color : AppColor.green50,
            borderRadius: BorderRadius.all(
                Radius.circular(4.0)
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.only(top : 3, bottom: 3 , left : 4 , right : 4),
              child: Text("여유", style: AppStyle.caption12Medium.copyWith(color : AppColor.green500),)
          )
      );
    }if(conf==2){
      return Container(
          decoration: const BoxDecoration(
            color : AppColor.amber50,
            borderRadius: BorderRadius.all(
                Radius.circular(4.0)
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.only(top : 4, bottom: 4 , left : 8 , right : 8),
              child: Text("보통", style: AppStyle.subTitle15Medium.copyWith(color : AppColor.amber500),)
          )
      );
    }else{
      return Container(
          decoration: const BoxDecoration(
            color : AppColor.scarlet50,
            borderRadius: BorderRadius.all(
                Radius.circular(4.0)
            ),
          ),
          child: Padding(
              padding: const EdgeInsets.only(top : 4, bottom: 4 , left : 8 , right : 8),
              child: Text("혼잡", style: AppStyle.subTitle15Medium.copyWith(color : AppColor.scarlet500),)
          )
      );
    }
  }
}
