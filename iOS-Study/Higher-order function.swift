//
//  Higher-order function.swift
//  iOS study
//
//  Created by yeonsu on 8/15/22.
//

import Foundation

/* 고차 함수(Higher-order function) */
// 전달인자로 함수를 전달받거나 함수 실행의 결과를 함수로 반환하는 함수

// 종류: map, filter, reduce


// MARK: map
// 컨테이너 내부의 기존 데이터를 변형해서 새로운 컨테이너 생성(컨테이너에 포장해서 반환)

// ex)
// 배열 생성
let numbers: [Int] = [0, 1, 2, 3, 4]
var doubleNumbers: [Int]
var strings: [String]

// MARK: for-in 구문 사용
doubleNumbers = [Int]()
strings = [String]()

for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)


// MARK: map 메서드 사용
doubleNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)
print(strings)

// MARK: 매개변수, 반환타입, return 키워드 생략, 후행 클로저
doubleNumbers = numbers.map {$0 * 3}
print(doubleNumbers)


// **************************************************
// MARK: filter
// 컨테이너 내부의 값을 걸러서 새로운 컨테이너로 추출
// filter 함수의 매개변수로 전달되는 함수의 반환 타입은 Bool

// MARK: for-in 구문 사용
var filtered: [Int] = [Int]()       // 짝수만 걸러서 넣을 빈 배열 생성

for number in numbers {             // numbers 배열 요소들 중에서
    if number % 2 == 0 {            // 2로 나눈 나머지가 0일 경우(짝수일 경우)
        filtered.append(number)     // 짝수만 걸러서 넣는 빈 배열에 추가
    }
}

print(filtered)


// MARK: filter 메서드 사용


let evenNum: [Int] = numbers.filter {
    (number: Int) -> Bool in
    return number % 2 == 0
}

print(evenNum)


// MARK: 매개변수, 반환타입, return 키워드 생략, 후행 클로저
let oddNum = numbers.filter {
    $0 % 2 != 0
}

print(oddNum)


// **************************************************
// MARK: reduce
// 컨테이너 내부의 콘텐츠를 하나로 통합하는 기능을 실행

// MARK: for-in 구문 사용

var result: Int = 0

for number in numbers {
    result += number
}

print(result)


// MARK: reduce 메서드 사용

//초기값이 0이고 numbers 내부의 모든 값 더하기
let sum: Int = numbers.reduce(0, {
    (first: Int, second: Int) -> Int in
    print("\(first) + \(second)")
    return first + second
})

print(sum)
