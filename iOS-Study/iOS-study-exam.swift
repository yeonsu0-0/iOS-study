//
//  iOS-study-exam.swift
//  iOS study
//
//  Created by yeonsu on 8/21/22.
//

import Foundation

/*=============================================
 1. TODO: result 옵셔널 Int를 벗겨내어 내부의 값을 출력하시오.
 총 사용하는 4가지 방식을 이용하여 각각 작성하시오.
 =============================================*/
let result: Int? = 1

// 1)
print(result!)

// 2)
if result != nil {
    print(result!)
}

// 3)
if let myResult = result{
    print(myResult)
} else {
    print("nil")
}

// 4)
(result != nil) ? print(result!) : print("nil")





/*=============================================
 2. TODO: 삼항연산자를 사용하여 진실 / 거짓을 출력하시오.
 result2가 true이면 "진실"을 출력
 result2가 false이면 "거짓"을 출력
 =============================================*/
let result2: Bool = Bool.random()

var isTrue: String = (result2 == true) ? "진실" : "거짓"
print(isTrue)






/*=============================================
 3. 월, 화, 수, 목, 금 case를 가진 열거형 Weekday가 있다.
 today에는 랜덤으로 요일이 들어가있다.
 TODO: switch문을 사용하여 각 케이스에 해당하는 요일을 출력하시오.
 ex) monday의 경우 "월요일" 출력
 =============================================*/
enum Weekday: String, CaseIterable {
    
    case monday = "월요일"
    case tuesday = "화요일"
    case wednesday = "수요일"
    case thursday = "목요일"
    case friday = "금요일"
    
    static func random() -> Weekday {
        let randomCase = Weekday.allCases.randomElement()
        return randomCase!
    }
}

let today: Weekday = .random()

//아래 코드를 입력하시오.

switch today {
case .monday:
    print("월요일")
case .tuesday:
    print("화요일")
case .wednesday:
    print("수요일")
case .thursday:
    print("목요일")
case .friday:
    print("금요일")
}



/*=============================================
 4. 매개변수 두개(Int, Int)를 받고 Int 타입을 리턴하는
 클로저를 매개변수 closure로 받는 함수 closureFunc이 있다.
 
 closureFunc는 내부에서 매개변수 closure를 실행시켜 얻은
 값을 출력하는 함수이다.
 
 실인자로 넘겨줄 inputClosure는 매개변수 두개를 곱한 값을
 반환한다.
 
 TODO: inputClosure에 들어갈 클로저를 작성하시오.
 *inputClosure2는 최대한 단축한 클로저로 작성하시오.
 =============================================*/
func closureFunc(_ closure: (Int, Int) -> Int) {
    
    let result5 = closure(5,2)
    
    print(result5)
}

//아래 주석을 제거 후 사용하세요🤗

var inputClosure = {(first: Int, second: Int) -> Int in
    return first * second
}
var inputClosure2: (Int, Int) -> Int = {$0 * $1}

closureFunc(inputClosure)
closureFunc(inputClosure2)





/*=============================================
 4. 고차함수 filter를 이용하여 numbers에 있는 원소들 중
 홀수(odd number)만을 추출하여 oddNumbers 배열에
 반환하시오.
 
 TODO: 조건) 후행 클로저 사용, 단축 인자 사용 불가
 =============================================*/
let numbers: [Int] = [1,2,3,4,5,6,7,8,9,10]

//아래 주석을 제거 후 사용하세요🤗

let oddNumbers: [Int] = numbers.filter({ (number: Int) -> Bool in
    return number % 2 == 1
})
print(oddNumbers)






/*=============================================
 5. NumArr 클래스 안의 저장 프로퍼티 number는 1 ~ 10까지
 정수를 담고 있는 배열이다.
 TODO: number의 index에 해당하는 요소를 반환하는 subscript를 만드시오.
 =============================================*/
class NumArr {
    var number: [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    //코드를 입력하세요.
    subscript(index: Int) -> Int {
        return number[index]
    }
    
}

let num: NumArr = NumArr()
print(num[1])



 

/*=============================================
 6. 몬스터를 클래스로 추상화하려고 한다.
 MARK: 몬스터는 다음과 같은 속성들과 특징을 가지고 있다.
 - hp, mp, atk, level, damage
 - hp는 level * 50의 값을 가지고 있다. MARK: (Hint : lazy)
 - 각 속성들은 생성된 인스턴스에서 접근할 수 없다.
 - damage는 atk * level의 값을 반환하는 읽기 전용 변수이다.
 
 MARK: 몬스터는 다음과 같은 스킬을 가지고 있다.
 - attack(enemy: Monster)
 - enemy에게 damage를 입힌다.
 
 - checkMyHp()
 - 객체의 hp를 출력한다.
 
 - getDamage(damage: Int)
 - 받은 damage만큼 체력이 감소된다.
 
 TODO:
 1) 몬스터 두마리 ( slime, skeleton ) 생성한다.
 2) 몬스터는 각각 다음과 같은 스텟을 가지고 있다.
 -slime      ( level: 10, mp: 50, atk: 10)
 -skeleton   ( level: 15, mp: 20, atk: 25)
 3) slime이 skeleton을 공격하여 skeleton의 hp를 출력하시오.
 =============================================*/
class Monster {
    
    lazy var hp: Int = level * 50


    var damage: Int {
        atk * level
    }
    
    var mp: Int
    var atk: Int
    var level: Int
    
    init(level: Int, mp: Int, atk: Int) {
        self.level = level
        self.mp = mp
        self.atk = atk
    }
    
    func attack(enemy: Monster) {
        enemy.hp = enemy.hp - damage
    }
    
    func checkMyHp() {
        print(hp)
    }
    
    func getDamage(damage: Int) {
        hp = hp - damage
    }
    
}

var slime: Monster = Monster(level: 10, mp: 50, atk: 10)
var skeleton: Monster = Monster(level: 15, mp: 20, atk: 25)

slime.attack(enemy: skeleton)
skeleton.checkMyHp()
