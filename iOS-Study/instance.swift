//
//  이니셜라이저와 디이니셜라이저.swift
//  iOS study
//
//  Created by yeonsu on 8/3/22.
//

import Foundation

// 인스턴스가 생성이 될 때 프로퍼티 값들이 초기화가 되어있어야 한다

// ================== < 1. 기본값 할당 > ==================

class StudentA {
    //모든 저장 프로퍼티에 기본값 할당
    //(따로 이니셜라이저를 통해 초기값을 할당하지 않아도 된다)
    var name: String = " "  //이름
    var age: Int = 0        //나이
    var major: String = " " //전공
}

// 인스턴스 생성
let John: StudentA = StudentA()

// 인스턴스 사용
John.name = "John"
John.age = 24
John.major = "Digital Media"

// =====================================================
// =============== < 2. 이니셜라이저(init) > ===============

// init 키워드를 사용해서 프로퍼티 기본값을 사용하지 않더라도 인스턴스가 생성이 됐을 때 원하는 값들을 넣어줄 수 있다

class StudentB {
    var name: String
    var age: Int
    var major: String
/*
 저장 프로퍼티에 기본값을 할당하지 않은 경우 오류 발생!
 Class 'StudentB' has no initializers
*/
    
// 이니셜라이저로 초기값 설정
    init(name: String, age: Int, major: String) {
        self.name = name
        self.age = age
        self.major = major
        
// self는 매개변수와 변수를 구분하기 위한 것!
// 변수에 self를 붙인다
        
    }
}

// 인스턴스 생성
let Jessi: StudentB = StudentB(name: "Jessi", age: 23, major: "Visual Design")

// =====================================================
// =============== < 3. 옵셔널(Optional) > ===============

// 프로퍼티 값이 꼭 필요한 것이 아님을 명시하고 싶을 때 옵셔널 사용!

class StudentC {
    var name: String
    var age: Int
    var major: String?      //옵셔널
    
    //프로퍼티 3개 값 모두 초기화하는 경우
    init(name: String, age: Int, major: String) {
        self.name = name
        self.age = age
        self.major = major
    }
    
    //옵셔널을 제외한 2개 값을 초기화하는 경우
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

// 인스턴스 생성
let Jenny: StudentC = StudentC (name: "Jenny", age: 25)
let Mike: StudentC = StudentC (name: "Mike", age: 21, major: "Design")


// ** 암시적 추출 옵셔널
// 인스턴스 사용에 꼭 필요하지만 초기값을 할당하고 싶지 않을 때

class Puppy {
    var name: String
    var owner: StudentC!
    
    init(name: String) {
        self.name = name
    }
    
    func goOut() {
        print("\(name)가 주인 \(owner.name)와 산책을 합니다")
    }
}

// 인스턴스 생성
let cloud: Puppy = Puppy(name: "cloud")

// cloud.goOut()    //주인은 아직 nil인 상태이다
cloud.owner = Jenny
cloud.goOut()

// =====================================================
// ============= < 4. 실패 가능한 이니셜라이저 > ==============

// 이니셜라이저의 전달인자로 잘못된 값이나 적절하지 못한 값이 전달되었을 때 실패 가능성을 내포한 이니셜라이저를 정의할 수 있다

// init? 키워드 사용 -> return값으로 nil을 가질 수 있다

class StudentD {
    let name: String
    let age: Int?
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0{
            return nil
        }
        self.name = name
        self.age = age
    }
}

// =====================================================
// ================= < 5. 디이니셜라이저 > =================

// 클래스에서만 사용 가능!
// 메모리에서 소멸되기 전 정리 작업 구현

class Person {
    var name: String
    var pet: Puppy? //옵셔널
    var child: StudentC
    
    init(name: String, child: StudentC) {
        self.name = name
        self.child = child
    }
    
    deinit {
        if let petName = pet?.name {
            print("\(name)가 \(child.name)에게 \(petName)을 인도합니다")
            self.pet?.owner = child
        }
    }
}

// 인스턴스 생성
let donald: Person? = Person(name: "Donald", child: Jenny)

// =====================================================
