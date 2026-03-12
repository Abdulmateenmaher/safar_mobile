import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme/app_theme.dart';
import 'presentation/blocs/theme/theme_bloc.dart';
import 'presentation/blocs/locale/locale_bloc.dart';
import 'presentation/pages/onboarding/splash_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SafarApp());
}

class SafarApp extends StatelessWidget {
  const SafarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc()..add(LoadTheme()),
        ),
        BlocProvider<LocaleBloc>(
          create: (context) => LocaleBloc()..add(LoadLocale()),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleBloc, LocaleState>(
            builder: (context, localeState) {
              return MaterialApp(
                title: 'Safar',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.themeMode == ThemeMode.dark
                    ? ThemeMode.dark
                    : themeState.themeMode == ThemeMode.light
                        ? ThemeMode.light
                        : ThemeMode.system,
                locale: localeState.locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('ps'),
                  Locale('fa'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const SplashScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
