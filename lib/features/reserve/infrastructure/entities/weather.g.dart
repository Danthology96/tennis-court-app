// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WeatherSchema = Schema(
  name: r'Weather',
  id: 1917014909070542811,
  properties: {
    r'current': PropertySchema(
      id: 0,
      name: r'current',
      type: IsarType.object,
      target: r'Current',
    ),
    r'daily': PropertySchema(
      id: 1,
      name: r'daily',
      type: IsarType.objectList,
      target: r'Daily',
    ),
    r'hourly': PropertySchema(
      id: 2,
      name: r'hourly',
      type: IsarType.objectList,
      target: r'Current',
    ),
    r'lat': PropertySchema(
      id: 3,
      name: r'lat',
      type: IsarType.double,
    ),
    r'lon': PropertySchema(
      id: 4,
      name: r'lon',
      type: IsarType.double,
    ),
    r'minutely': PropertySchema(
      id: 5,
      name: r'minutely',
      type: IsarType.objectList,
      target: r'Minutely',
    ),
    r'timezone': PropertySchema(
      id: 6,
      name: r'timezone',
      type: IsarType.string,
    ),
    r'timezoneOffset': PropertySchema(
      id: 7,
      name: r'timezoneOffset',
      type: IsarType.long,
    )
  },
  estimateSize: _weatherEstimateSize,
  serialize: _weatherSerialize,
  deserialize: _weatherDeserialize,
  deserializeProp: _weatherDeserializeProp,
);

int _weatherEstimateSize(
  Weather object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.current;
    if (value != null) {
      bytesCount += 3 +
          CurrentSchema.estimateSize(value, allOffsets[Current]!, allOffsets);
    }
  }
  {
    final list = object.daily;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Daily]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += DailySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.hourly;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Current]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += CurrentSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final list = object.minutely;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Minutely]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += MinutelySchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.timezone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _weatherSerialize(
  Weather object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Current>(
    offsets[0],
    allOffsets,
    CurrentSchema.serialize,
    object.current,
  );
  writer.writeObjectList<Daily>(
    offsets[1],
    allOffsets,
    DailySchema.serialize,
    object.daily,
  );
  writer.writeObjectList<Current>(
    offsets[2],
    allOffsets,
    CurrentSchema.serialize,
    object.hourly,
  );
  writer.writeDouble(offsets[3], object.lat);
  writer.writeDouble(offsets[4], object.lon);
  writer.writeObjectList<Minutely>(
    offsets[5],
    allOffsets,
    MinutelySchema.serialize,
    object.minutely,
  );
  writer.writeString(offsets[6], object.timezone);
  writer.writeLong(offsets[7], object.timezoneOffset);
}

Weather _weatherDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Weather(
    current: reader.readObjectOrNull<Current>(
      offsets[0],
      CurrentSchema.deserialize,
      allOffsets,
    ),
    daily: reader.readObjectList<Daily>(
      offsets[1],
      DailySchema.deserialize,
      allOffsets,
      Daily(),
    ),
    hourly: reader.readObjectList<Current>(
      offsets[2],
      CurrentSchema.deserialize,
      allOffsets,
      Current(),
    ),
    lat: reader.readDoubleOrNull(offsets[3]),
    lon: reader.readDoubleOrNull(offsets[4]),
    minutely: reader.readObjectList<Minutely>(
      offsets[5],
      MinutelySchema.deserialize,
      allOffsets,
      Minutely(),
    ),
    timezone: reader.readStringOrNull(offsets[6]),
    timezoneOffset: reader.readLongOrNull(offsets[7]),
  );
  return object;
}

