import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/login/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;

    return BlocListener<LoginController, LoginState>(
      bloc: controller,
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        final message = state.errorMessage ?? "Erro ao realizar";
        AsukaSnackbar.warning(message).show();
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFF0092B9),
                Color(0XFF016B72),
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: ScreenSize.height * .1,
                ),
                SizedBox(
                  width: ScreenSize.width * 0.8,
                  height: ScreenSize.height * 0.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[200],
                    ),
                    onPressed: () {
                      controller.signIn();
                    },
                    child: Container(
                        child: Image.asset("assets/images/Google.png")),
                  ),
                ),
                BlocSelector<LoginController, LoginState, bool>(
                    bloc: controller,
                    selector: (state) {
                      return state.status == LoginStatus.loading;
                    },
                    builder: (context, show) {
                      return Visibility(
                        visible: show,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Center(
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
