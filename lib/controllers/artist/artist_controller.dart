import 'package:flutter/material.dart';
import 'package:flutter_starter/models/artist/artist_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ArtistController extends GetxController {
  TextEditingController artistNameController;
  TextEditingController artistDescriptionController;
  TextEditingController artistFacebookUrlController;
  TextEditingController artistSpotifyController;
  TextEditingController artistYoutubeController;

  @override
  void onInit() {
    artistNameController = TextEditingController();
    artistDescriptionController = TextEditingController();
    artistFacebookUrlController = TextEditingController();
    artistSpotifyController = TextEditingController();
    artistYoutubeController = TextEditingController(); // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    artistNameController.clear();
    artistDescriptionController.clear();
    artistFacebookUrlController.clear();
    artistSpotifyController.clear();
    artistYoutubeController.clear(); // TODO: implement onClose
    super.onClose();
  }

  List<ArtistModel> artists get => artistlist.value;


  
}
