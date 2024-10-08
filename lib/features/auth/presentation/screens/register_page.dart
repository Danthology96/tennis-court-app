import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/auth/infrastructure/infrastructure.dart';
import 'package:tennis_court_app/features/auth/presentation/presentation.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const name = 'register';
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
      create: (context) => UserRegisterCubit(
        authCubit: authCubit,
        authRepository: authRepository,
      ),
      child: const _RegisterPageBody(),
    ));
  }
}

class _RegisterPageBody extends StatefulWidget {
  const _RegisterPageBody();

  @override
  State<_RegisterPageBody> createState() => __RegisterPageStateBody();
}

class __RegisterPageStateBody extends State<_RegisterPageBody> {
  /// booleans to identify either the user wants to see the password text or not
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  /// form key to validate the form
  static final GlobalKey<FormBuilderState> _registerFormKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const spacer = SizedBox(height: 20);
    final registerCubit = context.watch<UserRegisterCubit>();

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
                )),
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
              'Registro',
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 45),
            FormBuilder(
              key: _registerFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    name: 'names',
                    hintText: 'Nombre y apellido',
                    prefixIcon:
                        const PrefixFormIcon(icon: Icons.person_outline),
                    validator: FormBuilderValidators.required(
                        errorText: "El nombre es requerido"),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'email',
                    hintText: 'Correo electrónico',
                    prefixIcon:
                        const PrefixFormIcon(icon: Icons.email_outlined),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: "El correo electrónico es requerido"),
                      FormBuilderValidators.email(
                          errorText: "El correo electrónico no es válido"),
                    ]),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'phone',
                    hintText: 'Teléfono',
                    prefixIcon:
                        const PrefixFormIcon(icon: Icons.phone_outlined),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(
                          errorText: "El teléfono debe ser numérico"),
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
                      FormBuilderValidators.required(
                          errorText: "La contraseña es requerida"),
                      FormBuilderValidators.minLength(6,
                          errorText:
                              "La contraseña debe tener al menos 6 caracteres"),
                    ]),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'confirmPassword',
                    hintText: 'Confirmar contraseña',
                    prefixIcon: const PrefixFormIcon(icon: Icons.lock_outline),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(() {
                            if (confirmPasswordObscure == true) {
                              confirmPasswordObscure = false;
                            } else {
                              confirmPasswordObscure = true;
                            }
                          });
                        }),
                    obscureText: confirmPasswordObscure,
                    validator: FormBuilderValidators.compose([
                      if (_registerFormKey
                              .currentState?.instantValue["password"] !=
                          null)
                        FormBuilderValidators.equal(
                          _registerFormKey
                              .currentState?.instantValue["password"],
                          errorText: "Las contraseñas no coinciden",
                        ),
                    ]),
                  ),
                  spacer,
                  CustomFilledButton(
                    text: 'Registrarme',
                    onPressed: () async {
                      _registerFormKey.currentState?.saveAndValidate();
                      final isValid =
                          _registerFormKey.currentState?.isValid == true;
                      if (isValid) {
                        registerCubit
                            .onSubmit(
                                _registerFormKey.currentState?.value ?? {})
                            .then((result) {
                          if (result == true) {
                            context.go(LoginPage.path);
                          }
                        });
                      }
                    },
                  ),
                  spacer,
                  spacer,
                  RichText(
                      text: TextSpan(
                    text: 'Ya tengo cuenta ',
                    style: textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: 'Iniciar sesión',
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.pushReplacementNamed(LoginPage.name);
                          },
                      ),
                    ],
                  )),
                  spacer,
                  spacer,
                ],
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
