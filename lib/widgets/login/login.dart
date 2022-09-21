import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/model/authorization_status.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/redux/actions.dart';
import 'package:untitled3/styles/input_decoration_styles.dart';
import 'package:untitled3/validator/validator.dart';
import 'package:untitled3/widgets/game_screen/actions.dart';
import '../../redux/app_state.dart';
import '../../styles/button_styles/button_styles.dart';
import '../../text_styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.validator}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  final Validator validator;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  late String login = "";
  late String password = "";
  final _formKey = GlobalKey<FormState>();
  bool isRegister = false;
  String? passErrorMessage = "";
  String? loginErrorMessage = "";
  late Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          StoreConnector(
            converter: (Store<AppState> storeVm) {
              store = storeVm;
            },
            builder: (context, vm) {
              return Center(
                child: SingleChildScrollView(
                    child: Form(
                  key: _formKey,
                  child: Column(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "L O G I N",
                          style: PressStart2PlayTextStyles.p2s20black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                          validator: widget.validator.nameValidator,
                          initialValue: "",
                          onChanged: (value) {
                            setState(() {
                              login = value;
                            });
                          },
                          decoration:
                              InputDecorationStyles.rectangleP2S("login")),
                    ),
                    Builder(builder: loginErrorMessageField),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        obscureText: true,
                        validator: widget.validator.passwordValidator,
                        initialValue: "",
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        decoration:
                            InputDecorationStyles.rectangleP2S('password'),
                      ),
                    ),
                    Builder(builder: passValidationField),
                    Row(children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: OutlinedButton(
                            onPressed: (store.state.userLoadState ==
                                    LoadState.loading)
                                ? () {}
                                : (isRegister)
                                    ? () =>
                                        Navigator.of(context).pushNamed("/main")
                                    : _validate,
                            style: SimpleButtonStyles.blueH50,
                            child: (store.state.userLoadState ==
                                    LoadState.loading)
                                ? const Padding(
                                    padding: EdgeInsets.all(1),
                                    child: CircularProgressIndicator())
                                : Text(
                                    (isRegister) ? "continue" : "Sign in",
                                    style: PressStart2PlayTextStyles.p2sWhite,
                                  ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/registration");
                              },
                              style: SimpleButtonStyles.blueH50,
                              child: Text(
                                "Sign up",
                                style: PressStart2PlayTextStyles.p2sWhite,
                              ),
                            )),
                      )
                    ]),
                  ]),
                )),
              );
            },
          ),
        ],
      ),
    ));
  }

  void _validate() {
    final form = _formKey.currentState;
    setState(() {
      passErrorMessage = null;
      loginErrorMessage = null;
    });
    if (form!.validate()) signIn();
  }

  void signIn() async {
    await store.dispatch(GetUserAction(name: login, password: password));
    if (store.state.userLoadState == LoadState.error) {
      setState(() {
        loginErrorMessage = "no such user or password invalid";
      });
    } else {
      setState(() {
        isRegister = true;
      });
      store.dispatch(
          SetNewAuthorizationStatusAction(AuthorizationStatus.loaded));
    }
  }

  Widget passValidationField(BuildContext context) {
    if (passErrorMessage == null) {
      return const SizedBox.shrink();
    } else {
      return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Text(
            passErrorMessage!,
            style: PressStart2PlayTextStyles.p2sAlert,
          ));
    }
  }

  Widget loginErrorMessageField(BuildContext context) {
    if (loginErrorMessage == null) {
      return const SizedBox.shrink();
    } else {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            loginErrorMessage!,
            style: PressStart2PlayTextStyles.p2sAlert,
          ));
    }
  }
}
