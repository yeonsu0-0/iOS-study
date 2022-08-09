//
//  Closure2.swift
//  iOS study
//
//  Created by yeonsu on 8/9/22.
//

import Foundation

// ****************************************************************
// 값 획득

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    
    // 중첩 함수 incrementer()는 자신 주변에서 runningTotal과 amount 값을 획득한다
    // 두 값을 획득한 후 클로저로서 makeIncrementer()에 의해 반환된다
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// () -> Int 는 함수 객체를 반환한다는 의미이다 매개변수를 받지 않고 반환 타입은 Int인 함수이다
// forIncrement는 전달인자 레이블

// runningTotal과 amount값은 makeIncrementer() 함수 실행이 끝나도 사라지지 않는다
// => 함수를 호출할 때마다 두 개의 값이 누적된다

let incrementByTwo: (()->Int) = makeIncrementer(forIncrement: 2)
// 함수와 클로저는 참조 타입이기 때문에 변수에 할당할 때마다 사실은 상수나 변수에 함수나 클로저의 참조를 설정하는 것이다

let first: Int = incrementByTwo()
print(first)    //2

let second: Int = incrementByTwo()
print(second)   //4

let third: Int = incrementByTwo()
print(third)    //6

// 새롭게 선언될 때마다 초기화되지 않고 이전에 캡쳐한 값으로 계속해서 사용한다!




// ****************************************************************
// 탈출 클로저

var completionHandlers: [() -> Void] = []

//탈출 클로저를 매개변수로 갖는 함수


func someFunctionWithEscapingClosure(completionHandler: @escaping() -> Void) {
    completionHandlers.append(completionHandler)
}


typealias VoidClosure = () -> Void

let firstClosure: VoidClosure = {
    print("Closure A")
}

let secondClosure: VoidClosure = {
    print("Closure B")
}

// 전달인자로 전달받은 클로저를 함수 외부로 다시 반환 -> 함수 탈출
func returnOneClosure(first: @escaping VoidClosure, second: @escaping VoidClosure,
                      shouldReturnFirstClosure: Bool) -> VoidClosure {
    return shouldReturnFirstClosure ? first : second
}

// 함수 외부로 반환한 클로저를 함수 외부의 상수에 저장
let returnedClosure: VoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()   //Closure A

var closures: [VoidClosure] = []

func appendClosure(closure: @escaping VoidClosure) {
    closures.append(closure)
}



// ****************************************************************
// withoutActuallyEscaping

// 실제로는 탈출하지 않는데 다른 함수에서 탈출 클로저를 요구하는 상황

let numbers: [Int] = [2, 4, 6, 8]

let evenNum = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNum = { (number: Int) -> Bool in
    return number % 2 == 1
}


// hasElements(in: 매개변수로 검사할 배열 match: 매개변수로 검사를 실행할 클로저를 받아들임

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNum = hasElements(in: numbers, match: evenNum)
let hasOddNum = hasElements(in: numbers, match: oddNum)

print(hasEvenNum)   //true
print(hasOddNum)    //false



// ****************************************************************
// 자동 클로저

// 함수의 전달인자로 전달하는 표현을 자동으로 변환해주는 클로저(전달인자를 갖지 않음)

var customer: [String] =  ["Bonny", "yeonsu", "Jhon"]

func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer(customer.removeFirst())   //Now serving Bonny!
