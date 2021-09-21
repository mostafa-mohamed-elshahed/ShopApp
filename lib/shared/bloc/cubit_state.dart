abstract class ShopStateApp{}
class InitialAppState extends ShopStateApp{}
class ShopLoginSucState extends ShopStateApp{}
class ShopLoginEroState extends ShopStateApp{
  final String error;
  ShopLoginEroState(this.error);
}

