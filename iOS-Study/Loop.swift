// 
//  loop.swift
//  iOS study
//
//  Created by yeonsu on 2022/07/26.
//

import Swift

var integers = [1, 2, 3]
let people = ["yeonsu": 24, "John": 25, "Mike": 23]

// ================= < for - in > 구문 =================

/*
 for 임시상수 in 시퀀스아이템 {
    실행코드
 }
 */

for i in integers {
    print(i)
}


// Dictionary의 item은 key와 value로 구성된 튜플 타입이다
for (name, age) in people {
    print ("\(name): \(age)")
}


// ================= < While > 구문 =================

while integers.count > 3 {  //조건 숫자에 따라 달라지는 거 뭐지..?
    integers.removeLast()
}

print(integers)



// ================= < repeat - while > 구문 =================

repeat {
    integers.removeLast()
} while integers.count > 0

print(integers)
