import 'package:get_it/get_it.dart';
import 'package:servicecom/Models/firebaseAuth.dart';
import 'package:servicecom/Models/firebaseStorage.dart';
import 'package:servicecom/Models/firestore.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => FireStoreService());
  locator.registerFactory(() => FirebaseService());
  locator.registerFactory(() => FirebaseStorageService());


}