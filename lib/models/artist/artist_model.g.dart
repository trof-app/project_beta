// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) {
  return ArtistModel(
    json['id'] as String ?? '',
    json['name'] as String ?? '',
    json['description'] as String ?? '',
    (json['genres'] as List)?.map((e) => e as String)?.toList() ?? [],
    json['stage'] as String ?? '',
    json['setFinishTime'] as String ?? '',
    json['setStartTime'] as String ?? '',
    (json['photoUrls'] as List)?.map((e) => e as String)?.toList() ?? [],
    json['setLegnth'] as String ?? '',
  )
    ..facebookUrl = json['facebookUrl'] as String ?? ''
    ..twitterUrl = json['twitterUrl'] as String ?? ''
    ..itunesUrl = json['itunesUrl'] as String ?? ''
    ..spotifyUrl = json['spotifyUrl'] as String ?? ''
    ..youtubeUrl = json['youtubeUrl'] as String ?? '';
}

Map<String, dynamic> _$ArtistModelToJson(ArtistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'genres': instance.genres,
      'stage': instance.stage,
      'setStartTime': instance.setStartTime,
      'setFinishTime': instance.setFinishTime,
      'setLegnth': instance.setLegnth,
      'facebookUrl': instance.facebookUrl,
      'twitterUrl': instance.twitterUrl,
      'itunesUrl': instance.itunesUrl,
      'spotifyUrl': instance.spotifyUrl,
      'youtubeUrl': instance.youtubeUrl,
      'photoUrls': instance.photoUrls,
    };
