# 🍎 Apple Market - 당근마켓 스타일 중고거래 앱

## 📌 프로젝트 개요

Apple Market은 Flutter로 개발된 당근마켓 스타일의 중고거래 앱입니다. MVVM 패턴과 Riverpod 상태관리를 적용하여 구현되었으며, CSV 데이터를 활용한 상품 목록 표시와 상세 정보 확인 기능을 제공합니다.

## 📱 주요 기능

- 상품 목록 표시 (ListView.builder 사용)
- 상품 상세 정보 화면
- 좋아요 기능 (메인-상세 화면 간 상태 동기화)
- 상품 삭제 (롱 클릭)
- 스크롤 상단 이동 FloatingActionButton
- 가격 천 단위 콤마 포맷팅
- 상품 이미지 뷰어 (핀치 줌, 스와이프 닫기, 더블탭 확대 기능)

## 🏗️ 아키텍처

```
lib/
├── app/                     # 앱 설정 및 전역 구성
│   ├── constants/           # 색상, 스타일, 상수 정의
│   ├── data_providers.dart  # Riverpod 프로바이더 설정
│   └── theme.dart           # 앱 테마 설정
├── core/                    # 핵심 유틸리티 및 예외 처리
│   ├── exceptions/          # 커스텀 예외 클래스
│   └── utils/               # 헬퍼 함수들
├── data/                    # 데이터 계층
│   ├── dto/                 # 데이터 전송 객체
│   ├── data_source/         # CSV 데이터 소스
│   └── repository/          # 데이터 접근 계층
├── domain/                  # 도메인 계층
│   └── entity/              # 비즈니스 모델
├── presentation/            # UI 계층
│   └── pages/               # 화면별 구성
└── main.dart                # 앱 진입점
```

## 📦 주요 의존성

```yaml
dependencies:
  flutter_riverpod: ^2.4.9    # 상태 관리
  easy_image_viewer: ^1.5.1   # 이미지 뷰어
  intl: ^0.19.0               # 숫자 포맷팅
```

## 🚀 실행 방법

1. **저장소 클론**
   ```bash
   git clone [repository-url]
   cd apple_market
   ```

2. **의존성 설치**
   ```bash
   flutter pub get
   ```

3. **앱 실행**
   ```bash
   flutter run
   ```

## 🎯 구현 특징

- MVVM 패턴으로 UI와 비즈니스 로직 분리
- Riverpod을 사용한 상태 관리
- CSV 데이터 파싱으로 상품 정보 로드
- 에러 핸들링: 예외 상황별 적절한 사용자 피드백
