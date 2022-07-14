import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/login_screen/login_bloc/login_states.dart';
import 'package:shop_app/shared/network/end_point.dart';
import 'package:shop_app/shared/network/remote/dio/dio_helper.dart';

class LoginShopAppCubit extends Cubit<LoginShopAppStates> {
  LoginShopAppCubit() : super(InitializeLoginShopApp());
  static LoginShopAppCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginShopApp());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      emit(GetSuccessLoginShopApp());
    }).catchError((error) {
      emit(GetErrorLoginShopApp(error.toString()));
      print(error.toString());
    });
  }
}
