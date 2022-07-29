import Cocoa

var greeting = "Hello, playground"
print(greeting)

// ======= < 변수 선언 > =======

let name: String = "yeonsu Kim"     //상수
var age: Int = 24                   //변수
let birth: Int = 990712

//문자열 보관법
print("Hi! My name is \(name) and I'm \(age)years old")


// ======= < 타입 별칭 > =======
typealias MyInt = Int
typealias YourInt = Int

var MyYear: MyInt = 1999
var YourYear: YourInt = 2000

MyYear = YourYear


// ======= < 튜플 > =======
var introduce: (String, Int, Double) = ("yeonsu", 24, 166.8)
print("Hi! My name is \(introduce.0), I'm \(introduce.1) and My height is \(introduce.2)")

var introduce2: (name: String, age: Int, hei: Double) = ("yeonsu", 24, 166.8)
print("Hi! My name is \(name), I'm \(age)")



// ======= < 배열 > =======

var blackpinkNames: Array<String> = ["jenny", "Jisu", "Rose", "Lisa"]
var BlackpinkNames: [String] = ["jenny", "Jisu", "Rose", "Lisa"]

var emptyArray: [Any] = Array<Any>()
var EmptyArray: [Any] = [Any]()

blackpinkNames.append("Bonny")  //마지막에 추가
blackpinkNames.append(contentsOf: ["Mimi", "Yuna"])

BlackpinkNames.insert(contentsOf: ["Bonny", "Honey"], at:1)

print(BlackpinkNames.firstIndex(of: "Bonny"))

let firstItem: String = blackpinkNames.removeFirst()
let indexZeroItem: String = BlackpinkNames.remove(at: 1)

print(firstItem)
print(indexZeroItem)

print(BlackpinkNames)


// ======= < 딕셔너리 > =======

// 키가 String, 값이 Int 타입인 빈 딕셔너리 생성
var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()

var NumberForName: [String: Int] = [String: Int]()

var Numforname: [String: Int] = [:]

// 초기값을 넣어서 생성 가능
var numforname: [String: Int] = ["yeonsu": 100, "Bonny": 200]

print(NumberForName.isEmpty)
print(numforname.isEmpty)
print(numforname)

print(numforname["yeonsu"])
print(numforname["Honey"])  //배열과 달리 딕셔너리는 nil값을 반환한다

print(numforname.removeValue(forKey: "yeonsu"))     //키에 해당하는 값 삭제
print(numforname)


// ======= < 세트 > =======

var names: Set<String> = Set<String>()
var Names: Set<String> = []

var YourNames: Set<String> = ["Jenny", "Bonny", "Honey"]
print(YourNames.count)

let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)

print(새.isSubset(of: 동물))



// ======= < 열거형 > =======
enum Restaurant {
    case pizza(dough: String, topping: String)  //튜플과 같이 사용
    case pasta(taste: String)
    case drink(flavor: String)
}

var dinner: Restaurant = Restaurant.pasta(taste: "cream")
dinner = .drink(flavor: "coke")


// ======= < 튜플 switch case > =======

typealias NameAge = (name: String, age: Int)
let tupleValue: NameAge = ("yeonsu", 24)

switch tupleValue {
case("yeonsu", 24):
    print("정확히 맞췄습니다!")
default:
    print("누굴 찾나요?")
}


// ======= < for-in 구문 > =======
for i in 0...5 {
    print(i)
}


// 홀수 판별기
for i in 0...10 {
    
    if i.isMultiple(of: 2) {
        print(i)
        continue
    }
    print("\(i)==홀수")
}



// ======= < 함수 > =======

/*
 func 함수이름 (매개변수) -> 반환타입 {
    실행구문
    return 반환값
 }
 */

func hello(name: String) -> String {
    return "Hello \(name)"
}

let helloBonny: String = hello(name: "Bonny")
print(helloBonny)

func helloWorld() -> String {
    return "Hello World!"
}

print(helloWorld())



// ======= < 옵셔널 > =======

var galaxy: String? = "jupiter"
print(galaxy)

galaxy = nil
print(galaxy)

