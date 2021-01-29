import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestorer
import 'package:path/path.dart' as Path;
import 'package:http/http.dart' as http;

class FirebaseStorageService {
  // uploading image
  static Future uploadFile(String uploadedFileURL, File image) async {
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('/Views.Onboarding screen images/${Path.basename(image.path)}}');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
    });
    return uploadedFileURL;
  }

  // uploading a file through web app
  Future uploadAnyFile(String fileFolder, File file,businessName, businessContact,filePath) async {
    try{
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child(fileFolder);
      final metadata =SettableMetadata(
          contentType: businessName,
          customMetadata: {businessContact: filePath});
     UploadTask uploadTask = storageReference.putData(await file.readAsBytes(), metadata);
      print('\n Uploading task Not completed \n');
      return Future.value(uploadTask);;
    }catch(e){
      print(e.toString());
    }
  }

  // downloading a file through web app


  Future downloadAnyFile(String fileFolder,) async {
    try{
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child(fileFolder);
      var uploadedFileURL;
      await storageReference.getDownloadURL().then((fileURL) {
        uploadedFileURL = fileURL;

      });
      print('uploadedFileUrl: $uploadedFileURL');
      final http.Response downloadData = await http.get(uploadedFileURL );
      /* print('downloadData: $downloadData');*/
      final  fileContents = downloadData.headers;
      /* print('download body : $fileContents');*/
      final String name = await storageReference.name;
      final String bucket = await storageReference.bucket;
      final String path = await storageReference.fullPath;
      /*print('name: $name');
     print('bucket: $bucket');
     print('path: ${File(path)}');*/
      return uploadedFileURL;
    }catch(e){
      print(e);
    }
  }
}
