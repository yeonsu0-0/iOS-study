//
//  Access Control.swift
//  iOS study
//
//  Created by yeonsu on 8/5/22.
//

/*
 *****접근 제어의 종류*****
 open
 public
 internal
 fileprivate
 private
 */

import Foundation

//접근수준(set)으로 설정자의 접근 수준만 더 낮도록 지정해줄 수 있다
public struct SomeType {
    public private(set) var SetPrivate: Int = 120
}


var SomeInstance: SomeType = SomeType()
print(SomeInstance.SetPrivate)
