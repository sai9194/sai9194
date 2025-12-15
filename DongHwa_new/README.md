# donghwa_flutter

FMX(uDongHwa) 마이그레이션용 Flutter 스타터.
- 상단 TabBar = 대분류(탭)
- 탭 안 Grid 메뉴 버튼 = 화면 진입
- `입고 조회(pur_in)`만 실제 동작 (Delphi API 연동)
- 나머지는 Placeholder

## 실행
```bash
flutter pub get
flutter run
```

## 메뉴 수정
`lib/app_shell.dart`의 `_tabs`에서 탭/메뉴 추가/수정.
