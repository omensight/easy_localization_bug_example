import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_bug_example/generated/codegen_keys.g.dart';
import 'package:fluent_ui/fluent_ui.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content:
          Center(child: const Text(LocaleKeys.selectProgramsToInstall).tr()),
    );
  }
}
