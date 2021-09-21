
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_abdullah_mansour/modules/sign_up/sign_up.dart';
import 'package:shop_app_abdullah_mansour/shared/bloc/cubit.dart';
import 'package:shop_app_abdullah_mansour/shared/bloc/cubit_state.dart';
import 'package:shop_app_abdullah_mansour/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
var globalKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController=TextEditingController();
    var passWordController=TextEditingController();
    return BlocProvider(
      create: (context)=>ShopCubitApp(),
      child: BlocConsumer<ShopCubitApp,ShopStateApp>(
        builder: (context,state)
        {
        ShopCubitApp cubit=  ShopCubitApp.get(context);
          return Scaffold
          (
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 80,),

                  Text("Login",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),

                  Text("Welcome In Our Application Enjoy In Jo App",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),

                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "Your Email Is Too Short";
                        }
                      },
                      label: "EmailAddress",
                      prefix: Icons.email_outlined
                  ),
                  SizedBox(height: 30,),
                  defaultFormField(
                    controller: passWordController,
                    type: TextInputType.visiblePassword,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return "Your Email Is Too Short";
                      }
                    },
                    label: "EmailAddress",
                    prefix: Icons.lock_open_outlined,
                    suffix: Icons.visibility,

                  ),
                  SizedBox(height: 30,),
                  defaultButton(
                      function: ()
                  {
                    if(globalKey.currentState!.validate())
                    {
                     cubit.userLogin(
                         email: emailController.text,
                         password: passWordController.text
                     );
                    }
                  },
                      text: "login"),
                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't Have An Account ?"),
                      TextButton(onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      }, child: Text("sign up".toUpperCase()))
                    ],
                  )
                ],
              ),
            ),
          ),
        );},
        listener: (context,state){},
      ),
    );
  }
}