P _weatherDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Current>(
        offset,
        CurrentSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readObjectList<Daily>(
        offset,
        DailySchema.deserialize,
        allOffsets,
        Daily(),
      )) as P;
    case 2:
      return (reader.readObjectList<Current>(
        offset,
        CurrentSchema.deserialize,
        allOffsets,
        Current(),
      )) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readObjectList<Minutely>(
        offset,
        MinutelySchema.deserialize,
        allOffsets,
        Minutely(),
      )) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension WeatherQueryFilter
    on QueryBuilder<Weather, Weather, QFilterCondition> {
  QueryBuilder<Weather, Weather, QAfterFilterCondition> currentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'current',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> currentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'current',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'daily',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'daily',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daily',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daily',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daily',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daily',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daily',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'daily',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hourly',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hourly',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hourly',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hourly',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hourly',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hourly',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hourly',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'hourly',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> latIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> latIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lat',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> latEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> latGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> latLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lat',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> latBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lon',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lon',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lonEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lonGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lonLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lon',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> lonBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'minutely',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'minutely',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'minutely',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'minutely',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'minutely',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'minutely',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      minutelyLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'minutely',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'minutely',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timezone',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timezone',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timezone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timezone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timezone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezone',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timezone',
        value: '',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneOffsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timezoneOffset',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      timezoneOffsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timezoneOffset',
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneOffsetEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timezoneOffset',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition>
      timezoneOffsetGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timezoneOffset',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneOffsetLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timezoneOffset',
        value: value,
      ));
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> timezoneOffsetBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timezoneOffset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeatherQueryObject
    on QueryBuilder<Weather, Weather, QFilterCondition> {
  QueryBuilder<Weather, Weather, QAfterFilterCondition> current(
      FilterQuery<Current> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'current');
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> dailyElement(
      FilterQuery<Daily> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'daily');
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> hourlyElement(
      FilterQuery<Current> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'hourly');
    });
  }

  QueryBuilder<Weather, Weather, QAfterFilterCondition> minutelyElement(
      FilterQuery<Minutely> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'minutely');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const CurrentSchema = Schema(
  name: r'Current',
  id: 1527837780781964551,
  properties: {
    r'clouds': PropertySchema(
      id: 0,
      name: r'clouds',
      type: IsarType.long,
    ),
    r'dewPoint': PropertySchema(
      id: 1,
      name: r'dewPoint',
      type: IsarType.double,
    ),
    r'dt': PropertySchema(
      id: 2,
      name: r'dt',
      type: IsarType.long,
    ),
    r'feelsLike': PropertySchema(
      id: 3,
      name: r'feelsLike',
      type: IsarType.double,
    ),
    r'humidity': PropertySchema(
      id: 4,
      name: r'humidity',
      type: IsarType.long,
    ),
    r'pop': PropertySchema(
      id: 5,
      name: r'pop',
      type: IsarType.double,
    ),
    r'pressure': PropertySchema(
      id: 6,
      name: r'pressure',
      type: IsarType.long,
    ),
    r'rain': PropertySchema(
      id: 7,
      name: r'rain',
      type: IsarType.object,
      target: r'Rain',
    ),
    r'sunrise': PropertySchema(
      id: 8,
      name: r'sunrise',
      type: IsarType.long,
    ),
    r'sunset': PropertySchema(
      id: 9,
      name: r'sunset',
      type: IsarType.long,
    ),
    r'temp': PropertySchema(
      id: 10,
      name: r'temp',
      type: IsarType.double,
    ),
    r'uvi': PropertySchema(
      id: 11,
      name: r'uvi',
      type: IsarType.double,
    ),
    r'visibility': PropertySchema(
      id: 12,
      name: r'visibility',
      type: IsarType.long,
    ),
    r'weather': PropertySchema(
      id: 13,
      name: r'weather',
      type: IsarType.objectList,
      target: r'WeatherElement',
    ),
    r'windDeg': PropertySchema(
      id: 14,
      name: r'windDeg',
      type: IsarType.long,
    ),
    r'windGust': PropertySchema(
      id: 15,
      name: r'windGust',
      type: IsarType.double,
    ),
    r'windSpeed': PropertySchema(
      id: 16,
      name: r'windSpeed',
      type: IsarType.double,
    )
  },
  estimateSize: _currentEstimateSize,
  serialize: _currentSerialize,
  deserialize: _currentDeserialize,
  deserializeProp: _currentDeserializeProp,
);

