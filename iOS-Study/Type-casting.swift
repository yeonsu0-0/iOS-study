//
//  Type casting.swift
//  iOS study
//
//  Created by yeonsu on 8/24/22.
//

import Foundation

var a: Double = 3.14
var b: Int = Int(a)

print(b)


// 부모 클래스 생성
class Flower {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        return "This flower is \(name)"
    }
}

// 자식 클래스-1 생성
class Freesia:Flower {
    var color: String
    
    override var description: String {
        return "This flower is \(name) and color is \(color)"
    }
    
    init(color: String, name: String){
        self.color = color
        super.init(name: name)
    }
}

// 자식 클래스-2 생성
class Rose:Flower {
    var season: String
    
    override var description: String {
        return "This flower is \(name) and It blooms in May-June"
    }
    
    init(season: String, name: String){
        self.season = season
        super.init(name: name)
    }
}


// 인스턴스 생성
let flower:Flower = Flower(name: "cherryBlossom")
print(flower.name)
// cherryBlossom

let myFavor:Freesia = Freesia(color: "yellow", name: "Freesia")
print(myFavor.description)
// This flower is Freesia and color is yellow

let yourFavor:Rose = Rose(season: "Spring", name: "Rose")
print(yourFavor.description)
// This flower is Rose and It blooms in May-June

// is: 데이터 타입 확인
print(flower is Flower)     //true
print(flower is Freesia)    //false
print(flower is Rose)       //false


// as: 다운 캐스팅
if let givingFlower: Freesia = flower as? Freesia {
    print("This is yours")
} else {
    print(flower.description)
}
// 결과 : This flower is cherryBlossom

if let givingFlower: Rose = yourFavor as? Rose {
    print("This is yours")
} else {
    print(yourFavor.description)
}
// 결과 : This is yours
// yourFavor이 참조하는 인스턴스가 Rose 타입의 인스턴스라면 givingFlower이라는 임시 상수에 할당하라는 뜻


