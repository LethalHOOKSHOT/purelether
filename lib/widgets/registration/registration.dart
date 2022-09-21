import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:untitled3/model/authorization_status.dart';
import 'package:untitled3/model/load_state.dart';
import 'package:untitled3/redux/actions.dart';
import 'package:untitled3/redux/app_state.dart';
import 'package:untitled3/styles/button_styles/button_styles.dart';
import 'package:untitled3/styles/input_decoration_styles.dart';
import 'package:untitled3/text_styles/text_styles.dart';
import 'package:untitled3/validator/validator.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key, required this.validator}) : super(key: key);
  final Validator validator;
  final formKey = GlobalKey<FormState>();

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String nickname = "";
  late String password;
  late String repeatedPassword;

  String? invalidLoginMessage;

  bool isRegistered = false;
  late Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector(
        converter: (Store<AppState> storeVm) {
          store = storeVm;
        },
        builder: (context, vm) => SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        "R E G I S T R A T I O N",
                        style: PressStart2PlayTextStyles.p2sBlack54,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextFormField(
                        validator: widget.validator.nameValidator,
                        initialValue: "",
                        decoration: InputDecorationStyles.rectangleP2S('login'),
                        onChanged: (value) {
                          setState(() {
                            nickname = value;
                          });
                        },
                      )),
                  loginValidationField(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      obscureText: true,
                      validator: widget.validator.passwordValidator,
                      initialValue: "",
                      decoration:
                          InputDecorationStyles.rectangleP2S("password"),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      obscureText: true,
                      validator: repeatedPassValidator,
                      initialValue: "",
                      decoration:
                          InputDecorationStyles.rectangleP2S("repeat pass"),
                      onChanged: (value) {
                        setState(() {
                          repeatedPassword = value;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: SimpleButtonStyles.blueH50,
                              child: Text(
                                "back",
                                style: PressStart2PlayTextStyles.p2sWhite,
                              ),
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: OutlinedButton(
                                onPressed: () => (isRegistered)
                                    ? Navigator.of(context).pushNamed("/main")
                                    : validateAndSave(),
                                style: SimpleButtonStyles.blueH50,
                                child: LayoutBuilder(
                                  builder: (context, constraints) =>
                                      (isRegistered)
                                          ? Text(
                                              "continue",
                                              style: PressStart2PlayTextStyles
                                                  .p2sWhite,
                                            )
                                          : Text(
                                              "sign in",
                                              style: PressStart2PlayTextStyles
                                                  .p2sWhite,
                                            ),
                                ),
                              ))),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signButton() {
    return Builder(
      builder: (BuildContext context) => Flexible(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: OutlinedButton(
                  onPressed: () =>
                      (store.state.userLoadState == LoadState.loading)
                          ? () {}
                          : (isRegistered)
                              ? Navigator.of(context).pushNamed("/main")
                              : validateAndSave(),
                  style: SimpleButtonStyles.blueH50,
                  child: (store.state.userLoadState == LoadState.loading)
                      ? const Padding(
                          padding: EdgeInsets.all(1),
                          child: const CircularProgressIndicator(),
                        )
                      : Text(
                          (isRegistered) ? "sign in" : "continue",
                          style: PressStart2PlayTextStyles.p2sWhite,
                        )))),
    );
  }

  void nullifyErrorMessages() {
    setState(() {
      invalidLoginMessage = null;
    });
  }

  String? repeatedPassValidator(String? pass) {
    var errorMessage = widget.validator.passwordValidator(pass);
    if (errorMessage == null) {
      return errorMessage;
    }
    if (pass != repeatedPassword) {
      return "you must repeat a password";
    }
    return null;
  }

  void validateAndSave() {
    final formKey = _formKey.currentState!;
    nullifyErrorMessages();
    if (formKey.validate()) {
      onFormSubmit();
    }
  }

  void onFormSubmit() async {
    await store.dispatch(EnsureThatNewAction(nickname));
    if (store.state.userLoadState == LoadState.loaded) {
      setState(() {
        invalidLoginMessage = "user already exists";
      });
    } else {
      store.dispatch(SetUserInFirestoreAction(nickname, password));
      store.dispatch(SetStatisticsInFirestoreAction(store.state.user.id));
      setState(() {
        isRegistered = true;
      });
      store.dispatch(
          SetNewAuthorizationStatusAction(AuthorizationStatus.loaded));
    }
  }

  Widget loginValidationField() {
    return Builder(builder: (BuildContext context) {
      if (invalidLoginMessage == null) {
        return const SizedBox.shrink();
      } else {
        return Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text(
              invalidLoginMessage!,
              style: PressStart2PlayTextStyles.p2sAlert,
            ));
      }
    });
  }
}
