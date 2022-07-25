//
//  Function2.swift
//  iOS study
//
//  Created by yeonsu on 2022/07/25.
//

import Swift

// =================== < 매개변수 기본값 > ===================
// 기본값을 갖는 매개변수는 매개변수 목록 중에 뒤쪽에 위치하는 것이 좋다

/*
 
 func 함수이름(매개변수이름1: 매개변수타입1, 매개변수이름2: 매개변수타입2 = 매개변수 기본값...) -> 반환타입 {
    함수 구현부
    return 반환값
 }
 
 */

func greeting(friend: String, me: String = "yeonsu") {
    print ("Hello \(friend)! I'm \(me)")
}

// 매개변수 기본값을 가지는 매개변수는 함수 호출 시 생략할 수 있다
greeting(friend: "John")    //Hello John! I'm yeonsu
greeting(friend: "John", me: "bonny")



// =================== < 전달인자 레이블 > ===================
// 전달인자 레이블은 함수를 호출할 때 매개변수의 역할을 좀 더 명확하게 하거나 함수 사용자의 입장에서 표현하고자 할 때 사용한다(*함수 중복 정의 시에 유용)

/*
 
 func 함수이름(전달인자레이블 매개변수이름1: 매개변수타입1, 전달인자레이블 매개변수이름2: 매개변수타입2...) -> 반환타입 {
    함수 구현부
    return
 }
 
 */

// 기존 greeting 함수와는 달리 greeting, to, from 까지 함수의 이름으로 취급

// 함수 내부에서 전달인자를 사용할 때에는 매개변수 이름을 사용한다
func greeting(to friend: String, from me: String) {
    print("Hello \(friend)! I'm \(me)")
}

// 함수를 호출할 때에는 전달인자 레이블을 사용해야 한다
greeting(to: "gayeon", from: "yeonsu")




// =================== < 가변 매개변수 > ===================
// 전달 받을 값의 개수를 알기 어려울 때 사용할 수 있다
// 가변 매개변수는 함수 당 하나만 가질 수 있다

/*
 
 func 함수이름(매개변수이름1: 매개변수타입1, 매개변수이름2: 매개변수타입2...) -> 반환타입 {
    함수 구현부
    return
 }
 
 */

func sayHelloToFriend(me: String, friend: String...) -> String {
    return "Hello \(friend)! I'm \(me)!"
}

print(sayHelloToFriend(me: "yeonsu", friend: "gayeon", "ato", "stranger"))

print(sayHelloToFriend(me: "yeonsu"))   //Hello []! I'm yeonsu!




// =================== < 데이터 타입으로서의 함수 > ===================

// 스위프트는 함수형 프로그래밍 패러다임을 포함하는 다중 패러다임 언어이다
// 스위프트의 함수는 일급 객체이므로 변수, 상수 등에 저장이 가능하고, 매개변수를 통해 전달할 수 있다



// =================== < 함수의 타입표현 > ===================

// 반환타입을 생략할 수 없다
// (매개변수타입1, 매개변수타입2...) -> 반환타입

var someFunction: (String, String) -> Void = greeting(to: from:)
someFunction("gayeon", "yeonsu")

someFunction = greeting(friend: me:)
someFunction("John", "yeonsu")

// 타입이 다른 함수는 할당할 수 없다
// someFunction = sayHelloToFriend(me: friend:) //가변 매개변수를 가지기 때문에 일반 매개변수와 다름


//function은 반환값이 없고 String 타입 매개변수 2개를 갖는 매개변수이다
func runAnother(function: (String, String) -> Void) {
    function("jenny", "john")
}

runAnother(function: greeting(friend: me:))
runAnother(function: someFunction)
