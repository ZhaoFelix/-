//
//  Lesson.swift
//  WeiXin
//
//  Created by administrator on 2019/7/9.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

var lessonDic:[String: LessonMessage]?

class LessonMessage: Codable {
    var text1 = ""
    var text2 = ""
    var text3 = ""
    var text4 = ""
    var lessonName = ""
    var teacherName = ""
}
