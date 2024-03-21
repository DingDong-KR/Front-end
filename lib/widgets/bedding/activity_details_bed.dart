import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_desktop_app/models/bed_model.dart';
import 'package:my_desktop_app/styles/textStyles.dart';

import 'bed_widget.dart';

class ActivityDetailsBed extends StatelessWidget {
  const ActivityDetailsBed({super.key});

  @override
  Widget build(BuildContext context) {
    final bedDetails = BedDetails();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0,6,10,0),
      child: GridView.builder(
        itemCount: bedDetails.bedData.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemBuilder: (context, index) => BedWidget(
          child: Container(
            child: Row(
                  children: [
                    Text(
                      "베드 ${index+1}",
                      style: TextStyles.text14W700style,
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/icon_person.svg'),
                    Text(
                      "${bedDetails.bedData[index].name} (${bedDetails.bedData[index].sex}/${bedDetails.bedData[index].age.toString()})",
                      style: TextStyles.text12Style,
                    ),
                  ],
                ),
          )
        ),

      ),
    );
  }
}
