# DesignCodeStudy
디자인 코드 강의 보면서 실습, 메모하듯 기록, 모르는 개념 정리

## 목표
우선은 designcode.io의 Swift 강의를 듣고 정리하고 싶고
일단 Part1까지는 Readme에 정리 후 Part2를 시작할때는 각 코스마다 md파일을 따로 만들어 Readme 에 목록을 만들어 링크 타서 들어갈 수 있게 하기!

## Part 1
### 1 - Learn SwiftUI for iOS 13
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

### 2 - Layout and Stacks 
- Stack들을 이용하여 뷰 올리기 학습
- modifier 중에서도 clip(이미지를 자르는) 기능이 들어가있는 기능이 있다.
- `.cornerRadius`가 그예이다. `.shadow`를 적용하고 `.cornerRadius`를 적용하면 clip되기 때문에(경계값으로 프레임을 잡고 잘라버림) 그림자가 적용된것을 확인할 수 없다.
- SwiftUI는 선언적 언어이니 modifier 적용에도 순서에 주의하자.

<br>

### 3 - Components and Visual Effects 2
- View 재사용할 수 있게 Componemt로 나누는 작업 학습!!
- blur를 처음봐서 신기했음 (뷰를 흐리게 만들어주는 기능)

<br>

### 4 - Animations and States
- State 어노테이션을 활용하여 Animation 적용
- 삼항연산자를 사용해서 true false 일 때 다른 값들을 넣어주어 화면을 표시하는게 재밌었음.

<br>

### 5 - Gestures and Events
`@State`를 적용하여 뷰, 제스쳐, 이벤트 등을 다루는 방법 학습

- `@State` annotation을 이용해  `viewState`라는 변수 선언
- `viewState` 기준으로 `offset` 설정한 `CardView`에  `.gesture()` `DragGesture`를 통해 제스쳐 했을때랑 제스쳐가 끝났을때 (`.onChanged`, `onEnded`) `viewState` 값을 변경시켜줘 효과 적용
- `.animation(.spring())`에서  `.spring()`을 커스텀하게 설정 해줘서 재미난 효과 적용
- 가장 신기한건 `offset` 2단적용.... `show` 상태에 따라 달리지기도 하고 `viewState`에 따라 달라지기도한다 (SwiftUI 너무 매력적)

<br>

### 6 - Timing Curve and Delay Animation
- State에 따라서 뷰의 offset이나 Animation을 다르게 적용해 주는데, View의 Componet를 잘 분리해주지 않으면 상태에 따른 뷰를 보여주는 코드를 적용하는데 힘들것으로 보인다.
- 선언적 언어의 장점을 잘 활용하기 위해서는 뷰를 잘 나눠줘야 할 것 같다.
- 한 뷰에 같은 modifier를 정해주더라도 상태에 따라서 다르게 적용가능, 즉 뷰가 상태에 따라 보이게 할 수 있다.   
```swift
.rotationEffect(.degrees(show ? 0 : 5))
.rotationEffect(Angle(degrees: showCard ? -5 : 0))
```   

<br>

### 7 - Dissmiss and Drag Anchors
- SF Symbol을 다운받아서 사용하였다.
- 새로운 화면을 만들기 위해 SwiftUI View 파일을 만들어 주었다.
- 이 뷰에서도 Component를 만들어 주었는데, 프로퍼티를 선언해줌으로써 각기 다른 타이틀과 아이콘으로 재사용해주었다.!

💡 SF Symbol을 다운 받기만 하면 import를 따로 하지 않아도 아이콘을 쓸 수 있는건가??   
✅  SF Symbol을 다운 받지 못하면 `gear` 같이 제공해주는 이미지를 쓸 수 없음.    

<br>

💡 맞다면 따로 import 하지 않고 배포를 해도 핸드폰에서 그 icon이 잘 보이는걸까??   
✅   

<br>

### 8 - SF Symbols and Props
MenuView 뷰 구현, Component 분리 
<br>

### 9 - Color Literal, Gradient and Overlay
Gradient를 사용해서 그라데이션 줄 수 있다.   
Color Literal 사용해서 색깔 적용. 일반적인 Style Guide에 의하면 Color Literal을 앞으로 사용하진 않을듯., 
`.overLay()`  덮어씌우다
- `ZStack` 방법 말고 뷰를 겹치는 방법 중 하나.    
<br>

`overlay(_:alignment:)`
- `ZStack`을 적용했을 때와 비슷한 효과를 내는 modifier이다.
- 적용한 뷰의 위에 뷰가 올려지게 되고, 특이점은 `.frame()` 따로 지정하지 않으면 적용한 뷰와 같은 크기를 가진다는 것이다.
- `background()`는 `overlay`와는 반대로 적용한 뷰의 하위에 뷰가 쌓인다.
- [overlay(_:alignment:)](https://developer.apple.com/documentation/swiftui/view/overlay(_:alignment:)) 는 15이전까지만 사용되고 deprecated 됨.
- [overlay(alignment:content:)](https://developer.apple.com/documentation/swiftui/view/overlay(alignment:content:)) 대체자로는 iOS 15 부터 사용가능한 이 메서드이다.   
<br>

`modifier 연속 적용`
아래의 코드를 처음 보았을 때 신기하기도 했지만 혼란스러웠다.   
```swift
Color.white
    .frame(width: 38, height: 6)
    .cornerRadius(3)
    .frame(width: 130, height: 6)
    .background(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).opacity(0.08))
    .cornerRadius(3)
    
```    


swiftUI의 특성을 아직 확실히 이해하진 못한 상황이지만 modifer의 대부분은 View 프로토콜을 따르는 content를 반환한다.      
정확히 말하자면 `cornerRadius`가 반환한 뷰에 `frame`을 지정해주는게 맞지만 좀 위의 코드와 별개로 간결하게 상황을 바라보자면 이미지 처럼 `.frame()`을 두번 적용했을 때를 확실하게 이해하고 싶었다.   
Color.white의 frame을 .frame() 메서드를 통해 잡아주었고, Color뷰의 크기를 값 만큼 변하여 반환해준걸로 보인다.   
- 여기서 새로운 `.frame(width: 130, height: 6)`처럼 .frame을 한번 더 적용해 줄 시 나는 `white`컬러의 뷰가 130만큼 늘어날 줄 알았지만, 너비가 38 사이즈의 뷰가 white 색으로 자리 잡고 있고, 그것과는 별개로 default 색이 뭔지는 모르겠지만 기대했던 하얀색이 아닌 너비 130을 가진 새로운 뷰가 생성되었다.   
💡 즉 `Color.white`가 아닌 Color.white에 `.frame 수정자를 적용해 리턴한 뷰`의 사이즈를 새로 선언한 `.frame(width: 130, height: 6)` 수정자를 통해 사이즈를 정해주었다고 이해하였다.    
글로 쓰면서도 정리가 잘 안되고 어려웠지만 내 생각의 정리에는 도움이 된 것 같다.   
이게 잘못된 이해일 수도 있지만 WWDC와 다른 문서들을 보며 나의 생각을 계속 점검해 나갈 생각이다.   

<br>

`.frame(width: 130, height: 6, alignment: .leading)`을 적용한 결과 너비 38의 뷰가 leading으로 정렬 되는 것으로 볼 때 `.frame(width: 130, height: 6, alignment: .leading)`로 수정해준 뷰가 너비 38의 뷰를 감싸고 있음을 알 수 있다.

<br>

### 10 - Animation Between Screens

<br>

### 11 - Drag Progress and Tap Background

<br>

### 12 - Binding and Screen Size

<br>
