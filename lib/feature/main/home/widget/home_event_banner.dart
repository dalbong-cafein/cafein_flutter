import 'package:cafein_flutter/feature/main/home/bloc/home_bloc.dart';
import 'package:cafein_flutter/resource/resource.dart';
import 'package:cafein_flutter/util/load_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeEventBanner extends StatelessWidget {
  const HomeEventBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is HomeLoaded,
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state is HomeLoaded){
          return SizedBox(
            width: width - 32,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Image border
              child: Image.network(state.homeEventImageUrl),
            ),
          );
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
