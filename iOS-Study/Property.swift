//
//  property.swift
//  iOS study
//
//  Created by yeonsu on 8/2/22.
//

import Foundation

// ============ < 저장 프로퍼티 > ============

// 구조체
struct CoordinatePoint {
    // 저장 프로퍼티
    var x: Int
    var y: Int
}

// 인스턴스 생성
let yeonsuPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)


// 클래스
class Position {
    var point: CoordinatePoint
    let name: String

    // 클래스의 경우 초기값을 지정해주지 않으면 따로 정의해줘야 함
    init(name: String, CurrentPoint: CoordinatePoint){
        self.name = name
        self.point = CurrentPoint
    }
}

print("yeonsu's position is \(yeonsuPoint.x), \(yeonsuPoint.y)")



// 옵셔널 저장 프로퍼티
class Yeonsu {
    var name: String
    var point: CoordinatePoint? //옵셔널로 지정


    init(name: String) {
        self.name = name
    }
}

let introduceYs: Yeonsu = Yeonsu(name: "Bonny")

introduceYs.point = CoordinatePoint(x:10, y:2)  //값을 나중에 할당

print(introduceYs.name)


// ============ < 지연 저장 프로퍼티 > ============

// 처음 사용할 때까지 초기값이 계산되지 않은 프로퍼티


struct Coordinate {
    var x: Int = 0
    var y: Int = 0
}

class Position_p {
    lazy var point: CoordinatePoint = CoordinatePoint(x: 1, y: 2)
}

let ysPosition: Position_p = Position_p()

print(ysPosition.point)     //처음 CoordinatePoint 생성


// ============ < 연산 프로퍼티 > ============

struct Coordinate2 {
    
    // 저장 프로퍼티
    var x: Int
    var y: Int
    
    // 연산 프로퍼티
    var oppositePoint: Coordinate2 {
        //접근자
        get {
            return Coordinate2(x: -x, y: -y)
        }
        
        //설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var yeonsuPosition: Coordinate2 = Coordinate2(x: 10, y: 30)

print(yeonsuPosition)
print(yeonsuPosition.oppositePoint)


// ============ < 프로퍼티 감시자 > ============

class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다")
        }
    }
}

let myAccount: Account = Account()  //인스턴스 생성
//print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다

myAccount.credit = 1000     //인스턴스 사용
//print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다
