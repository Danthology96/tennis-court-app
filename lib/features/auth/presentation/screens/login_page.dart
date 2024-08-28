import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/auth/presentation/presentation.dart';
import 'package:tennis_court_app/features/reserve/reserve.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const name = 'login';
  static const path = '/$name';

  @override
  Widget build(BuildContext context) {
    /// Instantiates the authRepository
    final authRepository =
        AuthDBRepositoryImpl(dataSource: AuthDBDataSourceImpl());

    /// Instantiates the authCubit
    final authCubit = context.read<AuthCubit>();
    return Scaffold(
        body: BlocProvider(
      create: (context) => UserLoginCubit(
        authCubit: authCubit,
        authRepository: authRepository,
      ),
      child: const _LoginPageBody(),
    ));
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody();

  @override
  State<_LoginPageBody> createState() => __LoginPageStateBody();
}

class __LoginPageStateBody extends State<_LoginPageBody> {
  /// booleans to identify either the user wants to see the password text or not
  bool passwordObscure = true;

  /// form key to validate the form
  static final GlobalKey<FormBuilderState> _loginFormKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const spacer = SizedBox(height: 20);
    final loginCubit = context.watch<UserLoginCubit>();

    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 250,
        child: Stack(
          children: [
            /// Uncomment this if the company wants a custom header with an image
            /// like the one in the design
            // ClipPath(
            //   clipper: MyCustomClipper(),
            //   child: Image.asset(
            //     'assets/images/background.png',
            //     width: double.infinity,
            //     height: 350,
            //     fit: BoxFit.fitWidth,
            //     alignment: Alignment.bottomRight,
            //   ),
            // ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header_background.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 24,
              left: 30,
              child: BackArrow(
                onPressed: () {
                  context.go(WelcomePage.path);
                },
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Iniciar sesión',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45),
            FormBuilder(
              key: _loginFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    name: 'email',
                    hintText: 'Email',
                    prefixIcon:
                        const PrefixFormIcon(icon: Icons.email_outlined),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'password',
                    hintText: 'Contraseña',
                    prefixIcon: const PrefixFormIcon(icon: Icons.lock_outline),
                    obscureText: passwordObscure,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(() {
                            if (passwordObscure == true) {
                              passwordObscure = false;
                            } else {
                              passwordObscure = true;
                            }
                          });
                        }),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  spacer,
                  CustomCheckTileWidget(
                    value: loginCubit.state.rememberMe,
                    text: "Recordar contraseña",
                    horizontalGapPadding: 5,
                    onChanged: (value) => loginCubit.rememberMeChanged(),
                  ),
                  spacer,
                  CustomFilledButton(
                    text: 'Iniciar sesión',
                    onPressed: () async {
                      _loginFormKey.currentState?.saveAndValidate();
                      final isValid =
                          _loginFormKey.currentState?.isValid == true;
                      if (isValid) {
                        loginCubit.isValidChanged(isValid);
                        loginCubit
                            .onSubmit(
                          _loginFormKey.currentState?.value['email'],
                          _loginFormKey.currentState?.value['password'],
                        )
                            .then((result) {
                          if (result == true) {
                            context.goNamed(HomePage.name);
                          }
                        });
                      }
                    },
                  ),
                  spacer,
                  spacer,
                  RichText(
                      text: TextSpan(
                    text: 'Aún no tienes cuenta? ',
                    style: textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Regístrate',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacementNamed(RegisterPage.name);
                          },
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
