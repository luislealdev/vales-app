import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vales_app/features/auth/presentation/providers/providers.dart';
import 'package:vales_app/features/shared/shared.dart';
import 'package:vales_app/features/shared/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const name = 'login-screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      // body: Padding(
      //   padding: const EdgeInsets.all(50.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const SizedBox(height: 50),
      //       const Image(
      //           image: AssetImage(
      //         "assets/images/logo.png",
      //       )),
      //       const SizedBox(height: 30),
      //       const Text("Iniciar sesión",
      //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      //       const SizedBox(height: 20),
      //       const TextField(
      //         decoration: InputDecoration(
      //           labelText: "Correo electrónico",
      //           // hintText: "Correo electrónico"
      //         ),
      //       ),
      //       const TextField(
      //         decoration: InputDecoration(
      //           labelText: "Contraseña",
      //           // hintText: "Contraseña"
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       ElevatedButton(
      //           onPressed: () {},
      //           style: ButtonStyle(
      //               backgroundColor: WidgetStateProperty.all(Colors.black)),
      //           child: const Text("Iniciar sesión",
      //               style: TextStyle(color: Colors.white))),
      //       const SizedBox(height: 50),
      //       TextButton(
      //           onPressed: () {},
      //           child: const Text("¿OLVIDASTE TU CONTRASEÑA?")),
      //     ],
      //   ),
      // ),
      body: _LoginForm(),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          const SizedBox(height: 100),
          const Image(
              image: AssetImage(
            "assets/images/logo.png",
          )),
          const SizedBox(height: 50),
          Text('Iniciar sesión', style: textStyles.titleSmall),
          const SizedBox(height: 40),
          CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            onChanged: ref.read(loginFormProvider.notifier).onEmailChange,
            errorMessage:
                loginForm.isFormPosted ? loginForm.email.errorMessage : null,
          ),
          const SizedBox(height: 30),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: ref.read(loginFormProvider.notifier).onPasswordChanged,
            onFieldSubmitted: (_) =>
                ref.read(loginFormProvider.notifier).onFormSubmit(),
            errorMessage:
                loginForm.isFormPosted ? loginForm.password.errorMessage : null,
          ),
          const SizedBox(height: 30),
          SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomFilledButton(
                  text: 'Ingresar',
                  buttonColor: Colors.black,
                  onPressed: loginForm.isPosting
                      ? null
                      : ref.read(loginFormProvider.notifier).onFormSubmit)),
          TextButton(
              onPressed: () {}, child: const Text("¿OLVIDASTE TU CONTRASEÑA?")),
        ],
      ),
    );
  }
}