int _currentEstimateSize(
  Current object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.rain;
    if (value != null) {
      bytesCount +=
          3 + RainSchema.estimateSize(value, allOffsets[Rain]!, allOffsets);
    }
  }
  {
    final list = object.weather;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WeatherElement]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WeatherElementSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _currentSerialize(
  Current object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clouds);
  writer.writeDouble(offsets[1], object.dewPoint);
  writer.writeLong(offsets[2], object.dt);
  writer.writeDouble(offsets[3], object.feelsLike);
  writer.writeLong(offsets[4], object.humidity);
  writer.writeDouble(offsets[5], object.pop);
  writer.writeLong(offsets[6], object.pressure);
  writer.writeObject<Rain>(
    offsets[7],
    allOffsets,
    RainSchema.serialize,
    object.rain,
  );
  writer.writeLong(offsets[8], object.sunrise);
  writer.writeLong(offsets[9], object.sunset);
  writer.writeDouble(offsets[10], object.temp);
  writer.writeDouble(offsets[11], object.uvi);
  writer.writeLong(offsets[12], object.visibility);
  writer.writeObjectList<WeatherElement>(
    offsets[13],
    allOffsets,
    WeatherElementSchema.serialize,
    object.weather,
  );
  writer.writeLong(offsets[14], object.windDeg);
  writer.writeDouble(offsets[15], object.windGust);
  writer.writeDouble(offsets[16], object.windSpeed);
}

Current _currentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Current(
    clouds: reader.readLongOrNull(offsets[0]),
    dewPoint: reader.readDoubleOrNull(offsets[1]),
    dt: reader.readLongOrNull(offsets[2]),
    feelsLike: reader.readDoubleOrNull(offsets[3]),
    humidity: reader.readLongOrNull(offsets[4]),
    pop: reader.readDoubleOrNull(offsets[5]),
    pressure: reader.readLongOrNull(offsets[6]),
    rain: reader.readObjectOrNull<Rain>(
      offsets[7],
      RainSchema.deserialize,
      allOffsets,
    ),
    sunrise: reader.readLongOrNull(offsets[8]),
    sunset: reader.readLongOrNull(offsets[9]),
    temp: reader.readDoubleOrNull(offsets[10]),
    uvi: reader.readDoubleOrNull(offsets[11]),
    visibility: reader.readLongOrNull(offsets[12]),
    weather: reader.readObjectList<WeatherElement>(
      offsets[13],
      WeatherElementSchema.deserialize,
      allOffsets,
      WeatherElement(),
    ),
    windDeg: reader.readLongOrNull(offsets[14]),
    windGust: reader.readDoubleOrNull(offsets[15]),
    windSpeed: reader.readDoubleOrNull(offsets[16]),
  );
  return object;
}

P _currentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<Rain>(
        offset,
        RainSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readObjectList<WeatherElement>(
        offset,
        WeatherElementSchema.deserialize,
        allOffsets,
        WeatherElement(),
      )) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension CurrentQueryFilter
    on QueryBuilder<Current, Current, QFilterCondition> {
  QueryBuilder<Current, Current, QAfterFilterCondition> cloudsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clouds',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> cloudsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clouds',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> cloudsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clouds',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> cloudsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clouds',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> cloudsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clouds',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> cloudsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clouds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dewPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dewPoint',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dewPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dewPoint',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dewPointEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dewPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dewPointGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dewPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dewPointLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dewPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dewPointBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dewPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dt',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dt',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> dtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> feelsLikeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feelsLike',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> feelsLikeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feelsLike',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> feelsLikeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> feelsLikeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> feelsLikeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feelsLike',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> feelsLikeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feelsLike',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> humidityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> humidityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> humidityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> humidityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> humidityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> humidityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'humidity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> popIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pop',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> popIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pop',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> popEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pop',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> popGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pop',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> popLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pop',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> popBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pop',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> pressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> pressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> pressureEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> pressureGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> pressureLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> pressureBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> rainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> rainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunriseEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunriseGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunriseLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunriseBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunsetEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunsetGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunset',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunsetLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunset',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> sunsetBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> tempIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temp',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> tempIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temp',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> tempEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'temp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> tempGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'temp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> tempLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'temp',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> tempBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'temp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> uviIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvi',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> uviIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvi',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> uviEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> uviGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> uviLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> uviBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> visibilityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> visibilityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visibility',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> visibilityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visibility',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> visibilityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visibility',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> visibilityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visibility',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> visibilityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visibility',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weather',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weather',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition>
      weatherLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windDegIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windDeg',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windDegIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windDeg',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windDegEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windDeg',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windDegGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windDeg',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windDegLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windDeg',
        value: value,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windDegBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windDeg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windGustIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windGust',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windGustIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windGust',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windGustEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windGust',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windGustGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windGust',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windGustLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windGust',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windGustBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windGust',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windSpeed',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windSpeed',
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windSpeedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windSpeedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windSpeedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> windSpeedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension CurrentQueryObject
    on QueryBuilder<Current, Current, QFilterCondition> {
  QueryBuilder<Current, Current, QAfterFilterCondition> rain(
      FilterQuery<Rain> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'rain');
    });
  }

  QueryBuilder<Current, Current, QAfterFilterCondition> weatherElement(
      FilterQuery<WeatherElement> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weather');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const RainSchema = Schema(
  name: r'Rain',
  id: 4199326237044368563,
  properties: {
    r'the1H': PropertySchema(
      id: 0,
      name: r'the1H',
      type: IsarType.double,
    )
  },
  estimateSize: _rainEstimateSize,
  serialize: _rainSerialize,
  deserialize: _rainDeserialize,
  deserializeProp: _rainDeserializeProp,
);

