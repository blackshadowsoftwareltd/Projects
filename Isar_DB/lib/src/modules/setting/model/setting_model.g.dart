// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetAppConfigCollection on Isar {
  IsarCollection<AppConfig> get appConfigs => getCollection();
}

const AppConfigSchema = CollectionSchema(
  name: 'AppConfig',
  schema:
      '{"name":"AppConfig","idName":"id","properties":[{"name":"firstRun","type":"Bool"},{"name":"hashCode","type":"Long"},{"name":"themeIndex","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'firstRun': 0, 'hashCode': 1, 'themeIndex': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _appConfigGetId,
  getLinks: _appConfigGetLinks,
  attachLinks: _appConfigAttachLinks,
  serializeNative: _appConfigSerializeNative,
  deserializeNative: _appConfigDeserializeNative,
  deserializePropNative: _appConfigDeserializePropNative,
  serializeWeb: _appConfigSerializeWeb,
  deserializeWeb: _appConfigDeserializeWeb,
  deserializePropWeb: _appConfigDeserializePropWeb,
  version: 3,
);

int? _appConfigGetId(AppConfig object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _appConfigGetLinks(AppConfig object) {
  return [];
}

void _appConfigSerializeNative(
    IsarCollection<AppConfig> collection,
    IsarRawObject rawObj,
    AppConfig object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.firstRun;
  final firstRun = value0;
  final value1 = object.hashCode;
  final hashCode = value1;
  final value2 = object.themeIndex;
  final themeIndex = value2;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], firstRun);
  writer.writeLong(offsets[1], hashCode);
  writer.writeLong(offsets[2], themeIndex);
}

AppConfig _appConfigDeserializeNative(IsarCollection<AppConfig> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = AppConfig(
    firstRun: reader.readBool(offsets[0]),
    id: id,
    themeIndex: reader.readLong(offsets[2]),
  );
  return object;
}

P _appConfigDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _appConfigSerializeWeb(
    IsarCollection<AppConfig> collection, AppConfig object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'firstRun', object.firstRun);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'themeIndex', object.themeIndex);
  return jsObj;
}

AppConfig _appConfigDeserializeWeb(
    IsarCollection<AppConfig> collection, dynamic jsObj) {
  final object = AppConfig(
    firstRun: IsarNative.jsObjectGet(jsObj, 'firstRun') ?? false,
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    themeIndex:
        IsarNative.jsObjectGet(jsObj, 'themeIndex') ?? double.negativeInfinity,
  );
  return object;
}

P _appConfigDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'firstRun':
      return (IsarNative.jsObjectGet(jsObj, 'firstRun') ?? false) as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'themeIndex':
      return (IsarNative.jsObjectGet(jsObj, 'themeIndex') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _appConfigAttachLinks(IsarCollection col, int id, AppConfig object) {}

extension AppConfigQueryWhereSort
    on QueryBuilder<AppConfig, AppConfig, QWhere> {
  QueryBuilder<AppConfig, AppConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension AppConfigQueryWhere
    on QueryBuilder<AppConfig, AppConfig, QWhereClause> {
  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<AppConfig, AppConfig, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension AppConfigQueryFilter
    on QueryBuilder<AppConfig, AppConfig, QFilterCondition> {
  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> firstRunEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'firstRun',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> themeIndexEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'themeIndex',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition>
      themeIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'themeIndex',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> themeIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'themeIndex',
      value: value,
    ));
  }

  QueryBuilder<AppConfig, AppConfig, QAfterFilterCondition> themeIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'themeIndex',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension AppConfigQueryLinks
    on QueryBuilder<AppConfig, AppConfig, QFilterCondition> {}

extension AppConfigQueryWhereSortBy
    on QueryBuilder<AppConfig, AppConfig, QSortBy> {
  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByFirstRun() {
    return addSortByInternal('firstRun', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByFirstRunDesc() {
    return addSortByInternal('firstRun', Sort.desc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByThemeIndex() {
    return addSortByInternal('themeIndex', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> sortByThemeIndexDesc() {
    return addSortByInternal('themeIndex', Sort.desc);
  }
}

extension AppConfigQueryWhereSortThenBy
    on QueryBuilder<AppConfig, AppConfig, QSortThenBy> {
  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByFirstRun() {
    return addSortByInternal('firstRun', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByFirstRunDesc() {
    return addSortByInternal('firstRun', Sort.desc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByThemeIndex() {
    return addSortByInternal('themeIndex', Sort.asc);
  }

  QueryBuilder<AppConfig, AppConfig, QAfterSortBy> thenByThemeIndexDesc() {
    return addSortByInternal('themeIndex', Sort.desc);
  }
}

extension AppConfigQueryWhereDistinct
    on QueryBuilder<AppConfig, AppConfig, QDistinct> {
  QueryBuilder<AppConfig, AppConfig, QDistinct> distinctByFirstRun() {
    return addDistinctByInternal('firstRun');
  }

  QueryBuilder<AppConfig, AppConfig, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<AppConfig, AppConfig, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<AppConfig, AppConfig, QDistinct> distinctByThemeIndex() {
    return addDistinctByInternal('themeIndex');
  }
}

extension AppConfigQueryProperty
    on QueryBuilder<AppConfig, AppConfig, QQueryProperty> {
  QueryBuilder<AppConfig, bool, QQueryOperations> firstRunProperty() {
    return addPropertyNameInternal('firstRun');
  }

  QueryBuilder<AppConfig, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<AppConfig, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<AppConfig, int, QQueryOperations> themeIndexProperty() {
    return addPropertyNameInternal('themeIndex');
  }
}
