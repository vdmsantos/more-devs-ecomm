import 'package:flutter/material.dart';
import 'package:more_devs_do_zero/shared/widgets/app_elevated_button.dart';
import 'package:provider/provider.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;
  String email = '';
  int visits = 0;

  void registerVisit() {
    visits++;
    notifyListeners();
  }

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
  void initState() {
    super.initState();
    context.read<HomeController>().registerVisit();
  }

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
              Text(
                'Visitas nesta sessão: ${homeController.visits}',
                style: const TextStyle(fontSize: 16),
              ),
              AppElevatedButton(
                onPressed: () {
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
