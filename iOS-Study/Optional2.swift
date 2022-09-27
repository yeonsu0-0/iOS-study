//
//  Optional-2.swift
//  iOS study
//
//  Created by yeonsu on 2022/09/27.
//

import Foundation

/*
 //MARK: - nil
 
 - 다른 언어의 null
 - 값이 할당되지 않은 상태
 
 */

// let intValue: Int = nil
// 옵셔널 타입이 아닌 int 타입에 nil값을 대입하면 에러



//MARK: - 옵셔널 타입 선언 방법
var optValue: Int? = nil



//MARK: - 프로그래머가 의도하지 않아도 결과가 nil이 되는 행위
// 1. 타입 변환
let intFromStr = Int("abc")
print(intFromStr)   // nil

// 2. 딕셔너리
let numbers = ["one":1, "two":2]
let three = numbers["three"]    // 해당하는 key (X)
print(three)        // nil



//MARK: - 컬렉션과 옵셔널
var array1: [String]?   // 배열이 있을 수도, nil일 수도 있다
var array2: [String?]   // 배열의 값이 String일 수도 있고, nil일 수도 있다



//MARK: - 잘못된 옵셔널 사용 예

var optionalStr: String? = "ABC"
optionalStr?.lowercased()   // Result of call to 'lowercased()' is unused
print(optionalStr)          // Optional("ABC")
// 언젠가는 nil이 될 수도 있기 때문에 컴파일러가 경고를 날림



//MARK: - nil 검사
var optStr: String?     // 자동 초기화 되서 nil값을 가짐
if (optStr != nil) {
    print("nil이 아님")
}
else {
    print("nil이다!")
}



/*
 //MARK: - 옵셔널 바인딩
 
 - if/guard와 함께 사용
 - 옵셔널 타입에서 유효한 값을 상수에 대입
 - 바인딩 된 타입은 일반 타입(옵셔널X)
 - nil인 경우 else로 동작
 
 */

// 1. 옵셔널 바인딩: if let 구문
if let realStr = optionalStr {
    print("문자열의 값 \(realStr)")
}
else {
    print("문자열이 nil이다!")
}

// 2. 옵셔널 바인딩: guard 구문
func twice(price: Int?) {
    guard let price = price else
    { return
    }
    print((2 * price))
}



//MARK: - nil 연산자
// nil이면 ?? 연산자 이후의 값을 사용하고, nil이 아니면 언래핑 후 값을 할당한다
var userColor: String?
var colorName = userColor ?? "Red"
print(colorName)

