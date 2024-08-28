// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'court.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCourtCollection on Isar {
  IsarCollection<Court> get courts => this.collection();
}

const CourtSchema = CollectionSchema(
  name: r'Court',
  id: 8071315023878232253,
  properties: {
    r'courtType': PropertySchema(
      id: 0,
      name: r'courtType',
      type: IsarType.byte,
      enumMap: _CourtcourtTypeEnumValueMap,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'instructors': PropertySchema(
      id: 2,
      name: r'instructors',
      type: IsarType.stringList,
    ),
    r'latLngLocation': PropertySchema(
      id: 3,
      name: r'latLngLocation',
      type: IsarType.object,
      target: r'LatLng',
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'pricePerHour': PropertySchema(
      id: 5,
      name: r'pricePerHour',
      type: IsarType.double,
    ),
    r'reservations': PropertySchema(
      id: 6,
      name: r'reservations',
      type: IsarType.longList,
    )
  },
  estimateSize: _courtEstimateSize,
  serialize: _courtSerialize,
  deserialize: _courtDeserialize,
  deserializeProp: _courtDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'LatLng': LatLngSchema},
  getId: _courtGetId,
  getLinks: _courtGetLinks,
  attach: _courtAttach,
  version: '3.1.0+1',
);

int _courtEstimateSize(
  Court object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.id;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.instructors;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.latLngLocation;
    if (value != null) {
      bytesCount +=
          3 + LatLngSchema.estimateSize(value, allOffsets[LatLng]!, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reservations;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _courtSerialize(
  Court object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.courtType.index);
  writer.writeString(offsets[1], object.id);
  writer.writeStringList(offsets[2], object.instructors);
  writer.writeObject<LatLng>(
    offsets[3],
    allOffsets,
    LatLngSchema.serialize,
    object.latLngLocation,
  );
  writer.writeString(offsets[4], object.name);
  writer.writeDouble(offsets[5], object.pricePerHour);
  writer.writeLongList(offsets[6], object.reservations);
}

Court _courtDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Court(
    courtType: _CourtcourtTypeValueEnumMap[reader.readByteOrNull(offsets[0])] ??
        CourtType.A,
    id: reader.readStringOrNull(offsets[1]),
    instructors: reader.readStringList(offsets[2]),
    isarId: id,
    latLngLocation: reader.readObjectOrNull<LatLng>(
      offsets[3],
      LatLngSchema.deserialize,
      allOffsets,
    ),
    name: reader.readStringOrNull(offsets[4]),
    pricePerHour: reader.readDoubleOrNull(offsets[5]),
    reservations: reader.readLongList(offsets[6]),
  );
  return object;
}

P _courtDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_CourtcourtTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          CourtType.A) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<LatLng>(
        offset,
        LatLngSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLongList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _CourtcourtTypeEnumValueMap = {
  'A': 0,
  'B': 1,
  'C': 2,
};
const _CourtcourtTypeValueEnumMap = {
  0: CourtType.A,
  1: CourtType.B,
  2: CourtType.C,
};

Id _courtGetId(Court object) {
  return object.isarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _courtGetLinks(Court object) {
  return [];
}

void _courtAttach(IsarCollection<dynamic> col, Id id, Court object) {}

extension CourtQueryWhereSort on QueryBuilder<Court, Court, QWhere> {
  QueryBuilder<Court, Court, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CourtQueryWhere on QueryBuilder<Court, Court, QWhereClause> {
  QueryBuilder<Court, Court, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Court, Court, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Court, Court, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Court, Court, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CourtQueryFilter on QueryBuilder<Court, Court, QFilterCondition> {
  QueryBuilder<Court, Court, QAfterFilterCondition> courtTypeEqualTo(
      CourtType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'courtType',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> courtTypeGreaterThan(
    CourtType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'courtType',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> courtTypeLessThan(
    CourtType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'courtType',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> courtTypeBetween(
    CourtType lower,
    CourtType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'courtType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instructors',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instructors',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      instructorsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instructors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instructors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instructors',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      instructorsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instructors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instructors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instructors',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instructors',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      instructorsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructors',
        value: '',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      instructorsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instructors',
        value: '',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      instructorsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> instructorsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'instructors',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> isarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> isarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isarId',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> isarIdEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> isarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> isarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> isarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> latLngLocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latLngLocation',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> latLngLocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latLngLocation',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> pricePerHourIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pricePerHour',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> pricePerHourIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pricePerHour',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> pricePerHourEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pricePerHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> pricePerHourGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pricePerHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> pricePerHourLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pricePerHour',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> pricePerHourBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pricePerHour',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reservations',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reservations',
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reservations',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      reservationsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reservations',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reservations',
        value: value,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reservations',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservations',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservations',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservations',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservations',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition>
      reservationsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservations',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Court, Court, QAfterFilterCondition> reservationsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'reservations',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension CourtQueryObject on QueryBuilder<Court, Court, QFilterCondition> {
  QueryBuilder<Court, Court, QAfterFilterCondition> latLngLocation(
      FilterQuery<LatLng> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'latLngLocation');
    });
  }
}

extension CourtQueryLinks on QueryBuilder<Court, Court, QFilterCondition> {}

extension CourtQuerySortBy on QueryBuilder<Court, Court, QSortBy> {
  QueryBuilder<Court, Court, QAfterSortBy> sortByCourtType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courtType', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortByCourtTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courtType', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortByPricePerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> sortByPricePerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.desc);
    });
  }
}

extension CourtQuerySortThenBy on QueryBuilder<Court, Court, QSortThenBy> {
  QueryBuilder<Court, Court, QAfterSortBy> thenByCourtType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courtType', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByCourtTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'courtType', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByPricePerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.asc);
    });
  }

  QueryBuilder<Court, Court, QAfterSortBy> thenByPricePerHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pricePerHour', Sort.desc);
    });
  }
}

extension CourtQueryWhereDistinct on QueryBuilder<Court, Court, QDistinct> {
  QueryBuilder<Court, Court, QDistinct> distinctByCourtType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'courtType');
    });
  }

  QueryBuilder<Court, Court, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Court, Court, QDistinct> distinctByInstructors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instructors');
    });
  }

  QueryBuilder<Court, Court, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Court, Court, QDistinct> distinctByPricePerHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pricePerHour');
    });
  }

  QueryBuilder<Court, Court, QDistinct> distinctByReservations() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reservations');
    });
  }
}

extension CourtQueryProperty on QueryBuilder<Court, Court, QQueryProperty> {
  QueryBuilder<Court, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Court, CourtType, QQueryOperations> courtTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'courtType');
    });
  }

  QueryBuilder<Court, String?, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Court, List<String>?, QQueryOperations> instructorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructors');
    });
  }

  QueryBuilder<Court, LatLng?, QQueryOperations> latLngLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latLngLocation');
    });
  }

  QueryBuilder<Court, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Court, double?, QQueryOperations> pricePerHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pricePerHour');
    });
  }

  QueryBuilder<Court, List<int>?, QQueryOperations> reservationsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reservations');
    });
  }
}
