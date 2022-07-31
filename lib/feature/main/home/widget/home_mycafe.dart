import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeMyCafe extends StatelessWidget {
  const HomeMyCafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final widthPercent = width / 360;
    final heightPercent = height / 800;
    return Padding(
      padding: const EdgeInsets.only(left : 16, right : 16),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state is HomeLoaded){
            if(state.memberStores.isEmpty){
              return Container(
                width: width - 32,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(16.0)
                    ),
                    color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top : 31, bottom : 31),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      loadAsset(
                          AppImage.noCafe,
                          height: 42 *heightPercent,
                          width: 32 * widthPercent
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top : 10),
                        child: Text("등록된 나의 카페가 없어요"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top : 10),
                        child: Text("카페의 하트를 눌러 나의 카페로 등록해 보세요"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top : 12),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color : AppColor.orange500
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10.0)
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left : 12, right : 12, top : 10, bottom: 10),
                            child: Text(
                              "카페 찾아보기",
                              style: AppStyle.subTitle14Medium.copyWith(
                                  color : AppColor.orange500
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(16.0)
                  ),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom : 20),
                    child: ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context , int index){
                          return Padding(
                            padding: const EdgeInsets.only(left : 16, right: 16, top : 20),
                            child: Row(
                              children: [
                                SizedBox(
                                  width : (width - 64) * 0.8,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width : widthPercent * 48,
                                        height: heightPercent * 48,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(8), // Image border
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(48), // Image radius
                                            child: Image.network(state.memberStores[index].imageIdPair.imageUrl!, fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left : 12),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(state.memberStores[index].storeName, style: AppStyle.subTitle15Medium,),
                                            Padding(
                                              padding: const EdgeInsets.only(top : 5),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color : state.memberStores[index].isOpen?
                                                            AppColor.orange500 : AppColor.grey300
                                                        ),
                                                        borderRadius: const BorderRadius.all(
                                                            Radius.circular(4.0)
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(top : 3, bottom: 3 , left : 4 , right : 4),
                                                        child: state.memberStores[index].isOpen?
                                                        Text(
                                                          "영업중",
                                                          style: AppStyle.caption11Regular.copyWith(
                                                              color : AppColor.orange500
                                                          ),
                                                        )
                                                            :
                                                        Text(
                                                            "영업종료",
                                                            style : AppStyle.caption11Regular.copyWith(
                                                                color : AppColor.grey500
                                                            )
                                                        ),
                                                      )
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left: 6.0),
                                                    child: Text("오후 11:30에 영업 종료",
                                                      style: AppStyle.caption12Regular.copyWith(
                                                          color : AppColor.grey600
                                                      ),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width : (width - 64) * 0.2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _confuse(state.memberStores[index].congestionScoreAvg == null?
                                      0
                                          :
                                      state.memberStores[index].congestionScoreAvg!.toInt())
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  Container( height:1.0,
                      width:width - 32,
                      color:AppColor.grey100),
                  Padding(
                    padding: const EdgeInsets.only(top : 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "나의 카페${state.memberStores.length}개 모두 보기",
                          style: AppStyle.body14Regular,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left : 3),
                          child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color : AppColor.grey400, size : 16
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }else{
            return Container();
          }

        },
      ),
    );
  }
  Widget _confuse(int conf){
    if(conf==0){
      return const Text(
          "혼잡도 정보가 없습니다."
      );
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
            padding: const EdgeInsets.only(top : 4, bottom: 4 , left : 8 , right : 8),
            child: Text(
              "여유",
              style: AppStyle.subTitle15Medium.copyWith(
                  color : AppColor.green500
              ),
            )
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
              child: Text(
                "보통",
                style: AppStyle.subTitle15Medium.copyWith(
                    color : AppColor.amber500
                ),
              )
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
               child: Text(
                 "혼잡",
                 style: AppStyle.subTitle15Medium.copyWith(
                     color : AppColor.scarlet500
                 ),
               )
           )
       );
    }
  }
}
