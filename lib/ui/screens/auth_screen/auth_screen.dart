import 'package:administration_app/ui/common/widgets/custom_text_input.dart';
import 'package:administration_app/ui/screens/auth_screen/auth_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class AuthScreen extends CoreMwwmWidget {
  AuthScreen()
      : super(
          widgetModelBuilder: (_) => AuthScreenWm(),
        );

  @override
  State<StatefulWidget> createState() => _AuthScreenState();
}

class _AuthScreenState extends WidgetState<AuthScreenWm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: 50,
        width: MediaQuery.of(context).copyWith().size.width / 2,
        child: FloatingActionButton.extended(
          label: const Text(
            'Войти',
            style: TextStyle(color: Colors.amberAccent, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.black,
          onPressed: wm.onEnter,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      appBar: AppBar(
        title: const Text(
          'Авторизация',
          style: TextStyle(color: Colors.amberAccent),
        ),
        centerTitle: false,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Center(
              child: Text(
                'Логин',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                //width: MediaQuery.of(context).copyWith().size.width / 1.5,
                child: CustomTextField(
                  controller: wm.loginController,
                  enabled: true,
                  // height: 51,
                  hintText: 'Введите логин',
                  hintColor: Colors.grey,
                  borderColor: Colors.black,
                )),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Пароль',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                //width: MediaQuery.of(context).copyWith().size.width / 1.5,
                child: StreamedStateBuilderNS(
                    streamedStateNS: wm.obscureState,
                    builder: (context, obscure) {
                      return CustomTextField(
                        controller: wm.passController,
                        enabled: true,
                        hintText: 'Введите пароль',
                        hintColor: Colors.grey,
                        borderColor: Colors.black,
                        obscure: obscure,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscure ? Icons.visibility_outlined : Icons.visibility_off,
                            color: obscure ? Colors.grey : Colors.amber,
                          ),
                          onPressed: () {
                            wm.showObscure();
                          },
                        ),
                      );
                    })),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Название базы',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              //width: MediaQuery.of(context).copyWith().size.width / 1.5,
              child: CustomTextField(
                controller: wm.baseNameController,
                enabled: true,
                // height: 51,
                hintText: 'Введите адрес сервера',
                hintColor: Colors.grey,
                borderColor: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'Адрес сервера',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              //width: MediaQuery.of(context).copyWith().size.width / 1.5,
              child: CustomTextField(
                controller: wm.urlController,
                enabled: true,
                // height: 51,
                hintText: 'Введите адрес сервера без http и / ',
                hintColor: Colors.grey,
                borderColor: Colors.black,
              ),
            ),
            StreamedStateBuilderNS(
              streamedStateNS: wm.httpsState,
              builder: (context, http) {
                return Row(children: [
                  IconButton(onPressed: (){
                    wm.onHttps();
                  }, icon: http ? Icon(Icons.check_box_outlined) :Icon(Icons.check_box_outline_blank)),
                  Text('https'),
                ],);
              }
            )
          ],
        ),
      ),
    );
  }
}
