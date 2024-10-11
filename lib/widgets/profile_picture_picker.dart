import "dart:io";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:provider/provider.dart";
import "package:rental/Provider/UserProvider.dart";

class ProfilePicturePicker extends StatefulWidget {
  String? defaultPic;
  ProfilePicturePicker({this.defaultPic});
  @override
  State<StatefulWidget> createState() {
    return ProfilePicturePickerState();
  }
}

class ProfilePicturePickerState extends State<ProfilePicturePicker>{
  XFile? image = null;
  String? imagePath;
  Future pickImage(ImageSource imsrc,BuildContext ctx) async{

    try {
      final selectedImage = await ImagePicker().pickImage(
          source: imsrc);
      if (selectedImage == null) return;      
      if(ctx.mounted){
        ctx.read<UserProvider>().selectedImage = selectedImage;
      }
      setState(() {
        this.image = selectedImage;
      });

    }catch(e){
      print("Failed to pick image ${e.toString()}");
    }
    Navigator.pop(ctx);
  }

  Widget build(BuildContext context){
    imagePath = (widget.defaultPic != null && widget.defaultPic!.isNotEmpty)?widget.defaultPic:null;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Stack(children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(100),
              child:
          Container(
             width: 200,
              height: 200,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
              child: image!= null? !kIsWeb? Image.file(
                  width: 200,height: 200,
                  fit: BoxFit.cover,
                  File(image!.path)
              ): Image.network(image!.path) : imagePath==null? const Icon(Icons.person,size:200): Image.network(imagePath!)
          )),
          Container(
            width: 200,
            height: 200,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
            ),
            child:
            Container(
              alignment: Alignment.center,
                width: 50,
                height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue
              ),
                child: IconButton(
                  icon: const Icon(Icons.photo_camera,size: 35,color: Colors.white,), onPressed: () {
                    showDialog(context: context,
                        builder: (_)=>AlertDialog(
                          elevation: 24.0,
                          title: Text("Select an image"),
                          content: Text("Select an image from?"),
                          actions: [
                            TextButton(onPressed: (){
                              pickImage(ImageSource.camera,context);
                            }, child: Text("Camera")),
                            TextButton(onPressed: (){
                              pickImage(ImageSource.gallery,context);
                            }, child: Text("Gallery")),
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child: Text("Cancel"))
                          ],
                        ),
                      barrierDismissible: true
                    );
                },
                ),
            ),
          )
        ])
      ]
    );
  }
}