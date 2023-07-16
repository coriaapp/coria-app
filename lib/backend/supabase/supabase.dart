import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://ubxkjwxvxwslrmsbmyvx.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVieGtqd3h2eHdzbHJtc2JteXZ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk1MDk0MTIsImV4cCI6MjAwNTA4NTQxMn0.76Tovz7H4_x9uT7zBoKMeaMF6nnA_cirIzIyufV8b68';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
