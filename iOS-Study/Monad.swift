//
//  Monad.swift
//  iOS study
//
//  Created by yeonsu on 8/15/22.
//

import Foundation


// MARK: 모나드

// MARK: 컨텍스트
func add(_ num: Int) -> Int {
    return num + 3
}

print(add(2))       //순수값 2를 전달하면 정상적으로 함수를 실행할 수 있다
// print(Optional(2)) 순수값이 아닌 컨텍스트로 둘러싸인 값이 전달되었기 때문에 오류


// map 메서드를 사용하여 옵셔널 연산
print(Optional(2).map(add)) //Optional(5)
//map함수는 연산 결과를 다시 컨텍스트에 넣어 반환



// MARK: flatMap 활용
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

print(Optional(6).flatMap(doubledEven(_:)))     //Optional(12)
print(Optional(3).flatMap(doubledEven(_:)))     //nil



/* map과 flatMap의 차이 */
// 플랫맵(컴팩트맵)은 컨텍스트 내부의 컨텍스트를 모두 같은 위상으로 평평하게 펼쳐준다

let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }            //[Optional(1), Optional(2), nil, Optional(5)]
let flatmapped: [Int] = optionals.compactMap{ $0 }  //[1, 2, 5]

print(mapped)       //결과를 다시 Array 컨테이너에 담는다
print(flatmapped)   //내부 컨테이너까지 값을 추출한다
