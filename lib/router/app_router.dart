import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/home/home_screen.dart';
import '../features/communication/communication_screen.dart';
import '../features/emotion/emotion_screen.dart';
import '../features/schedule/schedule_screen.dart';
import '../features/social/social_screen.dart';
import '../features/parent/parent_screen.dart';
import '../features/parent/emotion_report_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../shared/widgets/main_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/communication',
            name: 'communication',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: CommunicationScreen(),
            ),
          ),
          GoRoute(
            path: '/emotion',
            name: 'emotion',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: EmotionScreen(),
            ),
          ),
          GoRoute(
            path: '/schedule',
            name: 'schedule',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ScheduleScreen(),
            ),
          ),
          GoRoute(
            path: '/social',
            name: 'social',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: SocialScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/parent',
        name: 'parent',
        builder: (context, state) => const ParentScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/emotion-report',
        name: 'emotion-report',
        builder: (context, state) => const EmotionReportScreen(),
      ),
    ],
  );
});
