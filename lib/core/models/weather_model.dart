
class WeatherModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  dynamic utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  WeatherModel({this.latitude, this.longitude, this.generationtimeMs, this.utcOffsetSeconds, this.timezone, this.timezoneAbbreviation, this.elevation, this.currentUnits, this.current, this.hourlyUnits, this.hourly, this.dailyUnits, this.daily});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json["latitude"];
    longitude = json["longitude"];
    generationtimeMs = json["generationtime_ms"];
    utcOffsetSeconds = json["utc_offset_seconds"];
    timezone = json["timezone"];
    timezoneAbbreviation = json["timezone_abbreviation"];
    elevation = json["elevation"];
    currentUnits = json["current_units"] == null ? null : CurrentUnits.fromJson(json["current_units"]);
    current = json["current"] == null ? null : Current.fromJson(json["current"]);
    hourlyUnits = json["hourly_units"] == null ? null : HourlyUnits.fromJson(json["hourly_units"]);
    hourly = json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]);
    dailyUnits = json["daily_units"] == null ? null : DailyUnits.fromJson(json["daily_units"]);
    daily = json["daily"] == null ? null : Daily.fromJson(json["daily"]);
  }

  static List<WeatherModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => WeatherModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["generationtime_ms"] = generationtimeMs;
    _data["utc_offset_seconds"] = utcOffsetSeconds;
    _data["timezone"] = timezone;
    _data["timezone_abbreviation"] = timezoneAbbreviation;
    _data["elevation"] = elevation;
    if(currentUnits != null) {
      _data["current_units"] = currentUnits?.toJson();
    }
    if(current != null) {
      _data["current"] = current?.toJson();
    }
    if(hourlyUnits != null) {
      _data["hourly_units"] = hourlyUnits?.toJson();
    }
    if(hourly != null) {
      _data["hourly"] = hourly?.toJson();
    }
    if(dailyUnits != null) {
      _data["daily_units"] = dailyUnits?.toJson();
    }
    if(daily != null) {
      _data["daily"] = daily?.toJson();
    }
    return _data;
  }
}

class Daily {
  List<String>? time;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;

  Daily({this.time, this.temperature2MMax, this.temperature2MMin});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json["time"] == null ? null : List<String>.from(json["time"]);
    temperature2MMax = json["temperature_2m_max"] == null ? null : List<double>.from(json["temperature_2m_max"]);
    temperature2MMin = json["temperature_2m_min"] == null ? null : List<double>.from(json["temperature_2m_min"]);
  }

  static List<Daily> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Daily.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(time != null) {
      _data["time"] = time;
    }
    if(temperature2MMax != null) {
      _data["temperature_2m_max"] = temperature2MMax;
    }
    if(temperature2MMin != null) {
      _data["temperature_2m_min"] = temperature2MMin;
    }
    return _data;
  }
}

class DailyUnits {
  String? time;
  String? temperature2MMax;
  String? temperature2MMin;

  DailyUnits({this.time, this.temperature2MMax, this.temperature2MMin});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    temperature2MMax = json["temperature_2m_max"];
    temperature2MMin = json["temperature_2m_min"];
  }

  static List<DailyUnits> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => DailyUnits.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["time"] = time;
    _data["temperature_2m_max"] = temperature2MMax;
    _data["temperature_2m_min"] = temperature2MMin;
    return _data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2M;
  List<double>? rain;
  List<int>? cloudCover;

  Hourly({this.time, this.temperature2M, this.rain, this.cloudCover});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json["time"] == null ? null : List<String>.from(json["time"]);
    temperature2M = json["temperature_2m"] == null ? null : List<double>.from(json["temperature_2m"]);
    rain = json["rain"] == null ? null : List<double>.from(json["rain"]);
    cloudCover = json["cloud_cover"] == null ? null : List<int>.from(json["cloud_cover"]);
  }

  static List<Hourly> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Hourly.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(time != null) {
      _data["time"] = time;
    }
    if(temperature2M != null) {
      _data["temperature_2m"] = temperature2M;
    }
    if(rain != null) {
      _data["rain"] = rain;
    }
    if(cloudCover != null) {
      _data["cloud_cover"] = cloudCover;
    }
    return _data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2M;
  String? rain;
  String? cloudCover;

  HourlyUnits({this.time, this.temperature2M, this.rain, this.cloudCover});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    temperature2M = json["temperature_2m"];
    rain = json["rain"];
    cloudCover = json["cloud_cover"];
  }

  static List<HourlyUnits> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => HourlyUnits.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["time"] = time;
    _data["temperature_2m"] = temperature2M;
    _data["rain"] = rain;
    _data["cloud_cover"] = cloudCover;
    return _data;
  }
}

class Current {
  String? time;
  int? interval;
  double? temperature2M;
  dynamic rain;
  double? snowfall;
  int? cloudCover;
  double? windSpeed10M;

  Current({this.time, this.interval, this.temperature2M, this.rain, this.snowfall, this.cloudCover, this.windSpeed10M});

  Current.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    interval = json["interval"];
    temperature2M = json["temperature_2m"];
    rain = json["rain"];
    snowfall = json["snowfall"];
    cloudCover = json["cloud_cover"];
    windSpeed10M = json["wind_speed_10m"];
  }

  static List<Current> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Current.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["time"] = time;
    _data["interval"] = interval;
    _data["temperature_2m"] = temperature2M;
    _data["rain"] = rain;
    _data["snowfall"] = snowfall;
    _data["cloud_cover"] = cloudCover;
    _data["wind_speed_10m"] = windSpeed10M;
    return _data;
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2M;
  String? rain;
  String? snowfall;
  String? cloudCover;
  String? windSpeed10M;

  CurrentUnits({this.time, this.interval, this.temperature2M, this.rain, this.snowfall, this.cloudCover, this.windSpeed10M});

  CurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json["time"];
    interval = json["interval"];
    temperature2M = json["temperature_2m"];
    rain = json["rain"];
    snowfall = json["snowfall"];
    cloudCover = json["cloud_cover"];
    windSpeed10M = json["wind_speed_10m"];
  }

  static List<CurrentUnits> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CurrentUnits.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["time"] = time;
    _data["interval"] = interval;
    _data["temperature_2m"] = temperature2M;
    _data["rain"] = rain;
    _data["snowfall"] = snowfall;
    _data["cloud_cover"] = cloudCover;
    _data["wind_speed_10m"] = windSpeed10M;
    return _data;
  }
}