import 'package:json_annotation/json_annotation.dart';

part 'artist_model.g.dart';

@JsonSerializable()
class ArtistModel {
  @JsonKey(defaultValue: '')
  String id;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String description;
  @JsonKey(defaultValue: [])
  List<String> genres;
  @JsonKey(defaultValue: '')
  String stage;
  @JsonKey(defaultValue: '')
  String setStartTime;
  @JsonKey(defaultValue: '')
  String setFinishTime;
  @JsonKey(defaultValue: '')
  String setLegnth;
  @JsonKey(defaultValue: '')
  String facebookUrl;
  @JsonKey(defaultValue: '')
  String twitterUrl;
  @JsonKey(defaultValue: '')
  String itunesUrl;
  @JsonKey(defaultValue: '')
  String spotifyUrl;
  @JsonKey(defaultValue: '')
  String youtubeUrl;
  @JsonKey(defaultValue: [])
  List<String> photoUrls;

  ArtistModel(this.id, this.name, this.description, this.genres, this.stage,
      this.setFinishTime, this.setStartTime, this.photoUrls, this.setLegnth);

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistModelToJson(this);
}
