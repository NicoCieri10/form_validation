import 'package:appsize/appsize.dart';
import 'package:catalog_app/home/home.dart';
import 'package:catalog_app/register/cubit/register_cubit.dart';
import 'package:catalog_app/register/widgets/widgets.dart';
import 'package:catalog_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:ui/ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const name = 'register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Center(
          child: Text('register'),
        ),
        // body: AuthBackground(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         SizedBox(height: 250.sp),
        //         CardContainer(
        //           child: Column(
        //             children: [
        //               SizedBox(height: 10.sp),
        //               Text(
        //                 'Register',
        //                 style: Theme.of(context).textTheme.headlineMedium,
        //               ),
        //               SizedBox(height: 30.sp),
        //               const _registerForm(),
        //             ],
        //           ),
        //         ),
        //         SizedBox(height: 50.sp),
        //         Text(
        //           style: TextStyle(
        //             color: myThemeLight.primaryColor,
        //             fontWeight: FontWeight.w500,
        //           ),
        //           'Crear una nueva cuenta',
        //         ),
        //         SizedBox(height: 50.sp),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}

// class _RegisterForm extends StatelessWidget {
//   const _RegisterForm();

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<registerCubit>();

//     return Form(
//       key: cubit.state.formKey,
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//       child: BlocBuilder<registerCubit, registerState>(
//         builder: (context, state) {
//           return Column(
//             children: [
//               TextFormField(
//                 autocorrect: false,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecorations.authInputDecoration(
//                   hintText: 'john.doe@gmail.com',
//                   labelText: 'Email',
//                   prefixIcon: Icons.alternate_email_rounded,
//                 ),
//                 onChanged: cubit.addEmail,
//                 validator: (value) {
//                   const pattern =
//                       r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//                   final regExp = RegExp(pattern);

//                   return regExp.hasMatch(value ?? '')
//                       ? null
//                       : 'Ingrese un correo válido';
//                 },
//               ),
//               SizedBox(height: 30.sp),
//               TextFormField(
//                 obscureText: true,
//                 autocorrect: false,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecorations.authInputDecoration(
//                   hintText: '******',
//                   labelText: 'Password',
//                   prefixIcon: Icons.lock_outline,
//                 ),
//                 onChanged: cubit.addPassword,
//                 validator: (value) {
//                   return (value != null && value.length >= 6)
//                       ? null
//                       : 'Ingrese una contraseña válida (min. 6 caracteres)';
//                 },
//               ),
//               SizedBox(height: 30.sp),
//               MaterialButton(
//                 minWidth: 200.sp,
//                 height: 45.sp,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 disabledColor: Colors.grey,
//                 elevation: 0,
//                 color: Colors.deepPurple,
//                 onPressed: state.status == registerStatus.attempting
//                     ? null
//                     : () async {
//                         FocusScope.of(context).unfocus();
//                         final isValidForm =
//                             cubit.state.formKey.currentState?.validate();

//                         if (!(isValidForm ?? false)) return;
//                         // nico@gmail.com

//                         cubit.changeState(registerStatus.attempting);

//                         await Future<void>.delayed(
//                           const Duration(seconds: 2),
//                         );

//                         cubit.changeState(registerStatus.success);

//                         // ignore: use_build_context_synchronously
//                         context.goNamed(HomePage.name);
//                       },
//                 child: const ButtonText(),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class ButtonText extends StatelessWidget {
//   const ButtonText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 80.sp,
//         vertical: 15.sp,
//       ),
//       child: BlocBuilder<registerCubit, registerState>(
//         builder: (context, state) {
//           return Text(
//             state.status == registerStatus.attempting
//                 ? 'Espere...'
//                 : 'Ingresar',
//             style: const TextStyle(
//               color: Colors.white,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
