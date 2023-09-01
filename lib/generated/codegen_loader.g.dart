// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en_US = {
  "selectProgramsToInstall": "Select programs to install",
  "addProgram": "Add program",
  "installSelectedPrograms": {
    "zero": "Please select programs to install",
    "one": "Install {} selected programs",
    "other": "Install {} selected programs"
  }
};
static const Map<String,dynamic> es = {
  "selectProgramsToInstall": "Programas a instalar",
  "addProgram": "Añadir un programa",
  "installSelectedPrograms": {
    "zero": "Seleccione los programas para instalar",
    "one": "Instalar {} programa seleccionados",
    "other": "Instalar {} programas seleccionados"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en_US": en_US, "es": es};
}
