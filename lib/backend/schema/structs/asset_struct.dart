// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssetStruct extends BaseStruct {
  AssetStruct({
    String? checksum,
    String? ipfsHash,
    String? tempUri,
    String? libraryUri,
  })  : _checksum = checksum,
        _ipfsHash = ipfsHash,
        _tempUri = tempUri,
        _libraryUri = libraryUri;

  // "checksum" field.
  String? _checksum;
  String get checksum => _checksum ?? '';
  set checksum(String? val) => _checksum = val;
  bool hasChecksum() => _checksum != null;

  // "ipfs_hash" field.
  String? _ipfsHash;
  String get ipfsHash => _ipfsHash ?? '';
  set ipfsHash(String? val) => _ipfsHash = val;
  bool hasIpfsHash() => _ipfsHash != null;

  // "temp_uri" field.
  String? _tempUri;
  String get tempUri => _tempUri ?? '';
  set tempUri(String? val) => _tempUri = val;
  bool hasTempUri() => _tempUri != null;

  // "library_uri" field.
  String? _libraryUri;
  String get libraryUri => _libraryUri ?? '';
  set libraryUri(String? val) => _libraryUri = val;
  bool hasLibraryUri() => _libraryUri != null;

  static AssetStruct fromMap(Map<String, dynamic> data) => AssetStruct(
        checksum: data['checksum'] as String?,
        ipfsHash: data['ipfs_hash'] as String?,
        tempUri: data['temp_uri'] as String?,
        libraryUri: data['library_uri'] as String?,
      );

  static AssetStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AssetStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'checksum': _checksum,
        'ipfs_hash': _ipfsHash,
        'temp_uri': _tempUri,
        'library_uri': _libraryUri,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'checksum': serializeParam(
          _checksum,
          ParamType.String,
        ),
        'ipfs_hash': serializeParam(
          _ipfsHash,
          ParamType.String,
        ),
        'temp_uri': serializeParam(
          _tempUri,
          ParamType.String,
        ),
        'library_uri': serializeParam(
          _libraryUri,
          ParamType.String,
        ),
      }.withoutNulls;

  static AssetStruct fromSerializableMap(Map<String, dynamic> data) =>
      AssetStruct(
        checksum: deserializeParam(
          data['checksum'],
          ParamType.String,
          false,
        ),
        ipfsHash: deserializeParam(
          data['ipfs_hash'],
          ParamType.String,
          false,
        ),
        tempUri: deserializeParam(
          data['temp_uri'],
          ParamType.String,
          false,
        ),
        libraryUri: deserializeParam(
          data['library_uri'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AssetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssetStruct &&
        checksum == other.checksum &&
        ipfsHash == other.ipfsHash &&
        tempUri == other.tempUri &&
        libraryUri == other.libraryUri;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([checksum, ipfsHash, tempUri, libraryUri]);
}

AssetStruct createAssetStruct({
  String? checksum,
  String? ipfsHash,
  String? tempUri,
  String? libraryUri,
}) =>
    AssetStruct(
      checksum: checksum,
      ipfsHash: ipfsHash,
      tempUri: tempUri,
      libraryUri: libraryUri,
    );
