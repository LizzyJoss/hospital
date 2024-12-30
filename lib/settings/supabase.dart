import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseHelper {
  static const String supabaseUrl = 'https://hwfygvpmhnuwmvqhnico.supabase.co';
  static const String supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imh3ZnlndnBtaG51d212cWhuaWNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU1NzQ1MzQsImV4cCI6MjA1MTE1MDUzNH0.bcHWrLBVX_FC4abii9l34w3F7CEbLBmYoU_94YIlPpI';

  static Future<void> init() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}
