//
//  Function.swift
//  iOS study
//
//  Created by yeonsu on 2022/07/25.
//

import Swift

// ================ < 함수의 선언 > ================

// [함수 선언의 기본 형태]
/*
 
 func 함수이름(매개변수이름1: 매개변수1타입, 매개변수이름2: 매개변수2타입...) -> 반환타입 {
    함수 구현부
    return 반환값
 }
 
 */

func sum(a: Int, b: Int) -> Int {
    return a + b
}


// [반환 값이 없는 함수]
/*
 
 func 함수이름(매개변수이름1: 매개변수1타입, 매개변수이름2: 매개변수2타입...) -> Void {
    함수 구현부
    return 반환값
 }
 
 */

func printMyNmae(name: String) -> Void { // 아예 Void를 생략하는 것도 가능
    print(name)
}



// [매개변수와 반환값이 없는 함수]
/*
 
 func 함수이름() -> Void {  //Void 생략 가능
    함수 구현부
    return 반환값
 }
 
 */

func hello() { print ("hello")}




// ================ < 함수의 호출 > ================

sum(a:3, b:5)   //8
print (sum(a:3, b:5))

printMyNmae(name: "yeonsu")  

hello()
