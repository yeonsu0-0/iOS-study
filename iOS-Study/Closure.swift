//
//  Closure.swift
//  iOS study
//
//  Created by yeonsu on 8/6/22.
//

import Foundation


/*
 [클로저의 정의]
 1. 이름이 없는 함수
 2. 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것
 
 코드를 유용하게 작성하기 위해 사용한다.
 
 [클로저 표현]
 { (매개변수들) -> 반환타입 in
    실행코드
 }
 */



let names: [String] = ["Bonny", "John", "Ham"]


// 배열 값을 정렬하는 sorted(by: ) 메서드를 통해 함수와 클로저 비교해보기

// 함수
func backwards(first: String, second: String) -> Bool {
    return first > second   //true일 경우 first 반환
}

let reversed1: [String] = names.sorted(by: backwards(first:second:))
print(reversed1)

// 클로저
let reversed2: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})

print(reversed2)



// 클로저 표현 간소화

// 1. 문맥을 이용한 타입 유추(자료형 생략)
let SimpleClosure1: [String] = names.sorted(by: { (first, second) -> Bool in
    return first > second
})

// 2. 단축 인자 이름($0, $1, ...)
let SimpleClosure2: [String] = names.sorted {
    return $0 > $1
}

// 3. 암시적 반환 표현(return 생략)
let SimpleClosure3: [String] = names.sorted { $0 > $1 }

// 4. 연산자만 표기하기(매개변수 타입과 반환 타입이 연산자를 구현한 함수 모양과 동일한 경우)
let SimpleClosure4: [String] = names.sorted (by: >)
