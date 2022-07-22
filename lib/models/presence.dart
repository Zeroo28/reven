import 'dart:convert';

class Presence {
  final int id;
  final String? state;
  final String? details;
  final int? startTimeStamp; // used to show elapsed time.
  final int? endTimeStamp; // used to show how much time is remaining.
  final String? largeImageKey;
  final String? largeImageText;
  final String? smallImageKey;
  final String? smallImageText;

  // won't use currently.
  final String? partyId;
  final int? partySize;
  final int? partySizeMax;
  final String? matchSecret;
  final String? joinSecret;
  final String? spectateSecret;

  Presence({
    required this.id,
    this.state,
    this.details,
    this.startTimeStamp,
    this.endTimeStamp,
    this.largeImageKey,
    this.largeImageText,
    this.smallImageKey,
    this.smallImageText,
    this.partyId,
    this.partySize,
    this.partySizeMax,
    this.matchSecret,
    this.joinSecret,
    this.spectateSecret,
  });

  Map<String, dynamic> toJson() {
    return {
      _PresenceKeys.id: id,
      _PresenceKeys.state: state,
      _PresenceKeys.details: details,
      _PresenceKeys.startTimeStamp: startTimeStamp,
      _PresenceKeys.endTimeStamp: endTimeStamp,
      _PresenceKeys.largeImageKey: largeImageKey,
      _PresenceKeys.largeImageText: largeImageText,
      _PresenceKeys.smallImageKey: smallImageKey,
      _PresenceKeys.smallImageText: smallImageText,
      _PresenceKeys.partyId: partyId,
      _PresenceKeys.partySize: partySize,
      _PresenceKeys.partySizeMax: partySizeMax,
      _PresenceKeys.matchSecret: matchSecret,
      _PresenceKeys.joinSecret: joinSecret,
      _PresenceKeys.spectateSecret: spectateSecret,
    };
  }

  String toJsonString() {
    return const JsonEncoder().convert(toJson());
  }

  factory Presence.fromJson(Map<String, dynamic> json) {
    return Presence(
      id: json[_PresenceKeys.id] as int,
      state: json[_PresenceKeys.state] as String,
      details: json[_PresenceKeys.details] as String,
      startTimeStamp: json[_PresenceKeys.startTimeStamp] as int,
      endTimeStamp: json[_PresenceKeys.endTimeStamp] as int,
      largeImageKey: json[_PresenceKeys.largeImageKey] as String,
      largeImageText: json[_PresenceKeys.largeImageText] as String,
      smallImageKey: json[_PresenceKeys.smallImageKey] as String,
      smallImageText: json[_PresenceKeys.smallImageText] as String,
      partyId: json[_PresenceKeys.partyId] as String,
      partySize: json[_PresenceKeys.partySize] as int,
      partySizeMax: json[_PresenceKeys.partySizeMax] as int,
      matchSecret: json[_PresenceKeys.matchSecret] as String,
      joinSecret: json[_PresenceKeys.joinSecret] as String,
      spectateSecret: json[_PresenceKeys.spectateSecret] as String,
    );
  }
}

class _PresenceKeys {
  static const String id = 'id';
  static const String state = 'state';
  static const String details = 'details';
  static const String largeImageKey = 'largeImageKey';
  static const String largeImageText = 'largeImageText';
  static const String smallImageKey = 'smallImageKey';
  static const String smallImageText = 'smallImageText';
  static const String startTimeStamp = 'startTimeStamp';
  static const String endTimeStamp = 'endTimeStamp';
  static const String partyId = 'partyId';
  static const String partySize = 'partySize';
  static const String partySizeMax = 'partySizeMax';
  static const String matchSecret = 'matchSecret';
  static const String joinSecret = 'joinSecret';
  static const String spectateSecret = 'spectateSecret';
}
