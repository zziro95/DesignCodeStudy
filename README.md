# DesignCodeStudy
디자인 코드 강의 보면서 실습, 메모하듯 기록, 모르는 개념 정리

## 목표
우선은 designcode.io의 Swift 강의를 듣고 정리하고 싶고
일단 Part1까지는 Readme에 정리 후 Part2를 시작할때는 각 코스마다 md파일을 따로 만들어 Readme 에 목록을 만들어 링크 타서 들어갈 수 있게 하기!

### Part 1
**1 - Learn SwiftUI for iOS 13**    
- SwiftUI는 어떤 녀석인가? 전체적인 설명
- `@State & Animation` 상태만 정해준다면 SwiftUI가 두 상태 사이의 전환을 알아낼 것이다.
- `Stack` 에는  H, V, Z Stack이 있고, `spacing`, `alignment`를 이용하여 원하는 정렬로 배치할 수 있다.
- SwiftUI의 장점 iOS, macOS, watchOS, tvOS 모두에서 작동하기 때문에 같은 컴포넌트(구성요소)를 재사용할 수 있고, 코드 수정 또한 최소한으로 줄어든다.
- 선언적 코드 (Declaractive Code) 
- App Name 수정 `Project Setting` -> `Info` -> `Bundle Name`으로 접근해서 앱이름을 변경할 수 있다.   
```swift
// Live Preview
Group {
    ContentView()
    ContentView()
        .previewLayout(.sizeThatFits) // Preview 사이즈 조정
        .environment(\.sizeCategory, .extraExtraExtraLarge) // Accessibility << 이건 좀 더 알아보기
        .previewDevice("iPhone 8")  // Specific device 여러 디바이스 설정 가능 (기기이름, 기기이름)
}

// Dark Mode
.enviroment(.\colorScheme, .dark)
```   

<br>

💡`Spacer()`와 `.frame(minWidth: 0, maxWidth: .infinity)`를 이용하는 것의 각각의 차이 디테일은 뭘까?   

✅ 답해보기!   

<br>

💡os마다 사용할 수 있는게 다른건가? 공식문서들을 찾아보며 확인하기
```swift
// All
ZStack, VStack, HStack, TabView
NavigationView, Picker, Stepper, Slider, etc.
SF Symbols

// iPad / Mac
TabView

// Mac
Keyboard Shortcuts
```  

✅ 답해보기!   


<br>

**2 - Layout and Stacks**    
- Stack들을 이용하여 뷰 올리기 학습
- modifier 중에서도 clip(이미지를 자르는) 기능이 들어가있는 기능이 있다.
- cornerRadius가 그예이다. .shadow를 적용하고 cornerRadius를 적용하면 clip되기 때문에 그림자가 적용된것을 확인할 수 없다.
- SwiftUI는 선언적 언어이니 modifier 적용에도 순서에 주의하자.

<br>

**3 - Components and Visual Effects 2**    
- View 재사용할 수 있게 Componemt로 나누는 작업 학습!!
- blur를 처음봐서 신기했음 (뷰를 흐리게 만들어주는 기능)

<br>

**4 - Animations and States**    
- State 어노테이션을 활용하여 Animation 적용
- 삼항연산자를 사용해서 true false 일 때 다른 값들을 넣어주어 화면을 표시하는게 재밌었음.

<br>

**5 - Gestures and Events**    
`@State`를 적용하여 뷰, 제스쳐, 이벤트 등을 다루는 방법 학습

- `@State` annotation을 이용해  `viewState`라는 변수 선언
- `viewState` 기준으로 `offset` 설정한 `CardView`에  `.gesture()` `DragGesture`를 통해 제스쳐 했을때랑 제스쳐가 끝났을때 (`.onChanged`, `onEnded`) `viewState` 값을 변경시켜줘 효과 적용
- `.animation(.spring())`에서  `.spring()`을 커스텀하게 설정 해줘서 재미난 효과 적용
- 가장 신기한건 `offset` 2단적용.... `show` 상태에 따라 달리지기도 하고 `viewState`에 따라 달라지기도한다 (SwiftUI 너무 매력적)

<br>

**6 - Timing Curve and Delay Animation**    

<br>

**Dissmiss and Drag Anchors**    

<br>

