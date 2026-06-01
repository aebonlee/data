# 데이터 분석 실습 & 시각화 (Data Lab)

> 2026 KERIS 교육과정(안) · 공통직무 · **데이터 분석 실습 & 시각화** 강의용 학습 사이트
> 엑셀 기반 EDA·시각화·대시보드 구축 실습으로 데이터 기반 의사결정 역량을 키우는 **1일 6시간 중급 과정**.

배포: https://data.dreamitbiz.com

## 과정 개요

| 구분 | 내용 |
|------|------|
| 과정명 | 데이터 분석 실습 & 시각화 |
| 시간/레벨 | 1일 6시간 · 중급 |
| 핵심 키워드 | 데이터 분석 · 엑셀 전처리 · EDA · 시각화 · 대시보드 |
| 도구 | Microsoft Excel (피벗·조건부 서식·슬라이서) |
| 교육 목표 | 데이터 분석·시각화 핵심 원리 이해 → 데이터 기반 의사결정 역량 강화 / 엑셀 기반 EDA·시각화·대시보드 실습으로 실무 역량 내재화 |

### 모듈 구성 (각 2.0H)

1. **모듈 1 · 탐색적 데이터분석(EDA)** — 가설 수립, 지표 쪼개기(Drill-down), 시계열·상관·교차분석, 분포 확인
2. **모듈 2 · 시각화의 원리 및 기획** — 메시지/타겟 정의, 차트 선택, Data-Ink Ratio, 정보 왜곡 회피, 윤리적 표현
3. **모듈 3 · 실무형 대시보드 구축** — 조건부 서식·스파크라인, KPI 대시보드 설계, 피벗 차트·슬라이서 연동, 자동 갱신 리포트

## 기술 스택

- React 19 + TypeScript + Vite 7
- React Router 7 (SPA)
- Supabase (인증) — Google · Kakao OAuth + 이메일
- react-markdown (강의안 콘텐츠 렌더링)
- 디자인: dasco/kdn 템플릿 디자인 시스템 (다크 블루 navy 기본 + 5색 테마)

## 빠른 시작

```bash
# 1. 의존성 설치
npm install

# 2. 환경변수 설정
cp .env.example .env
# .env 에 VITE_SUPABASE_URL / VITE_SUPABASE_ANON_KEY 입력

# 3. 개발 서버
npm run dev

# 4. 빌드 / OG 이미지 생성 / 배포
npm run build      # tsc + vite build
npm run og         # public/og-image.png 재생성 (sharp)
npm run deploy     # gh-pages 브랜치로 배포
```

## 환경 변수 (`VITE_` 접두사)

| 변수 | 설명 |
|------|------|
| `VITE_SUPABASE_URL` | Supabase 프로젝트 URL |
| `VITE_SUPABASE_ANON_KEY` | Supabase anon 공개 키 (클라이언트용) |
| `VITE_SITE_URL` | 배포 도메인 |

> `.env` 는 `.gitignore` 에 포함되어 저장소에 올라가지 않습니다.
> Supabase **service-role / Personal Access Token(`sbp_...`)** 은 클라이언트 코드에 절대 넣지 않습니다 (관리/CLI 전용).

## 로그인 (Google · Kakao)

OAuth 로그인 코드는 `src/utils/auth.ts` 에 배선되어 있습니다 (`signInWithGoogle`, `signInWithKakao`).
실제 동작하려면 **Supabase 대시보드 → Authentication → Providers** 에서 Google·Kakao Provider를
활성화하고 Client ID/Secret 과 Redirect URL(`https://data.dreamitbiz.com`)을 등록해야 합니다.

## 테마 컬러

기본 **다크 블루(navy, `#1B2A4A`)** 에 더해 5가지 컬러 테마를 지원합니다 (`src/config/site.ts` 의 `colors`):
`blue`(기본) · `red` · `green` · `purple` · `orange`. 테마 전환은 `html[data-color]` 속성으로 동작합니다.

## 디렉터리 (핵심)

```
src/
  config/site.ts        # 사이트 메타·메뉴·컬러·DB 접두사(data_)
  pages/
    Home.tsx            # 랜딩 (모듈/타임라인/도구/원칙)
    Curriculum.tsx      # KERIS 3모듈 세부 커리큘럼
    Lecture.tsx         # 강의안 허브
    Module1/2/3.tsx     # 모듈별 강의안 (GuidePage 기반 마크다운)
    About/Company/Instructor/RecommendedSites
  components/GuidePage.tsx  # 마크다운 강의안 렌더러
  contexts/                 # Auth/Theme/Language/Toast
  styles/                   # 디자인 시스템 CSS
scripts/generate-og.cjs     # OG 이미지 생성 (sharp)
```

---
운영: 드림아이티비즈(DreamIT Biz) · DreamIT Biz Group
