//
//  subscript.swift
//  iOS study
//
//  Created by yeonsu on 8/20/22.
//

import Foundation


// School 클래스 서브스크립트 구현

struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    subscript(index: Int = 0) -> Student? {
        
        get {
            //index는 0부터 시작하기 때문에 원소의 개수보다 클 수 없다!
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        
        set {
            guard var newStudent: Student = newValue else {
                return
            }
            
            var number: Int = index
            
            /*
             만약 "Byeongkyu", "Yeonsu" 배열에서 "Star"를 추가한다고 치자.
             index는 "Byeongkyu"[0], "Yeonsu"[1], "Star"[2]가 되야 한다.
             "Star"를 [3] 인덱스로 넣는다고 하면 [2]자리가 빵꾸가 나게 된다.
             따라서 조건문을 통해 인덱스값을 맞춰준다.
             */
            if index > self.number {
                number = self.number
                self.number += 1
            }
            
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
}

// 인스턴스 생성
let highSchool: School = School()

// 인스턴스 사용
highSchool.addStudents(names: "Byeongkyu", "Yeonsu", "Star")

let aStudent: Student? = highSchool[1]
print(aStudent?.number)     //Optional(1)
print(aStudent?.name)       //Optional("Yeonsu")

Optional("Star")
print(highSchool[]?.name)   //매개변수 기본값 사용 Optional("Byeongkyu")



// ============================================
// 타입 서브스크립트
// static 키워드를 통해 구현할 수 있다

enum aSchool: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> aSchool? {
        return aSchool(rawValue: level)
    }
}

let school: aSchool? = aSchool[2]
print(school)   //Optional(iOS_study.aSchool.middle)


