import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Theme State
enum AppThemeMode { system, light, dark }

class ThemeState extends Equatable {
  final AppThemeMode themeMode;

  const ThemeState({this.themeMode = AppThemeMode.dark});

  bool get isDarkMode => themeMode == AppThemeMode.dark;
  bool get isLightMode => themeMode == AppThemeMode.light;
  bool get isSystemMode => themeMode == AppThemeMode.system;

  ThemeState copyWith({AppThemeMode? themeMode}) {
    return ThemeState(themeMode: themeMode ?? this.themeMode);
  }

  @override
  List<Object?> get props => [themeMode];
}

/// Theme Events
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class LoadTheme extends ThemeEvent {}

class ChangeTheme extends ThemeEvent {
  final AppThemeMode themeMode;

  const ChangeTheme(this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}

class ToggleTheme extends ThemeEvent {}

/// Theme BLoC
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'theme_mode';

  ThemeBloc() : super(const ThemeState()) {
    on<LoadTheme>(_onLoadTheme);
    on<ChangeTheme>(_onChangeTheme);
    on<ToggleTheme>(_onToggleTheme);
  }

  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 2;
    emit(ThemeState(themeMode: AppThemeMode.values[themeIndex]));
  }

  Future<void> _onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, event.themeMode.index);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onToggleTheme(ToggleTheme event, Emitter<ThemeState> emit) async {
    final newMode = state.isDarkMode ? AppThemeMode.light : AppThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, newMode.index);
    emit(state.copyWith(themeMode: newMode));
  }
}
