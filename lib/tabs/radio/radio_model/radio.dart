import 'package:collection/collection.dart';

class Radios {
  final int? id;
  final String? name;
  final String? url;
  final String? recentDate;

  const Radios({this.id, this.name, this.url, this.recentDate});

  factory Radios.fromJson(Map<String, dynamic> json) => Radios(
        id: json['id'] as int?,
        name: json['name'] as String?,
        url: json['url'] as String?,
        recentDate: json['recent_date'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'url': url,
        'recent_date': recentDate,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Radios) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ url.hashCode ^ recentDate.hashCode;
}
