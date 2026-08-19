import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;
  String email = '';

  Future<void> fakeLoading() async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
    notifyListeners();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeController>(
        builder: (context, homeController, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo, ${homeController.email}',
                style: const TextStyle(fontSize: 24),
              ),
              AppElevatedButton(
                onPressed: () {
                  homeController.email = 'adiosajsdi';
                  Navigator.pop(context);
                },
                isLoading: homeController.isLoading,
                label: 'Voltar',
                type: ButtonType.filled,
              ),
            ],
          );
        },
      ),
    );
  }
}
