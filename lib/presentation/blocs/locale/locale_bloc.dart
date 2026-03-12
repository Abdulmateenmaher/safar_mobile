import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Supported Locales
class AppLocale {
  static const Locale english = Locale('en');
  static const Locale pashto = Locale('ps');
  static const Locale dari = Locale('fa');

  static const List<Locale> supportedLocales = [english, pashto, dari];

  static Locale getDefault() => english;

  static String getLanguageName(Locale locale) {
    switch (locale.languageCode) {
      case 'en':
        return 'English';
      case 'ps':
        return 'Pashto';
      case 'fa':
        return 'Dari';
      default:
        return 'English';
    }
  }
}

/// Locale State
class LocaleState extends Equatable {
  final Locale locale;

  const LocaleState({required this.locale});

  LocaleState copyWith({Locale? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }

  @override
  List<Object?> get props => [locale];
}

/// Locale Events
abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object?> get props => [];
}

class LoadLocale extends LocaleEvent {}

class ChangeLocale extends LocaleEvent {
  final Locale locale;

  const ChangeLocale(this.locale);

  @override
  List<Object?> get props => [locale];
}

/// Locale BLoC
class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  static const String _localeKey = 'app_locale';

  LocaleBloc() : super(const LocaleState(locale: AppLocale.english)) {
    on<LoadLocale>(_onLoadLocale);
    on<ChangeLocale>(_onChangeLocale);
  }

  Future<void> _onLoadLocale(LoadLocale event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey) ?? 'en';
    emit(LocaleState(locale: Locale(localeCode)));
  }

  Future<void> _onChangeLocale(ChangeLocale event, Emitter<LocaleState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, event.locale.languageCode);
    emit(LocaleState(locale: event.locale));
  }
}