int _rainEstimateSize(
  Rain object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _rainSerialize(
  Rain object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.the1H);
}

Rain _rainDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Rain(
    the1H: reader.readDoubleOrNull(offsets[0]),
  );
  return object;
}

P _rainDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension RainQueryFilter on QueryBuilder<Rain, Rain, QFilterCondition> {
  QueryBuilder<Rain, Rain, QAfterFilterCondition> the1HIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'the1H',
      ));
    });
  }

  QueryBuilder<Rain, Rain, QAfterFilterCondition> the1HIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'the1H',
      ));
    });
  }

  QueryBuilder<Rain, Rain, QAfterFilterCondition> the1HEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'the1H',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Rain, Rain, QAfterFilterCondition> the1HGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'the1H',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Rain, Rain, QAfterFilterCondition> the1HLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'the1H',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Rain, Rain, QAfterFilterCondition> the1HBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'the1H',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension RainQueryObject on QueryBuilder<Rain, Rain, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const WeatherElementSchema = Schema(
  name: r'WeatherElement',
  id: 649784652998818099,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.byte,
      enumMap: _WeatherElementdescriptionEnumValueMap,
    ),
    r'icon': PropertySchema(
      id: 1,
      name: r'icon',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.long,
    ),
    r'main': PropertySchema(
      id: 3,
      name: r'main',
      type: IsarType.byte,
      enumMap: _WeatherElementmainEnumValueMap,
    )
  },
  estimateSize: _weatherElementEstimateSize,
  serialize: _weatherElementSerialize,
  deserialize: _weatherElementDeserialize,
  deserializeProp: _weatherElementDeserializeProp,
);

int _weatherElementEstimateSize(
  WeatherElement object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.icon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _weatherElementSerialize(
  WeatherElement object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.description.index);
  writer.writeString(offsets[1], object.icon);
  writer.writeLong(offsets[2], object.id);
  writer.writeByte(offsets[3], object.main.index);
}

WeatherElement _weatherElementDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WeatherElement(
    description: _WeatherElementdescriptionValueEnumMap[
            reader.readByteOrNull(offsets[0])] ??
        WeatherDescription.clearSky,
    icon: reader.readStringOrNull(offsets[1]),
    id: reader.readLongOrNull(offsets[2]),
    main: _WeatherElementmainValueEnumMap[reader.readByteOrNull(offsets[3])] ??
        MainWeatherDesc.clear,
  );
  return object;
}

P _weatherElementDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_WeatherElementdescriptionValueEnumMap[
              reader.readByteOrNull(offset)] ??
          WeatherDescription.clearSky) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (_WeatherElementmainValueEnumMap[reader.readByteOrNull(offset)] ??
          MainWeatherDesc.clear) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WeatherElementdescriptionEnumValueMap = {
  'brokenClouds': 0,
  'clearSky': 1,
  'fewClouds': 2,
  'lightRain': 3,
  'moderateRain': 4,
  'overcastClouds': 5,
  'scatteredClouds': 6,
};
const _WeatherElementdescriptionValueEnumMap = {
  0: WeatherDescription.brokenClouds,
  1: WeatherDescription.clearSky,
  2: WeatherDescription.fewClouds,
  3: WeatherDescription.lightRain,
  4: WeatherDescription.moderateRain,
  5: WeatherDescription.overcastClouds,
  6: WeatherDescription.scatteredClouds,
};
const _WeatherElementmainEnumValueMap = {
  'clear': 0,
  'clouds': 1,
  'rain': 2,
};
const _WeatherElementmainValueEnumMap = {
  0: MainWeatherDesc.clear,
  1: MainWeatherDesc.clouds,
  2: MainWeatherDesc.rain,
};

