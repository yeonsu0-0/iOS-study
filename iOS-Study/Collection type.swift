//
//  Collection type.swift
//  iOS study 
//
//  Created by yeonsu on 2022/07/25.
//

import Swift

/*
 [컬렉션 타입 종류]
 Array: 순서가 있는 컬렉션
 Dictionary: 키와 값의 쌍으로 이루어진 컬렉션
 Set: 순서가 없고, 멤버가 유일한 컬렉션 
 */


// ================ <Array> ================

//빈 Int Array 생성
var integers: Array<Int> = Array<Int>()


//멤버 추가
integers.append(1)
integers.append(100)
print(integers)

//integers.append(101.1) 불가


//멤버가 들어있는지 확인
integers.contains(100)  //true
integers.contains(99)   //false
print(integers.contains(100))


//인덱스에 해당되는 값 제거
integers.remove(at: 0)  //0번째 인덱스에 있는 값 제거
/*
 integers.removeLast()
 integers.removeAll()
 */

print(integers.count)


//Array<Double>과 [Double]은 동일한 표현

//빈 Double Array 생성
var doubles: Array<Double> = [Double]()

//빈 String Array 생성
var strings: [String] = [String]()

//빈 Character Array 생성
var characters: [Character] = []

//let을 사용하여 Array를 선언하면 불변 Array
let immutableArray = [1, 2, 3]
//immutableArray.append(4)      //불가능
//immutableArray.removeAll()    //불가능



// ================ <Dictionary> ================

//Key가 String 타입이고 Value가 Any인 빈 Dictionary 생성
var anyDictionary: Dictionary<String, Any> = [String: Any]()
anyDictionary["someKey"] = "value"
anyDictionary["anotherKey"] = 100

print(anyDictionary)    //["someKey": "value", "anotherKey": 100]
anyDictionary["someKey"] = "dictionary"

anyDictionary.removeValue(forKey: "anotherKey")
print(anyDictionary)

anyDictionary["someKey"] = nil
print(anyDictionary)

let emptyDictionary: [String: String] = [:]
let initalizedDictionary: [String: String] = ["name": "yeonsu", "gender": "female"]

//let someValue: String = initalizedDictionary["name"]  //오류! 값의 유무 불투명



// ================ <Set> ================

var integerSet: Set<Int> = Set<Int>()
integerSet.insert(1)
integerSet.insert(100)
integerSet.insert(99)
integerSet.insert(99)
integerSet.insert(99)

print(integerSet)   //[1, 100, 99] *중복되는 값은 하나만

integerSet.contains(1)  //true
integerSet.contains(2)  //false

integerSet.remove(100)
integerSet.removeFirst()

print(integerSet.count)

let setA: Set<Int> = [1, 2, 3, 4, 5]
let setB: Set<Int> = [3, 4, 5, 6, 7]

//set 합치기
let union: Set<Int> = setA.union(setB)
print(union)    //[1, 7, 5, 2, 3, 4, 6] 중구난방으로 출력

//set 정갈하게 하기
let sortedUnion: [Int] = union.sorted()
print(sortedUnion)    //[1, 2, 3, 4, 5, 6, 7]

//공통되는 인덱스 찾기
let intersection: Set<Int> = setA.intersection(setB)
print(intersection)

//공통되지 않는 인덱스 찾기
let subtracting: Set<Int> = setA.subtracting(setB)
print(subtracting)

