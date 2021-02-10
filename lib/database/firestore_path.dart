class FirestorePath {
  static String userProfile(String uid) => 'users/$uid';
  static String artistProfile(String vendorId) => 'artist/$vendorId';
  static String artistsProfile() => 'artists';
  // static String productLocation(String vendorId, String productId) =>
  //     'vendors/$vendorId/products/$productId';
  // static String productsLocation(String vendorId) =>
  //     'vendors/$vendorId/products';
  static String categoryList(String vendorId) => 'vendors/$vendorId/categories';
  static String categoryLocation(String vendorId, String categoryId) =>
      'vendors/$vendorId/categories/$categoryId';
  static String taxCode(String vendorId, String taxcodeId) =>
      'vendors/$vendorId/taxCodes/$taxcodeId';
  static String taxCodes(String vendorId) => 'vendors/$vendorId/taxCodes';
  static String orders() => 'orders';
  static String order(String orderId) => 'orders/$orderId';
  static String orderItems(String orderId, String orderItems) =>
      'orders/$orderId/$orderItems';
  static String orderItem(
          String orderId, String orderItem, String productIds) =>
      'orders/$orderId/$orderItem/$productIds';
  static String schedule(String scheduleId, String vendorId) =>
      'vendors/$vendorId/schedules/$scheduleId';
  static String schedules(String vendorId) => 'vendors/$vendorId/schedules/';
}
