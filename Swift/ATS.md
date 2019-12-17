## ATS

### ATS란..?
> ATS는 App Transport Security의 약자로써, 앱과 웹 서비스의 통신 간 보안 향상을 위한 기능으로 ios에선 9.0, macOS 에선 10.11 부터 적용 가능합니다. **모든 인터넷 통신 시 안전한 프로토콜을 사용하도록 보장하는 것으로, 사용자의 민감한 정보가 유출되는 것을 방지할 수 있다.**

### 언제 써??
> 앱 개발시 인터넷을 이용하는 기능을 사용할 경우.. info 파일에 해당 도메인을 추가시켜 줘야 한다.

### 사용방법

~~~
// info.plist 파일에 복붙
 <key> NSAppTransportSecurity </key> 
 <dict>
 	<key> NSAllowsArbitraryLoads </key> 
 	<true/> 
 </dict>​
~~~


위 방법은 모든 HTTP 통신을 허용한다는 의미로써 ATS 기능을 비활성 해주는 설정값이다.. 본격적으로 ATS를 설정할려면 아래 코드와 같이 특정 도메인을 지정해 줄 수 있다.

~~~
 <key>NSAppTransportSecurity</key>
 <dict>
     <key>NSExceptionDomains</key>
     <dict>
         <key>www.abc.com</key>
         <dict>
             <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
             <true/>
         </dict>
     </dict>
 </dict>​
 
 ~~~
 
  
[돌아가기 > 배우는 내용](https://github.com/kbw2204/swiftNote)