import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BedWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  const BedWidget({Key? key, this.color, this.padding, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: color ?? Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(15.0, 15, 20, 0),
          child: child,
        ),
        SizedBox(
          height: 10,
        ),
        ..._treatmentItems()
      ]),
    );
  }

  List<Widget> _treatmentItems() {
    return [
      _buildTreatmentItem('침치료'),
      _buildTreatmentItem('부항'),
      _buildTreatmentItem('약침'),
      _buildTreatmentItem('뜸'),
      _buildTreatmentItem('물리'),
    ];
  }

  Widget _buildTreatmentItem(String text) {
    return Padding(
      padding: padding ?? const EdgeInsets.fromLTRB(15.0, 7, 0, 0),
      child: Container(
        width: 72,
        height: 21,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.50),
          border: Border.all(width: 1, color: const Color(0xFF67AB99)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF67AB99),
                  fontSize: 12,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  height: 0.12,
                ),
              ),
              const Spacer(),
              SvgPicture.asset('assets/icons/icon_green_light.svg'),
            ],
          ),
        ),
      ),
    );
  }
}
