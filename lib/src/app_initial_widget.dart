import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppInitialWidget extends StatelessWidget {
  Widget build(BuildContext context){
    // set json file directory
    // default value is ['lib/i18n']
    LocalJsonLocalization.delegate.directories = ['lib/i18n'];

    return MaterialApp.router(
      title: 'My Smart App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        // define pt_BR as default when de language code is 'pt'
        if (locale?.languageCode == 'pt') {
          return Locale('pt', 'BR');
        }

        // default language
        return Locale('en', 'US');
      },
    ); //added by extension
  }
}