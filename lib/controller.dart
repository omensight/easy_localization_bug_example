import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApplicationLocalization {
  (String, String?) locale;
  String languageName;
  ApplicationLocalization({
    required this.languageName,
    required this.locale,
  });
}

final applicationLocalizationsProvider = Provider(
  (ref) => [
    ApplicationLocalization(languageName: 'English', locale: ('en', 'US')),
    ApplicationLocalization(languageName: 'Español', locale: ('es', null)),
  ],
);

Stream<int> getIndex() async* {
  int index = 0;
  while (true) {
    if (index == 0) {
      index = 1;
    } else {
      index = 0;
    }
    yield index;
    await Future.delayed(const Duration(milliseconds: 10000));
  }
}

final indexStreamProvider = StreamProvider((ref) => getIndex());

final localizationProvider = Provider((ref) {
  final index = ref.watch(indexStreamProvider);
  final localizations = ref.watch(applicationLocalizationsProvider);
  if (index.hasValue) {
    return localizations[index.value ?? 0];
  }
});
