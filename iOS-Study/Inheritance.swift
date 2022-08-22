//
//  Inheritance.swift
//  iOS study
//
//  Created by yeonsu on 8/22/22.
//

import Foundation

// ================= < 프로퍼티 재정의 > =================

class Person {
    var name: String = " "
    var age: Int = 0
    
    var koreanAge: Int {
        return self.age + 1
    }
}

// Person 클래스 상속 및 재정의
class Student:Person {
    var grade: Int = 1
    
    // 읽기 전용에서 읽기, 쓰기가 가능한 프로퍼티로 재정의
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
}

// 인스턴스 생성
let yeonsu: Student = Student()

// 인스턴스 사용
yeonsu.age = 24
//print(yeonsu.koreanAge)     // 25



// ================= < 프로퍼티 감시자 재정의 > =================


class Person2 {
    var name: String = " "
    
    var age: Int = 0 {
        didSet {
            print("내 나이는 낭랑 \(self.age)세")
        }
    }
}

// Person 클래스 상속 및 재정의
class Student2:Person2 {
    var grade: Int = 1
    
    // 프로퍼티 감시자 재정의
    override var age: Int {
        didSet {
            print("내 나이는 좀 더 늙은 \(self.age)세")
        }
    }
    
}

// 인스턴스 생성
let ddu: Student2 = Student2()

// 인스턴스 사용
ddu.age = 24

/* 출력 결과(부모 감시자도 같이 동작)
 내 나이는 낭랑 24세
 내 나이는 좀 더 늙은 24세
 */


// ================= < 클래스 이니셜라이저 재정의 > =================

class Person3 {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}


class Manager:Person3 {
    var location: String
    
    // 지정 이니셜라이저 재정의
    override init(name: String, age: Int) {
        self.location = "Seoul"
        super.init(name: name, age: age)
    }
}


// ================= < 요구 이니셜라이저 재정의 > =================

class School {
    var location: String
    
    required init() {
        self.location = "Unknown"
    }
}

class Student4:School {
    var major: String = "Unknown"
}

let bonny: Student4 = Student4()
