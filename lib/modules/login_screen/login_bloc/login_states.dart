abstract class LoginShopAppStates {}

class InitializeLoginShopApp extends LoginShopAppStates {}

class LoadingLoginShopApp extends LoginShopAppStates {}

class GetSuccessLoginShopApp extends LoginShopAppStates {}

class GetErrorLoginShopApp extends LoginShopAppStates {
  final String error;

  GetErrorLoginShopApp(this.error);
}