extension WeatherElementQueryFilter
    on QueryBuilder<WeatherElement, WeatherElement, QFilterCondition> {
  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      descriptionEqualTo(WeatherDescription value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      descriptionGreaterThan(
    WeatherDescription value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      descriptionLessThan(
    WeatherDescription value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      descriptionBetween(
    WeatherDescription lower,
    WeatherDescription upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'icon',
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'icon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'icon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'icon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      iconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'icon',
        value: '',
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition> idEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      idLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      mainEqualTo(MainWeatherDesc value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'main',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      mainGreaterThan(
    MainWeatherDesc value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'main',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      mainLessThan(
    MainWeatherDesc value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'main',
        value: value,
      ));
    });
  }

  QueryBuilder<WeatherElement, WeatherElement, QAfterFilterCondition>
      mainBetween(
    MainWeatherDesc lower,
    MainWeatherDesc upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'main',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WeatherElementQueryObject
    on QueryBuilder<WeatherElement, WeatherElement, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DailySchema = Schema(
  name: r'Daily',
  id: -4740782094237137890,
  properties: {
    r'clouds': PropertySchema(
      id: 0,
      name: r'clouds',
      type: IsarType.long,
    ),
    r'dewPoint': PropertySchema(
      id: 1,
      name: r'dewPoint',
      type: IsarType.double,
    ),
    r'dt': PropertySchema(
      id: 2,
      name: r'dt',
      type: IsarType.long,
    ),
    r'feelsLike': PropertySchema(
      id: 3,
      name: r'feelsLike',
      type: IsarType.object,
      target: r'FeelsLike',
    ),
    r'humidity': PropertySchema(
      id: 4,
      name: r'humidity',
      type: IsarType.long,
    ),
    r'moonPhase': PropertySchema(
      id: 5,
      name: r'moonPhase',
      type: IsarType.double,
    ),
    r'moonrise': PropertySchema(
      id: 6,
      name: r'moonrise',
      type: IsarType.long,
    ),
    r'moonset': PropertySchema(
      id: 7,
      name: r'moonset',
      type: IsarType.long,
    ),
    r'pop': PropertySchema(
      id: 8,
      name: r'pop',
      type: IsarType.double,
    ),
    r'pressure': PropertySchema(
      id: 9,
      name: r'pressure',
      type: IsarType.long,
    ),
    r'rain': PropertySchema(
      id: 10,
      name: r'rain',
      type: IsarType.double,
    ),
    r'summary': PropertySchema(
      id: 11,
      name: r'summary',
      type: IsarType.string,
    ),
    r'sunrise': PropertySchema(
      id: 12,
      name: r'sunrise',
      type: IsarType.long,
    ),
    r'sunset': PropertySchema(
      id: 13,
      name: r'sunset',
      type: IsarType.long,
    ),
    r'temp': PropertySchema(
      id: 14,
      name: r'temp',
      type: IsarType.object,
      target: r'Temp',
    ),
    r'uvi': PropertySchema(
      id: 15,
      name: r'uvi',
      type: IsarType.double,
    ),
    r'weather': PropertySchema(
      id: 16,
      name: r'weather',
      type: IsarType.objectList,
      target: r'WeatherElement',
    ),
    r'windDeg': PropertySchema(
      id: 17,
      name: r'windDeg',
      type: IsarType.long,
    ),
    r'windGust': PropertySchema(
      id: 18,
      name: r'windGust',
      type: IsarType.double,
    ),
    r'windSpeed': PropertySchema(
      id: 19,
      name: r'windSpeed',
      type: IsarType.double,
    )
  },
  estimateSize: _dailyEstimateSize,
  serialize: _dailySerialize,
  deserialize: _dailyDeserialize,
  deserializeProp: _dailyDeserializeProp,
);

int _dailyEstimateSize(
  Daily object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.feelsLike;
    if (value != null) {
      bytesCount += 3 +
          FeelsLikeSchema.estimateSize(
              value, allOffsets[FeelsLike]!, allOffsets);
    }
  }
  {
    final value = object.summary;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.temp;
    if (value != null) {
      bytesCount +=
          3 + TempSchema.estimateSize(value, allOffsets[Temp]!, allOffsets);
    }
  }
  {
    final list = object.weather;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[WeatherElement]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              WeatherElementSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  return bytesCount;
}

void _dailySerialize(
  Daily object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clouds);
  writer.writeDouble(offsets[1], object.dewPoint);
  writer.writeLong(offsets[2], object.dt);
  writer.writeObject<FeelsLike>(
    offsets[3],
    allOffsets,
    FeelsLikeSchema.serialize,
    object.feelsLike,
  );
  writer.writeLong(offsets[4], object.humidity);
  writer.writeDouble(offsets[5], object.moonPhase);
  writer.writeLong(offsets[6], object.moonrise);
  writer.writeLong(offsets[7], object.moonset);
  writer.writeDouble(offsets[8], object.pop);
  writer.writeLong(offsets[9], object.pressure);
  writer.writeDouble(offsets[10], object.rain);
  writer.writeString(offsets[11], object.summary);
  writer.writeLong(offsets[12], object.sunrise);
  writer.writeLong(offsets[13], object.sunset);
  writer.writeObject<Temp>(
    offsets[14],
    allOffsets,
    TempSchema.serialize,
    object.temp,
  );
  writer.writeDouble(offsets[15], object.uvi);
  writer.writeObjectList<WeatherElement>(
    offsets[16],
    allOffsets,
    WeatherElementSchema.serialize,
    object.weather,
  );
  writer.writeLong(offsets[17], object.windDeg);
  writer.writeDouble(offsets[18], object.windGust);
  writer.writeDouble(offsets[19], object.windSpeed);
}

Daily _dailyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Daily(
    clouds: reader.readLongOrNull(offsets[0]),
    dewPoint: reader.readDoubleOrNull(offsets[1]),
    dt: reader.readLongOrNull(offsets[2]),
    feelsLike: reader.readObjectOrNull<FeelsLike>(
      offsets[3],
      FeelsLikeSchema.deserialize,
      allOffsets,
    ),
    humidity: reader.readLongOrNull(offsets[4]),
    moonPhase: reader.readDoubleOrNull(offsets[5]),
    moonrise: reader.readLongOrNull(offsets[6]),
    moonset: reader.readLongOrNull(offsets[7]),
    pop: reader.readDoubleOrNull(offsets[8]),
    pressure: reader.readLongOrNull(offsets[9]),
    rain: reader.readDoubleOrNull(offsets[10]),
    summary: reader.readStringOrNull(offsets[11]),
    sunrise: reader.readLongOrNull(offsets[12]),
    sunset: reader.readLongOrNull(offsets[13]),
    temp: reader.readObjectOrNull<Temp>(
      offsets[14],
      TempSchema.deserialize,
      allOffsets,
    ),
    uvi: reader.readDoubleOrNull(offsets[15]),
    weather: reader.readObjectList<WeatherElement>(
      offsets[16],
      WeatherElementSchema.deserialize,
      allOffsets,
      WeatherElement(),
    ),
    windDeg: reader.readLongOrNull(offsets[17]),
    windGust: reader.readDoubleOrNull(offsets[18]),
    windSpeed: reader.readDoubleOrNull(offsets[19]),
  );
  return object;
}

P _dailyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<FeelsLike>(
        offset,
        FeelsLikeSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readDoubleOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset)) as P;
    case 13:
      return (reader.readLongOrNull(offset)) as P;
    case 14:
      return (reader.readObjectOrNull<Temp>(
        offset,
        TempSchema.deserialize,
        allOffsets,
      )) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readObjectList<WeatherElement>(
        offset,
        WeatherElementSchema.deserialize,
        allOffsets,
        WeatherElement(),
      )) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readDoubleOrNull(offset)) as P;
    case 19:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DailyQueryFilter on QueryBuilder<Daily, Daily, QFilterCondition> {
  QueryBuilder<Daily, Daily, QAfterFilterCondition> cloudsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clouds',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> cloudsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clouds',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> cloudsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clouds',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> cloudsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clouds',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> cloudsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clouds',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> cloudsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clouds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dewPointIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dewPoint',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dewPointIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dewPoint',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dewPointEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dewPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dewPointGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dewPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dewPointLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dewPoint',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dewPointBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dewPoint',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dt',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dt',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dtEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> dtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> feelsLikeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feelsLike',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> feelsLikeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feelsLike',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> humidityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> humidityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'humidity',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> humidityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> humidityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> humidityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'humidity',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> humidityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'humidity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonPhaseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moonPhase',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonPhaseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moonPhase',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonPhaseEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moonPhase',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonPhaseGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moonPhase',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonPhaseLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moonPhase',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonPhaseBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moonPhase',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moonrise',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moonrise',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonriseEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moonrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonriseGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moonrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonriseLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moonrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonriseBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moonrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'moonset',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'moonset',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonsetEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moonset',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonsetGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moonset',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonsetLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moonset',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> moonsetBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moonset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> popIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pop',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> popIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pop',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> popEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pop',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> popGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pop',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> popLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pop',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> popBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pop',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> pressureIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> pressureIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pressure',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> pressureEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> pressureGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> pressureLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pressure',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> pressureBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pressure',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> rainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> rainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rain',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> rainEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> rainGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> rainLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rain',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> rainBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'summary',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'summary',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'summary',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'summary',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> summaryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'summary',
        value: '',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunriseIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunriseIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunrise',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunriseEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunriseGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunriseLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunrise',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunriseBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunrise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunsetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunsetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sunset',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunsetEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sunset',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunsetGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sunset',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunsetLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sunset',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> sunsetBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sunset',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> tempIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'temp',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> tempIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'temp',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> uviIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uvi',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> uviIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uvi',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> uviEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uvi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> uviGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uvi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> uviLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uvi',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> uviBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uvi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weather',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weather',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'weather',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windDegIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windDeg',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windDegIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windDeg',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windDegEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windDeg',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windDegGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windDeg',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windDegLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windDeg',
        value: value,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windDegBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windDeg',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windGustIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windGust',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windGustIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windGust',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windGustEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windGust',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windGustGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windGust',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windGustLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windGust',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windGustBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windGust',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windSpeedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'windSpeed',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windSpeedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'windSpeed',
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windSpeedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windSpeedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windSpeedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'windSpeed',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> windSpeedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'windSpeed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension DailyQueryObject on QueryBuilder<Daily, Daily, QFilterCondition> {
  QueryBuilder<Daily, Daily, QAfterFilterCondition> feelsLike(
      FilterQuery<FeelsLike> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'feelsLike');
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> temp(FilterQuery<Temp> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'temp');
    });
  }

  QueryBuilder<Daily, Daily, QAfterFilterCondition> weatherElement(
      FilterQuery<WeatherElement> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'weather');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FeelsLikeSchema = Schema(
  name: r'FeelsLike',
  id: 2489632882489458937,
  properties: {
    r'day': PropertySchema(
      id: 0,
      name: r'day',
      type: IsarType.double,
    ),
    r'eve': PropertySchema(
      id: 1,
      name: r'eve',
      type: IsarType.double,
    ),
    r'morn': PropertySchema(
      id: 2,
      name: r'morn',
      type: IsarType.double,
    ),
    r'night': PropertySchema(
      id: 3,
      name: r'night',
      type: IsarType.double,
    )
  },
  estimateSize: _feelsLikeEstimateSize,
  serialize: _feelsLikeSerialize,
  deserialize: _feelsLikeDeserialize,
  deserializeProp: _feelsLikeDeserializeProp,
);

