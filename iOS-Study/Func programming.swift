//
//  Optional Chaining / Early Exit.swift
//  iOS study
//
//  Created by yeonsu on 8/11/22.
//

import Foundation


// ============== < 1. 클래스, 구조체 설계 > ==============

class Room {
    var RoomNum: Int
    
    init(RoomNum: Int) {
        self.RoomNum = RoomNum
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var building: Building?
    var city: String
    
    init(city: String) {
        self.city = city
    }
}

class Person {
    var name: String
    var address: Address?
    
    init(name:String) {
        self.name = name
    }
}

// ============== < 2. 인스턴스 생성 > ==============
let yeonsu: Person = Person(name: "yeonsu")


// ============== < 3. 옵셔널 체이닝(1.Ver) > ==============
let yeonsuInfo: Any? = yeonsu.address?.building?.room?.RoomNum
print(yeonsuInfo)

// => 아직 값을 할당하지 않았기 때문에 nil 값이 반환된다

// ============== < 3. 옵셔널 체이닝(2.Ver) > ==============
if let roomNumber: Int = yeonsu.address?.building?.room?.RoomNum {
    print(roomNumber)
} else {
    print("She has no room")
}

// ============== < 4. 옵셔널 체이닝을 통한 값 할당 > ==============
yeonsu.address = Address(city: "경기도 파주시")
yeonsu.address?.building = Building(name: "연수프라자")
yeonsu.address?.building?.room = Room(RoomNum: 0)
yeonsu.address?.building?.room?.RoomNum = 101

print(yeonsu.address?.building?.room?.RoomNum)



// 빠른 종료
// 키워드: guard

for i in 0...3 {
    guard i == 1 else {
        continue
    }
    print(i)
}
