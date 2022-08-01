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


