//
//  Extension.swift
//  iOS study
//
//  Created by yeonsu on 8/28/22.
//

import Foundation


// 익스텐션: 구조체, 클래스, 열거형, 프로토콜 타입에 새로운 기능을 추가할 수 있는 기능
// 익스텐션은 타입에 새로운 기능을 추가할 수는 있지만, 기존에 존재하는 기능을 재정의할 수는 없다.

// 구현
/*
 extension 확장할 타입 이름 {
     // 타입에 추가될 새로운 기능 구현
 }*/

// 연산 프로퍼티 추가
// 짝수인지 홀수인지 알아보는 기능
extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven) // false
print(2.isEven) // true
print(1.isOdd)  // true
print(2.isOdd)  // false

var number: Int = 7
print(number.isEven) // false
print(number.isOdd) // true


// 메서드 추가
extension Int {
    func multiply(by n: Int) -> Int { // Int 타입에 인스턴스 메서드인 multiply(by:) 메서드 추가
        return self * n
    }
}
print(3.multiply(by: 2))  // 6
print(4.multiply(by: 5))  // 20

var num: Int = 3
print(num.multiply(by: 2))   // 6
print(num.multiply(by: 3))   // 9


// 이니셜라이저
// 1. 타입의 정의부에 이니셜라이저를 추가하지 않더라도 익스텐션을 통해 이니셜라이저를 추가할 수 있음
// 2. 익스텐션으로 클래스 타입에 편의 이니셜라이저는 추가할 수 있지만, 지정 이니셜라이저는 추가할 수 없음
// 3. 지정 이니셜라이저와 디이니셜라이저는 반드시 클래스 타입의 구현부에 위치
