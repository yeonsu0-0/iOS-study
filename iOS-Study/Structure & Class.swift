// 
//  structure & class.swift
//  iOS study
//
//  Created by yeonsu on 8/1/22.
//

import Foundation

/*
 구조체와 클래스란?
 새로운 사용자 정의 데이터 타입을 만들어 주는 것
 
 구조체의 인스턴스: 값 타입
 클래스의 인스턴스: 참조 타입
 */


// 구조체 정의
struct BasicInformation {
    var name: String
    var age: Int
}

// 구조체 인스턴스 생성 및 사용
var yeonsuInfo: BasicInformation = BasicInformation(name: "yeonsu", age: 24)
yeonsuInfo.age = 100
yeonsuInfo.name = "Bonny"


// 클래스 정의
class Diet {
    var height: Float = 0.0
    var weight: Float = 0.0
}

// 클래스 인스턴스 생성 및 사용
var yeonsu: Diet = Diet()
yeonsu.height = 166.8

// 클래스는 참조 타입이기 때문에 소멸
// deinit 메서드 사용
