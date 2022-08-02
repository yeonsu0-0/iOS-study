//
//  Optional.swift
//  iOS study
//
//  Created by yeonsu on 2022/07/26.
//

import Swift
import Security
import CFNetwork

// ================== < 옵셔널 > ==================
//값이 있을 수도 있고, 없을 수도 있다

let optionalConstant: Int? = nil
// let someConstant: Int = nil 컴파일 오류! 'nil' cannot initialize specified type 'Int'


//옵셔널은 nil의 가능성을 문서화하지 않아도 명시적으로 표현할 수 있기 때문에 사용한다

func someFunction (someOptionalParam: Int?) {
    // ...
}

someFunction(someOptionalParam: nil)    //안전하게 옵셔널 값 사용 가능

/*
 Optional: enum + general
 
 enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
 }
 */


//옵셔널 선언 방법(*둘 다 사용 가능)
let optionalValue: Optional<Int> = nil
let optionalValue2: Int? = nil


// ================== < 암시적 추출 옵셔널(!) > ==================

var ImplicitOptionalValue: Int! = 100

switch ImplicitOptionalValue {  //열거형이기 때문에 switch 구문으로 체크 가능
    
case .none:
    print("This Optional variable is nil")
    
case .some(let value):
    print("Value is \(value)")
}


//기존 변수처럼 사용 가능
ImplicitOptionalValue = ImplicitOptionalValue + 1   //연산 가능

//nil 할당 가능
ImplicitOptionalValue = nil

//잘못된 접근으로 인한 런타임 오류 발생
//ImplicitOptionalValue = ImplicitOptionalValue + 1
//바로 이전 코드에서 nil 값을 할당했기 때문에 오류 발생



// ================== < 일반 옵셔널(?) > ==================

var BasicOptionalValue: Int? = 100  // Int값이 있을 수도 있고, 없을 수도 있다

switch BasicOptionalValue {  //열거형이기 때문에 switch 구문으로 체크 가능
    
case .none:
    print("This Optional variable is nil")
    
case .some(let value):
    print("Value is \(value)")
}

//nil 할당 가능
BasicOptionalValue = nil

//기존 변수처럼 사용 불가 - 옵셔널과 일반 값은 다른 타입이므로 연산 불가

//BasicOptionalValue = BasicOptionalValue + 1
//오류 발생! Value of optional type 'Int?' must be unwrapped to a value of type 'Int'




// ================== < 옵셔널 값 추출 > ==================
 
/*
 옵셔널 값 추출 방법
 
 1. 옵셔널 바인딩(Optional Binding)
 2. 강제 추출(Force Unwrapping)
 */


// ================== < 1. 옵셔널 바인딩 > ==================
//옵셔널의 값을 꺼내오는 방법 중 하나로, nil 체크와 안전한 값 추출이 가능하다

//값이 있는지 없는지 정중하게 노크해서 물어보는 것(값이 있다면 꺼내오고, 없다면 지나침)

func printName(name: String) {
    print(name)
}

var myName: String? = nil
//printName(myName) //전달되는 값의 타입이 다르기 때문에 컴파일 오류 발생


// if-let 방식을 통해 옵셔널 바인딩이 가능하다

/*
if let name: String = myName {
    printName(name)
}else {
    print("myName == nil")
}
*/

//name 상수는 if-let 구문 내에서만 사용이 가능하다
//상수 사용범위를 벗어났기 때문에 컴파일 오류가 발생한다


var myNum: Int? = 123
var yourNum: Int? = nil
yourNum = 456

if let num = myNum, let friend = yourNum {
    print("\(num) and \(friend)")
}


// ================== < 2. 강제 추출(Force Inwrapping > ==================
//값이 있는지 없는지 강제로 깨부셔서 확인하는 것

func PrintName(_ Enname: String) {
    print(Enname)
}

var myEnName: String? = "Bonny"
PrintName(myEnName!)    //강제 추출

// ** 컴파일 에러 확인
//에러: Missing argument label 'Enname:' in call
//원인: Swift versions require explicit argument labels when calling a function. In your case it needs to read:

//해결 방법:
/*
 
함수 호출 시: PrintName(Enname: myEnName!)   //Enname 명시
또는
함수 선언 시: func PrintName(_ Enname: String)
//add underscores to the parameter labels in the function declaration

*/



myName = nil
//print(myName!)
//강제 추출 시 값이 없으므로 런타임 오류 발생

var yourEnName: String! = nil
//printName(yourEnName)
//nil 값이 전달되기 때문에 런타임 오류 발생


