import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get pubkey => getField<String>('pubkey');
  set pubkey(String? value) => setField<String>('pubkey', value);

  String? get storageUsed => getField<String>('storage_used');
  set storageUsed(String? value) => setField<String>('storage_used', value);

  String? get storageAllowed => getField<String>('storage_allowed');
  set storageAllowed(String? value) =>
      setField<String>('storage_allowed', value);
}
