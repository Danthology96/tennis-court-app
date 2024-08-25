import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:tennis_court_app/features/shared/shared.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const name = 'register';
  static const path = '/$name';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  static final GlobalKey<FormBuilderState> _registerFormKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    const spacer = SizedBox(height: 20);
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              child: IconButton.filled(
                onPressed: () {
                  context.pop();
                },
                style: FilledButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  backgroundColor: colorScheme.surfaceContainer,
                ),
                icon: Icon(
                  Icons.arrow_back,
                  color: colorScheme.surface,
                ),
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
                    validator: FormBuilderValidators.required(),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'email',
                    hintText: 'Correo electrónico',
                    prefixIcon:
                        const PrefixFormIcon(icon: Icons.email_outlined),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
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
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'password',
                    hintText: 'Contraseña',
                    prefixIcon: const PrefixFormIcon(icon: Icons.lock_outline),
                    obscureText: true,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {}),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  spacer,
                  CustomTextFormField(
                    name: 'confirmPassword',
                    hintText: 'Confirmar contraseña',
                    prefixIcon: const PrefixFormIcon(icon: Icons.lock_outline),
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {}),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                  ),
                  spacer,
                  CustomFilledButton(
                    text: 'Registrarme',
                    onPressed: () {},
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
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    ])));
  }
}

class PrefixFormIcon extends StatelessWidget {
  const PrefixFormIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.only(right: 5),
      margin: const EdgeInsets.only(right: 5, top: 4, bottom: 4),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: colorScheme.onSurface)),
      ),
      child: Icon(
        icon,
        size: 20,
        color: colorScheme.onSurface,
      ),
    );
  }
}

/// In case the company needs a custom hover with any image use this widget, in this test,
/// the image is not the final one, but it is just to show the idea
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, 0)
      ..quadraticBezierTo(
          size.width * 0.1, size.height, size.width * 1.2, size.height * 0.6)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
