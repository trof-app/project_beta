import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/models/artist/artist_model.dart';

import 'package:meta/meta.dart';
import 'package:flutter_starter/models/models.dart';
import 'firestore_path.dart';
import 'firestore_service.dart';

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase {
  final _firestoreService = FirestoreService.instance;

  //Method to create/update user.

  // Future<void> setUser(UserModel trofUser, User user) async =>
  //     _firestoreService.setData(
  //         path: FirestorePath.userProfile(user.uid), data: trofUser.toJson());

  // Future<void> updateUser(UserModel trofUser, User user) async =>
  //     _firestoreService.setData(
  //         path: FirestorePath.userProfile(user.uid), data: trofUser.toJson());

  //Method to retrieve trof user

  // Stream<UserModel> userStream({@required String uid}) =>
  //     _firestoreService.documentStream(
  //         path: FirestorePath.userProfile(uid),
  //         builder: (data, documentId) => UserModel.fromJson(data));

  Stream<ArtistModel> artistStream({@required String artistId}) =>
      _firestoreService.documentStream(
          path: FirestorePath.artistProfile(artistId),
          builder: (data, documentId) => ArtistModel.fromJson(data));

  // Future<UserModel> getUser({@required String uid}) {
  //   return _firestoreService.getData(path: FirestorePath.userProfile(uid));
  // }
  //Method to Create New Artist

  Future<void> setArtist(ArtistModel artistData, String artistId) async =>
      _firestoreService.setData(
          path: FirestorePath.artistProfile(artistId),
          data: artistData.toJson());

//Method to Create New Order

  // Future<void> setOrder(OrderModel orderData, String orderId) async =>
  //     _firestoreService.setData(
  //         path: FirestorePath.order(orderId), data: orderData.toJson());

  // Future<void> setOrderProducts(Product orderProducts, String orderId,
  //         String productId, String orderItems) async =>
  //     _firestoreService.setData(
  //         path: FirestorePath.orderItem(orderId, orderItems, productId),
  //         data: orderProducts.toJson());

  //Method to create/update Categories.

  // Future<void> setCategory(ProductCategory category, String artistId) async {
  //   var result = _firestoreService.setData(
  //       path: FirestorePath.categoryLocation(artistId, category.id),
  //       data: category.toJson());
  //   return result;
  // }

  // //Method to delete Category
  // Future<void> deleteCategory(ProductCategory category, String artistId) async {
  //   _firestoreService.deleteData(
  //       path: FirestorePath.categoryLocation(artistId, category.id));
  // }
  // //Method to create/update Products.

  // Future<void> setProduct(Product product, String artistId) async {
  //   var result = _firestoreService.setData(
  //       path: FirestorePath.productLocation(artistId, product.id),
  //       data: product.toJson());
  //   return result;
  // }

  // //Method to delete prodct
  // Future<void> deleteProduct(Product product, String artistId) async {
  //   _firestoreService.deleteData(
  //       path: FirestorePath.productLocation(artistId, product.id));
  // }

  // //Get all Tax Codes.

  // Future<TaxCode> getTaxCodes({@required String artistId}) {
  //   return _firestoreService.getData(path: FirestorePath.taxCodes(artistId));
  // }
  // //Get single Tax Code

  // Future<dynamic> getTaxCode({@required String artistId, String taxCodeId}) {
  //   return _firestoreService.getData(
  //       path: FirestorePath.taxCode(artistId, taxCodeId));
  // }

  // Future<dynamic> getArtist({@required String artistId}) {
  //   return _firestoreService.getData(
  //       path: FirestorePath.artistProfile(artistId));
  // }

  // Future<dynamic> getOrder({@required String orderId}) {
  //   return _firestoreService.getData(path: FirestorePath.order(orderId));
  // }

  // Future<List<Product>> getOrderProducts(
  //         String orderId, String orderItems) async =>
  //     _firestoreService.collectionGet(
  //         path: FirestorePath.orderItems(orderId, orderItems),
  //         builder: (data, documentId) => Product.fromJson(data));

  // // Set individual Tax Code.

  // Future<void> setTaxCode(TaxCode taxCode, String artistId) async {
  //   var result = _firestoreService.setData(
  //       path: FirestorePath.taxCode(artistId, taxCode.id),
  //       data: taxCode.toJson());
  //   return result;
  // }
  // // Set individual Tax Code.

  // Future<void> setSchedule(ScheduleModel schedule, String artistId) async {
  //   var result = _firestoreService.setData(
  //       path: FirestorePath.schedule(schedule.id, artistId),
  //       data: schedule.toJson());
  //   return result;
  // }

  // //Method to delete TaxCode
  // Future<void> deleteTaxCode(TaxCode taxCode, String artistId) async {
  //   _firestoreService.deleteData(
  //       path: FirestorePath.taxCode(artistId, taxCode.id));
  // }

  // //Method to receive stream of Categories.
  // Stream<List<ProductCategory>> categoriesStream({@required String artistId}) {
  //   print('fetching categories');
  //   var result = _firestoreService.collectionStream(
  //       path: FirestorePath.categoryList(artistId),
  //       builder: (data, documentId) => ProductCategory.fromJson(data));
  //   return result;
  // }

  // //Method to receive stream of tax Codes
  // Stream<List<TaxCode>> taxcodesStream({@required String artistId}) {
  //   print('fetching TaxCodes');

  //   var result = _firestoreService.collectionStream(
  //       path: FirestorePath.taxCodes(artistId),
  //       builder: (data, documentId) => TaxCode.fromJson(data));
  //   return result;
  // }

  // //Method to receive stream of schedules
  // Stream<List<ScheduleModel>> schedulesStream({@required String artistId}) {
  //   print('fetching Schedules');

  //   var result = _firestoreService.collectionStream(
  //       path: FirestorePath.schedules(artistId),
  //       builder: (data, documentId) => ScheduleModel.fromJson(data));
  //   return result;
  // }

  // //Method to receive stream of Products.
  // Stream<List<Product>> productsStream(
  //     {@required String artistId,
  //     @required String filterKey,
  //     String filterValue}) {
  //   print('fetching products filtered by category');
  //   var result = _firestoreService.collectionFilteredStream(
  //       filterKey: filterKey,
  //       filterValue: filterValue,
  //       path: FirestorePath.productsLocation(artistId),
  //       builder: (data, documentId) => Product.fromJson(data));
  //   return result;
  // }

  // Stream<List<Product>> allProductsStream({
  //   @required String artistId,
  // }) {
  //   print('fetching all products');
  //   var result = _firestoreService.collectionStream(
  //       path: FirestorePath.productsLocation(artistId),
  //       builder: (data, documentId) => Product.fromJson(data));
  //   return result;
  // }

  Stream<List<ArtistModel>> artistsStream(
      {@required String filterKey, String filterValue}) {
    print('fetching artists filtered by artist');
    var result = _firestoreService.collectionFilteredArrayStream(
        filterKey: filterKey,
        filterValue: filterValue,
        path: FirestorePath.artistsProfile(),
        builder: (data, documentId) => ArtistModel.fromJson(data));

    return result;
  }

//   Stream<List<OrderModel>> ordersStream(
//       {@required String filterKey, String filterValue}) {
//     print('fetching orders filtered by artist');
//     var result = _firestoreService.collectionFilteredStream(
//         filterKey: filterKey,
//         filterValue: filterValue,
//         path: FirestorePath.orders(),
//         builder: (data, documentId) => OrderModel.fromJson(data));

//     return result;
//   }
}
