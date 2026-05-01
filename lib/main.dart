import 'package:flutter/material.dart';
import 'package:taskly_app/core/di/dependency_injection.dart';
import 'package:taskly_app/core/routing/app_router.dart';
import 'package:taskly_app/taskly_app.dart';

void main() {
  setupGetIt();
  runApp(TasklyApp(appRouter: AppRouter()));
}
