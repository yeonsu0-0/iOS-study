// 
//  Conditional.swift
//  iOS study
//
//  Created by yeonsu on 2022/07/26.
//

import Swift

let someInteger = 100

// ================== < if - else 구문 > ==================

if someInteger < 100 {  //if 뒤에 소괄호는 생략 가능하지만, 중괄호는 생략 불가
    print ("100 미만")
} else if someInteger > 100 {
    print ("100 초과")
} else {
    print ("100")
}   //100 출력

// Swift의 조건에는 항상 Bool 타입이 와야 한다
// Ex) someInteget는 Int 타입이기 때문에 if문의 조건문에 쓸 시 컴파일 오류 발생!
// if someInteger {}    //컴파일 에러



// ================== < 범위 연산자 Switch > ==================
// switch 사용 시에 반드시 default값이 존재해야 한다. 안 그러면 컴파일 에러!
// ERROR: switch must be exhaustive

// break문이 명시하지 않아도 자동으로 설정되어 있음
// 무시하는 방법: fallthrough


switch someInteger {
case 0:
    print("zero")
case 1..<100:       //1이상 100미만
    print("1~99")
case 100:
    print("100")
case 101...Int.max:
    print("over 100")
    
default:
    print("Unknown")
}   //100 출력


// 정수 외에도 대부분의 기본 타입을 사용할 수 있다
switch "yeonsu" {
case "jenny":
    print("jenny")
case "mina":
    print("mina")
case "jobs":
    print("jobs")
    
default:
    print("Unknown")
}
