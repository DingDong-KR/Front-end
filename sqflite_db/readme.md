.gitignore 파일에 sqflite의 db가 저장되는 폴더가 commit시 무시되도록 작성되어 따로폴더에 db파일만 넣어놓았습니다.

아직 상병목록은 집어넣지 않았습니다.

주어진 6명의 data는 집어 넣었습니다.

환자 데이터에서 치료 방식에서 type의 경우 임의로 작성하였습니다.
(침,부항,약침,뜸,물리요법)
침의 경우 (경혈,이체,MIPS,사암침법) -> 만약 침, 이체 일경우 TYPE은 12 이렇게 입력하였습니다.

WINDOW  기준 MAIN에서 DB생성되는 코드가 작성 되어있다면 
..\.dart_tool\sqflite_common_ffi\databases\  -> 이경로에 DB가 작성됩니다.
DB가 생성되는 코드가 작성되어 DB가 생성되었거나 이미 생성된 DB가 있다면 해당 경로를 터미널에 출력하는 코드도 포함되어있습니다.
다른 OS의 경우 해당 코드를 확인하면 될것 같습니다.