int _feelsLikeEstimateSize(
  FeelsLike object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _feelsLikeSerialize(
  FeelsLike object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.day);
  writer.writeDouble(offsets[1], object.eve);
  writer.writeDouble(offsets[2], object.morn);
  writer.writeDouble(offsets[3], object.night);
}

FeelsLike _feelsLikeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FeelsLike(
    day: reader.readDoubleOrNull(offsets[0]),
    eve: reader.readDoubleOrNull(offsets[1]),
    morn: reader.readDoubleOrNull(offsets[2]),
    night: reader.readDoubleOrNull(offsets[3]),
  );
  return object;
}

P _feelsLikeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension FeelsLikeQueryFilter
    on QueryBuilder<FeelsLike, FeelsLike, QFilterCondition> {
  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> dayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'day',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> dayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'day',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> dayEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> dayGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> dayLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> dayBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> eveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eve',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> eveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eve',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> eveEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eve',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> eveGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eve',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> eveLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eve',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> eveBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eve',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> mornIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'morn',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> mornIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'morn',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> mornEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'morn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> mornGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'morn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> mornLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'morn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> mornBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'morn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> nightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'night',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> nightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'night',
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> nightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'night',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> nightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'night',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> nightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'night',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<FeelsLike, FeelsLike, QAfterFilterCondition> nightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'night',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension FeelsLikeQueryObject
    on QueryBuilder<FeelsLike, FeelsLike, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const TempSchema = Schema(
  name: r'Temp',
  id: -2311761511889327503,
  properties: {
    r'day': PropertySchema(
      id: 0,
      name: r'day',
      type: IsarType.double,
    ),
    r'eve': PropertySchema(
      id: 1,
      name: r'eve',
      type: IsarType.double,
    ),
    r'max': PropertySchema(
      id: 2,
      name: r'max',
      type: IsarType.double,
    ),
    r'min': PropertySchema(
      id: 3,
      name: r'min',
      type: IsarType.double,
    ),
    r'morn': PropertySchema(
      id: 4,
      name: r'morn',
      type: IsarType.double,
    ),
    r'night': PropertySchema(
      id: 5,
      name: r'night',
      type: IsarType.double,
    )
  },
  estimateSize: _tempEstimateSize,
  serialize: _tempSerialize,
  deserialize: _tempDeserialize,
  deserializeProp: _tempDeserializeProp,
);

int _tempEstimateSize(
  Temp object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _tempSerialize(
  Temp object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.day);
  writer.writeDouble(offsets[1], object.eve);
  writer.writeDouble(offsets[2], object.max);
  writer.writeDouble(offsets[3], object.min);
  writer.writeDouble(offsets[4], object.morn);
  writer.writeDouble(offsets[5], object.night);
}

Temp _tempDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Temp(
    day: reader.readDoubleOrNull(offsets[0]),
    eve: reader.readDoubleOrNull(offsets[1]),
    max: reader.readDoubleOrNull(offsets[2]),
    min: reader.readDoubleOrNull(offsets[3]),
    morn: reader.readDoubleOrNull(offsets[4]),
    night: reader.readDoubleOrNull(offsets[5]),
  );
  return object;
}

