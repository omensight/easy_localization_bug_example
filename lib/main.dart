import 'package:easy_localization_bug_example/generated/codegen_loader.g.dart';
import 'package:easy_localization_bug_example/routes.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await WindowManager.instance.ensureInitialized();
  runApp(ProviderScope(
    child: EasyLocalization(
        assetLoader: const CodegenLoader(),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('es'),
        ],
        fallbackLocale: const Locale('en', 'US'),
        path: 'assets/langs',
        child: const MyApp()),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FluentApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(goRouterProvider),
      theme: FluentThemeData(
        scaffoldBackgroundColor: const Color(0xfff8f9fc),
      ),
    );
  }
}
