import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TreatRecord extends StatelessWidget {
  const TreatRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 506,
      height: 309,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '진료기록',
                                    style: TextStyle(
                                      color: Color(0xFF404855),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w700,
                                      height: 0.11,
                                      letterSpacing: 0.14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 13),
                            Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/icon_document.svg'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '2024-05-20',
                                    style: TextStyle(
                                      color: Color(0xFF404855),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0.14,
                                      letterSpacing: 0.11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '16:20',
                                    style: TextStyle(
                                      color: Color(0xFF404855),
                                      fontSize: 11,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      height: 0.14,
                                      letterSpacing: 0.11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Doc. 이원택',
                        style: TextStyle(
                          color: Color(0xFF404855),
                          fontSize: 11,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 0.14,
                          letterSpacing: 0.11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.only(right: 5),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              child: Text(
                                '본진\nROS(키워드): 열증, 건조,\n주증상: 저녁에 열이 치솟음, 불면\n간호노트: 예민하고 흥분상.\n진료기록\nS)\nc/c\n#1. Hot flush on face\n- Vas 6\n- 조금만 무리하거나 자려고 누우면 치밀어 오름\no/s: 25YA\n- 갱년기 증상과 함께 발현\n#2. 불면\n- 자려고 누우면 정신이 말똥말똥하고 이런저런 생각이 떠올라서 잠을 잘 못잠\n- 낮잠을 자거나 커피를 섭취하지 않아도 똑같음\no/s: 2YA spon.\nP/i: 25YA 갱년기 증상 있을 때는 그냥 참고 살다가 2YA 불면증 증상 생기자 양방병원 내원, 졸피뎀 처방받아 3달 복용했으나 부작용으로 단약 후 참다가 내원.\nO)\n전체적으로 흥분상, 불안초조 두드러짐.\nECG 정상\nEEG 정상\nMMPI Hy, Pt 높음\nBGT 정상\nK-DRS 정상\nA)\nImp. 혈허로 인한 흥분상 및 열감 호소\nDx. 주) U61.0 혈허증 부) G47.0 만성 불면증\nr/o 기혈양허증(ECG 정상 및 HT 정상)\nP)\n가미소요산 15일분, bid, ac\n간 승격, 매일 내원해 경과 지켜보다가 흥분상 진정되면 심 정격으로 전환',
                                style: TextStyle(
                                  color: Color(0xFF404855),
                                  fontSize: 11,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0.14,
                                  letterSpacing: 0.11,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 144),
                  Container(
                    width: 5,
                    height: double.infinity,
                    padding: const EdgeInsets.only(right: 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 4,
                          height: double.infinity,
                          padding: const EdgeInsets.only(bottom: 100),
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF7F7F7),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 4,
                                height: double.infinity,
                                decoration: ShapeDecoration(
                                  color: const Color(0xFFADE9F9),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
