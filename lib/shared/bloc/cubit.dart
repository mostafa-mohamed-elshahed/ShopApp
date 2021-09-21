import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdullah_mansour/shared/bloc/cubit_state.dart';
import 'package:shop_app_abdullah_mansour/shared/network/remote/dio_helper.dart';

class ShopCubitApp extends Cubit<ShopStateApp>{
  ShopCubitApp() : super(InitialAppState());
 static ShopCubitApp get(context)=>BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  })
  {
    DioHelper.postData(
      url: "login",
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      print("done");

      emit(ShopLoginSucState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopLoginEroState(error.toString()));
    });
  }

}