P _tempDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (reader.readDoubleOrNull(offset)) as P;
    case 5:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension TempQueryFilter on QueryBuilder<Temp, Temp, QFilterCondition> {
  QueryBuilder<Temp, Temp, QAfterFilterCondition> dayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'day',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> dayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'day',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> dayEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'day',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> dayGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'day',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> dayLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'day',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> dayBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> eveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'eve',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> eveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'eve',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> eveEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'eve',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> eveGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'eve',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> eveLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'eve',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> eveBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'eve',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> maxIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'max',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> maxIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'max',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> maxEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'max',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> maxGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'max',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> maxLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'max',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> maxBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'max',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> minIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'min',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> minIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'min',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> minEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'min',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> minGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'min',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> minLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'min',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> minBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'min',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> mornIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'morn',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> mornIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'morn',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> mornEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'morn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> mornGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'morn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> mornLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'morn',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> mornBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'morn',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> nightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'night',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> nightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'night',
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> nightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'night',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> nightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'night',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> nightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'night',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Temp, Temp, QAfterFilterCondition> nightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'night',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension TempQueryObject on QueryBuilder<Temp, Temp, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const MinutelySchema = Schema(
  name: r'Minutely',
  id: 3927483799381671802,
  properties: {
    r'dt': PropertySchema(
      id: 0,
      name: r'dt',
      type: IsarType.long,
    ),
    r'precipitation': PropertySchema(
      id: 1,
      name: r'precipitation',
      type: IsarType.long,
    )
  },
  estimateSize: _minutelyEstimateSize,
  serialize: _minutelySerialize,
  deserialize: _minutelyDeserialize,
  deserializeProp: _minutelyDeserializeProp,
);

int _minutelyEstimateSize(
  Minutely object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _minutelySerialize(
  Minutely object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dt);
  writer.writeLong(offsets[1], object.precipitation);
}

Minutely _minutelyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Minutely(
    dt: reader.readLongOrNull(offsets[0]),
    precipitation: reader.readLongOrNull(offsets[1]),
  );
  return object;
}

P _minutelyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension MinutelyQueryFilter
    on QueryBuilder<Minutely, Minutely, QFilterCondition> {
  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> dtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dt',
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> dtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dt',
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> dtEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> dtGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> dtLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dt',
        value: value,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> dtBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition>
      precipitationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition>
      precipitationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'precipitation',
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> precipitationEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'precipitation',
        value: value,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition>
      precipitationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'precipitation',
        value: value,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> precipitationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'precipitation',
        value: value,
      ));
    });
  }

  QueryBuilder<Minutely, Minutely, QAfterFilterCondition> precipitationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'precipitation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MinutelyQueryObject
    on QueryBuilder<Minutely, Minutely, QFilterCondition> {}
