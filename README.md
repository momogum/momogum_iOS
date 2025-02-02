# 머머금 iOS팀 레포지토리 입니다

<br/>

## 📇 GitHub 컨벤션
### 브랜치 컨벤션

`브랜치 이름은 {작업이름}/{작업파트} 의 구조로 작성해주세요. 'ex)FEAT/appoint'`

- 밥일기(메인페이지, 업로드) [post] - 닉시, 도리
- 약속잡기 [appoint]- 쿠트
- 로그인 회원가입, 프로필 [login],[profile] - 세섬, 기쁨


### 포크

`팀 리더가 올린 레포지토리를 각자의 깃헙으로 포크하여 사용해주시기 바랍니다.`

1. 리더 레포지토리 → 각자 리모트 레포지토리 `(Fork)`
2. 각자 리모트 레포지토리 → 로컬 레포지토리 `(Clone)`
3. 각자 코딩 스타일에 따라 브랜치를 파거나 메인에서 코드
4. 로컬로 커밋 → 리모트 레포로 푸시 → 리더 레포로 Pull Request
5. 통합된 리더 레포 → 각자 로컬 레포 `(fetch)`



### 커밋

`최대한 자세히 쪼개주세요!`

```markdown
[Feat] #144 회원가입 View 네비게이션 바 구현

CHORE: 자잘한 코드 및 내부 파일 수정
FEAT: 새로운 기능 및 뷰 추가
FIX: 버그, 오류 수정
REFACTOR: 전면 수정(코드 리펙토링)
```

위 커밋 메시지는 기본적으로 들어가는 요소들을 조합해 만든 예시 커밋 메시지입니다.

- 기능 구현 시 사용하는 `Feature`, 버그 수정 시 사용하는 `Fix`, 자잘한 수정 시 사용하는 `CHORE` 등의 역할을 명시할 수 있어요.
- `#(이슈 번호)` 처럼 커밋 메시지에 이슈 번호를 포함하면 추후 커밋을 `push`했을 때 이슈 아래에 `reference`로 표기됩니다.
- 이후 이 커밋에서는 어떤 내용을 작업했는지 표기해주세요!


### 이슈

`프로젝트에서 해결해야할 모든 사항을 트래킹하기 편하도록 해주는 기능`

- 깃헙에서 생성하는 모든 이슈들은 고유번호를 받고 스레드가 됩니다.
- 팀원이 해당 이슈에 댓글을 달면 알림을 받을 수 있고.
- 고유번호를 사용해서 커밋, PR 시에 트래킹할 수 있습니다.


### Pull Request

`마스터 레포지토리에 Merge 할때는 반드시 Pull Request 를 통해서 merge 해주세요`

- Pull Request 의 본문은 마크다운 언어를 통해 작성합니다


<br/>

## 📋 코딩 컨벤션


  ### 임포트
  
  - 내장 프레임워크를 먼저 적고 한줄 띄워 서드파티 프레임워크 임포트
  - 적는 순서는 알파벳 순으로 정렬
  
  
  ### 탭
  
  - 1탭 = 4 스페이스 (Xcode 설정에서 바꿀수 있습니다)
  - Xcode 코드 에디터에서 코드를 선택하고 `Control + i` 를 누르면 자동 줄 정리를 해줍니다


  ### 네이밍
  
  - 클래스, 구조체, 열거형(enum) → `UpperCamelCase`
  - 함수, 변수, 상수 → `lowerCamelCase`
      - 액션 함수의 경우 `주어 + 동사 + 목적어` 의 형태로 사용 ex) `backButtonDidTap()`
  - 이름속에 들어가는 약어 → 약어로 시작시에는 소문자, 그 외에는 모두 대문자
      
      ```swift
      let userID: Int?
      let websiteURL: URL?
      let urlString: String?
      ```
    

  ### 주석
  
  
  우리가 자주 사용하는 일반 주석 `//` 외에도
  
  동료가 참고하기 편하게 해주는 문서 주석 `///` & `/**  */`
  
  메서드 네비게이션에서 참고할 수 있는 액션 주석 `// MARK:`  등이 있습니다.
  
  
  > **일반 주석**
  > 
  - 우리가 아는 가장 기본적인 주석으로 별도의 기능없이 코드 에디터에서 볼 수 있는 주석입니다.
  
  > **문서 주석**
  > 
  - `///` & `/**  */` 등으로 선언
  - 일반 주석과 달리 함수나 변수 위에 선언하면 해당 키워드의 퀵헬프`(Option + 변수 클릭)`에서 상세설명이 뜨게 됩니다.
    
  > **액션 주석**
  > 
  - `//MARK:`   등으로 선언
  - 다른 주석과 달리 `메소드 네비게이션`과 `코드에디터 미니맵`에서 표시가 됨

<br/>

## 🗂️ Foldering 컨벤션

  ### 디자인 패턴
  
  - MVVM

  ### 폴더 구조
  
  - Model, View, ViewModel 별로 나누고 각자의 기능별로 분류
  - 가능한 재사용 할 수 있도록 고려해서 코딩, 특히 Model
   
  - 대안 1
      - 기능별 폴더
          
          → View 폴더 - View
          
          → ViewModel 폴더 - ViewModel
          
      - Model
      - Common (공통 View)
      - Manager

