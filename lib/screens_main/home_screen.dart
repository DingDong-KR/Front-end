import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_desktop_app/screens/add_affiliation_screen.dart';
import 'package:path/path.dart';
import '../controller/affiliation_controller.dart';
import 'package:my_desktop_app/models/user.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

import '../widgets/dropdown_button_widget.dart';

class HomeScreen extends StatelessWidget {
  RxString lastSyncTime = RxString('');
  final User user; // 유저 정보를 저장할 변수
  final AffiliationController affiliationController =
      Get.put<AffiliationController>(AffiliationController());

  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE2F1F6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
            ),
            Text(
              '${user.name}님, 안녕하세요.',
              style: TextStyle(
                color: Color(0xFF404855),
                fontSize: 36,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '현재 로그인 되어 있는 채널은',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(width: 10),
                DropdownButtonWidget(user: user),
                SizedBox(width: 10),
                Text(
                  '입니다.',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    receiver(8080);
                    syncronizeToServer(
                        context); // Update lastSyncTime with the synchronization time
                  },
                  child: Container(
                    width: 251,
                    height: 92,
                    decoration: ShapeDecoration(
                      color: Color(0xFF3FA7C3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '현재 채널 동기화',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Dialog(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: AddAffiliationScreen(
                                userId: user.userId,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 251,
                    height: 92,
                    decoration: ShapeDecoration(
                      color: Color(0xFF3FA7C3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '채널 추가하기',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => Text(
                  '최근 동기화 ${lastSyncTime.value}',
                  style: TextStyle(
                    color: Color(0xFF404855),
                    fontSize: 13,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void syncronizeToServer(BuildContext context) {
    // Perform synchronization
    bool syncResult = true; // Replace with the actual synchronization result
    String synchronizationTime = '';
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Wait for 2 seconds before closing the dialog
        Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        );
      },
    );
    if (syncResult) {
      // Save the current time as the synchronization time
      DateTime now = DateTime.now();
      synchronizationTime =
          '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}';
      // Update the UI with the new synchronization time
      lastSyncTime.value = synchronizationTime;
      // Stop the sync animation
    } else {
      // Stop the sync animation
    }
  }
}

Future<void> receiver(int port) async {
  // 서버 소켓 생성

  var serverSocket = await ServerSocket.bind(InternetAddress.anyIPv4, port);
  print('서버가 ${serverSocket.address.address}:${serverSocket.port}에서 실행 중입니다.');

  await for (var client in serverSocket) {
    print(
        '클라이언트가 연결되었습니다: ${client.remoteAddress.address}:${client.remotePort}');

    // 파일 데이터를 저장할 파일 스트림 생성
    var path = await getDocumentsDirectoryPath();
    var file = File('$path/chart_tmp.db').openWrite();
    print("$path/chart_tmp.db");
    // 클라이언트로부터 데이터 수신
    client.listen((data) {
      print('데이터 수신 중...');
      // 파일에 데이터 쓰기
      file.add(data);
      print('클라이언트로부터 메시지를 받았습니다:');
      client.write('메시지를 받았습니다. 감사링: ');
    }, onDone: () async {
      // await fileReplacer('asset/db/chart.db', "asset/db/chart_tmp");
      await file.close();
      print('파일 전송 완료 및 저장 완료');
      client.close();
    }, onError: (error) {
      print('데이터 수신 중 오류 발생: $error');
      client.close();
    });
  }
}

Future<void> fileReplacer(String originalFile, String newFile) async {
  // 오리지널 파일의 File 객체 생성
  var original = File(originalFile);

  // 새 파일의 File 객체 생성
  var replacement = File(newFile);

  // 오리지널 파일이 존재하는지 확인
  if (await original.exists()) {
    // 오리지널 파일 삭제
    await original.delete();
    print('Original file deleted.');
  } else {
    print('Original file does not exist.');
  }

  // 새 파일의 이름을 오리지널 파일의 이름으로 변경
  await replacement.rename(originalFile);
  print('New file renamed to original file name.');
}

Future<String> getDocumentsDirectoryPath() async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}
