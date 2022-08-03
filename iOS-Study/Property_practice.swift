//
//  main.swift
//  iOS study
//
//  Created by yeonsu on 8/3/22.
//

import Foundation

// 프로퍼티


/*
 1. 저장 프로퍼티
 2. 연산 프로퍼티
 3. 인스턴스 프로퍼티
 4. 타입 프로퍼티
 */

/*
 - 프로퍼티는 구조체, 클래스, 열거형 내부에 구현할 수 있다
 ** 열거형 내부에는 연상 프로퍼티만 구현할 수 있다
 - 연산 프로퍼티는 var로만 선언할 수 있다
 */

struct Student {
    //저장 프로퍼티
    
    //
    var name: String = " "
    
    //Swift에 이미 class라는 identifier가 있기 때문에 ``를 써줘야 함
    var `class`: String = "Swift"
    var koreanAge: Int = 0
    
    
    //연산 프로퍼티
    var westernAge: Int {
        get {
            return koreanAge + 1
        }
        
        set(inputValue) {
            koreanAge = inputValue + 1
        }
    }
    
    //타입 저장 프로퍼티(값 변경 불가)
    static var typeDescription: String = "학생"
}


//인스턴스 생성
var yeonsu: Student = Student()
yeonsu.koreanAge = 10

//인스턴스 저장 프로퍼티 사용
yeonsu.name = "yeonsu"
print(yeonsu.name)

//인스턴스 연산 프로퍼티 사용
print("제 한국 나이는 \(yeonsu.koreanAge)살이고, 미국 나이는 \(yeonsu.westernAge)살 입니다.")


//응용 코드
struct Money {
    var currencyRate: Double = 1100
    var dollar: Double = 0
    var won: Double {
        get {
            return dollar * currencyRate
        }
        set {   //set의 매개변수를 설정해주지 않으면 newValue
            dollar = newValue / currencyRate
        }
    }
}


var Mymoney = Money()
Mymoney.won = 11000

print(Mymoney.won)

Mymoney.dollar = 10

print(Mymoney.dollar)

var a: Int = 100
var b: Int = 200

var sum: Int {
    return a + b
}

print(sum) 
