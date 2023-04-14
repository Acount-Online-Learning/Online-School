import 'package:flutter/material.dart';

import '../../model/children_model.dart';
import '../../shared/cubit/cubit.dart';


TextEditingController childName = TextEditingController();
TextEditingController childImage = TextEditingController();

Widget buildFallBackList() => Center(
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.add_to_photos,
          size: 300,
          color: Colors.indigo,
        ),
        Text(
          'Add Children',
          style: TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.bold,
              fontSize: 40),
        )
      ],
    ),
  ),
);

Widget buildChildList(EducationCubit cubit, BuildContext context) {
  return Container(
    color: Colors.grey[300],
    child: GridView.count(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,

      childAspectRatio: 1 / 1.4,
      children: List.generate(
        cubit.childList.length,
            (index) => buildChildItem(cubit.childList[index],context),
      ),
    ),
  );
}

Future<dynamic> buildShowDialog(BuildContext context, EducationCubit cubit) {
  return showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: AlertDialog(

        title: const Text('Add your child'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: childName,
              decoration: const InputDecoration(
                label: Text('Enter your name'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  color: Colors.blue,
                  onPressed: (){
                    cubit.pickImage();
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.photo,color: Colors.white,),
                      Text('Gallery',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.blue,
                  onPressed: (){},
                  child: Row(
                    children: const [
                      Icon(Icons.camera_alt,color: Colors.white,),
                      Text('Camera',style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ],
            ),
            //cubit.imagef==null? Container() : Image(image:FileImage(cubit.imagef!)),
            // CircleAvatar(
            //   backgroundImage: EducationCubit.get(context).image==null? null:FileImage(EducationCubit.get(context).image!),
            //   radius: 70,
            // ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              EducationCubit.get(context).addChild(childName.text,EducationCubit.get(context).image!);
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
          ),
          const SizedBox(width: 150,),
          IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.exit_to_app,color: Colors.red,)
          ),
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

Widget buildChildItem(ChildModel model,context) => Padding(
  padding: const EdgeInsets.all(8.0),
  child: Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Center(
          child: EducationCubit.get(context).image==null? const Image(
            image:AssetImage('assets/images/osama.jpg'),
            height: 200,
          ):Image(image: FileImage(model.myImage),height: 200,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                model.childName,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Row(
              children: const [
                Text(
                  '1250',
                  style: TextStyle(color: Colors.black45),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(Icons.android_sharp, color: Colors.black45)
              ],
            ),
          ],
        ),
      ],
    ),
  ),
);