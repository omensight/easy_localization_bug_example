import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_bug_example/controller.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainNavigationView extends ConsumerWidget {
  final Widget child;
  final GoRouterState state;
  const MainNavigationView({
    super.key,
    required this.child,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(localizationProvider, (previous, localization) {
      var languageCode = localization?.locale.$1;
      var countryCode = localization?.locale.$2;
      if (languageCode != null && countryCode != null) {
        EasyLocalization.of(context)
            ?.setLocale(Locale(languageCode, countryCode));
      } else if (languageCode != null) {
        EasyLocalization.of(context)?.setLocale(Locale(languageCode));
      }
    });
    final localizations = ref.watch(applicationLocalizationsProvider);
    return NavigationView(
      appBar: NavigationAppBar(
        title: const SizedBox(
          width: double.infinity,
          child: Text('No click'),
        ),
        actions: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ComboBox<ApplicationLocalization>(
              items: localizations
                  .map(
                    (e) => ComboBoxItem<ApplicationLocalization>(
                      value: e,
                      child: Text(e.languageName),
                    ),
                  )
                  .toList(),
              value: ref.watch(localizationProvider),
              onChanged: (value) {},
            ),
          ],
        ),
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: const AspectRatio(
            aspectRatio: 1,
            child: IconButton(icon: Icon(FluentIcons.back), onPressed: null),
          ),
        ),
      ),
      content: child,
    );
  }
}
