import '../database.dart';

class MediaTable extends SupabaseTable<MediaRow> {
  @override
  String get tableName => 'media';

  @override
  MediaRow createRow(Map<String, dynamic> data) => MediaRow(data);
}

class MediaRow extends SupabaseDataRow {
  MediaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaTable();

  int get userId => getField<int>('user_id')!;
  set userId(int value) => setField<int>('user_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get ipfsHash => getField<String>('ipfs_hash');
  set ipfsHash(String? value) => setField<String>('ipfs_hash', value);

  String? get filesize => getField<String>('filesize');
  set filesize(String? value) => setField<String>('filesize', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);
}
