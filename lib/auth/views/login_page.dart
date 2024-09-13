
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_eats/cubit/login_cubit.dart';
import 'package:yandex_eats/utils/widgets/login_footer.dart';
import 'package:yandex_eats/utils/widgets/login_form.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(userRepository: context.read<UserRepository>()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: true,
      releaseFocus: true,
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        child: Column(
          children: [
            const WelcomeImage(),
            const SizedBox(height: AppSpacing.lg),
            const LoginForm(),
            const SizedBox(height: AppSpacing.md),
            const Spacer(),
            LoginFooter(
              text: 'Sign up',
              onTap: () {
                context.read<AuthCubit>().changeAuth(showLogin: false);
              },
            ),
          ],
        ),
      ),
    );
  }
}