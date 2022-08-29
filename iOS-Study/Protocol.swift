//
//  protocol.swift
//  iOS study
//
//  Created by yeonsu on 8/28/22.
//

import Foundation

// 일반적인 구현 방법
/*
protocol 프로토콜 이름 {
    프로토콜 정의
}
*/

// 구조체, 클래스, 열거형에서의 구현 방법
/*
struct SomeStruct: AProtocol, AnotherProtocol {
    // 구조체 정의
}

class SomeClass: AProtocol, AnotherProtocol {
    // 클래스 정의
}

enum SomeEnum: AProtocol, AnotherProtocol {
    // 열거형 정의
*/



// 1. 프로토콜의 프로퍼티 요구사항은 항상 var 키워드를 사용한 변수 프로퍼티로 정의
// 2. 읽기와 쓰기가 모두 가능한 프로퍼티는 프로퍼티의 정의 뒤에 {get set}이라고 명시,
//    읽기 전용 프로퍼티는 프로퍼티의 정의 뒤에 {get}이라고 명시한다.


protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedToBeSettableProperty: String { get }
}
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
    static var anotherTypeProperty: Int { get }
}


// 타입 프로퍼티를 요구하려면 static 키워드를 사용(class, struct 구분 X)

protocol Talkable {
    var topic: String { get set }
}

struct Person: Talkable {
    var topic: String
}

// 메서드 요구
protocol Talkable2 {
    var topic: String { get set }
    func talk(to: Person2)  //메서드
}

struct Person2: Talkable2 {
    var topic: String
    var name: String

    func talk(to: Person2) {
        print("\(topic)에 대해 \(to.name)에게 이야기합니다")
    }
}


// 이니셜라이저 요구
// 이니셜라이저를 정의하지만 구현은 하지 않음(매개변수 지정만)

/*
 protocol Talkable {
     var topic: String { get set }
     func talk(to: Person)
     init(name: String, topic: String)
 }

 */


