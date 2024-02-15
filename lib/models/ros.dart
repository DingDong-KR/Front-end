class ROSFields {
  static const String chartNumber = 'chartNumber'; 
  static const String getHotEasily  = 'getHotEasily';   
  static const String handFootWarm = 'handFootWarm';
  static const String coldShower = 'coldShower';
  static const String sleepTemperaturePreference = 'sleepTemperaturePreference';
  static const String flushSummer = 'flushSummer';
  static const String flush = 'flush';
  static const String flushCircumstance  = 'flushCircumstance';
}

class ROS {
  static String tableName = 'ROS';

  final int chartNumber;
  final int? getHotEasily;
  final int? handFootWarm;
  final int? coldShower;
  final int? sleepTemperaturePreference;
  final int? flushSummer;
  final int? flush;
  final String? flushCircumstance;


  const ROS({
    required this.chartNumber,
    this.getHotEasily,
    this.handFootWarm,
    this.coldShower,
    this.sleepTemperaturePreference,
    this.flushSummer,
    this.flush,
    this.flushCircumstance,
  });

  Map<String, dynamic> toJson() {
    return {
      ROSFields.chartNumber: chartNumber,
      ROSFields.getHotEasily: getHotEasily,
      ROSFields.handFootWarm: handFootWarm,
      ROSFields.coldShower: coldShower,
      ROSFields.sleepTemperaturePreference: sleepTemperaturePreference,
      ROSFields.flushSummer: flushSummer,
      ROSFields.flush: flush,
      ROSFields.flushCircumstance: flushCircumstance,
    };
  }

  factory ROS.fromJson(Map<String, dynamic> json) {
    return ROS(
      chartNumber: json[ROSFields.chartNumber] as int,
      getHotEasily: json[ROSFields.getHotEasily] as int,
      handFootWarm: json[ROSFields.handFootWarm] as int,
      coldShower: json[ROSFields.coldShower] as int,
      sleepTemperaturePreference: json[ROSFields.sleepTemperaturePreference] as int,
      flushSummer: json[ROSFields.flushSummer] as int,
      flush: json[ROSFields.flush] as int,
      flushCircumstance: json[ROSFields.flushCircumstance] as String,

    );
  }
}