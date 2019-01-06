//
//  ViewController.swift
//  Calculator2
//
//  Created by s20171103186 on 2018/12/5.
//  Copyright © 2018 s20171103186. All rights reserved.
//

import UIKit



public struct Stack<T> {
    
    // 数组作为辅助存储器，主要是用来存储Stack里面的元素
    fileprivate var elements = [T]()
    
    // 构造器
    public init() {}
    
    // 出栈操作：从Stack中删除一个元素，并且将其返回
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    // 压栈操作：将数据元素压入栈底(类似于数组中的添加元素)
    public mutating func push(element: T){
        self.elements.append(element)
    }
    
    // 出栈操作：从Stack中返回一个数据元素，但是不会将其从Stack中删除
    public func peek() -> T? {
        return self.elements.last
    }
    
    // 判断Stack里面的元素是否为空
    public func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
    
    // 用于获取Stack里面的元素个数
    public var count: Int {
        return self.elements.count
    }
}


class ViewController: UIViewController {
    var myOperator = Stack<Int>()
    var myNumber = Stack<Double>()
    var Allnumber = Stack<Double>()
    @IBOutlet weak var output: UITextField!
    var temp:Double = 0
    var Operator:Int = 0
    var instead:Int = 0
    var temp1:Double = 0
    var changenumber:Double = 0
    var temp2:Double = 0
    var temp4:Double = 0
    var control1:Int = 0
    var control2:Int = 0
    var control3:Int = 0
    var Mixed:Int = 0
    var forever:Double = 0
    var deal:Double = 0
    var deal1:Int = 0
    @IBAction func clear(_ sender: UIButton) {
        output.text = "0"
        temp1 = 0
        temp2 = 0
        Operator = 0
        control2 = 1
        control3 = 0
        instead = 0
        Mixed = 0
        if !myNumber.isEmpty()
        {
            deal = myNumber.pop()!
        }
        if !myOperator.isEmpty()
        {
            deal1 = myOperator.pop()!
        }
        if !Allnumber.isEmpty()
        {
            deal = Allnumber.pop()!
        }
        deal = 0
        deal1 = 0
    }
    @IBAction func change(_ sender: UIButton) {
        changenumber = -1 * Double(output.text!)!
        output.text = "\(changenumber)"
    }
    @IBAction func percent(_ sender: UIButton) {
        temp4 = Double(output.text!)! * 0.01
        output.text = "\(temp4)"
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        if output.text == ""
        {
            output.text = ""
            Operator = 3
        }
        else
        {
            temp = Double(output.text!)!
            output.text = ""
            Operator = 3
        }
        if output.text != ""
        {
            if !myOperator.isEmpty()
            {
                instead = myOperator.pop()!
            }
            if !myNumber.isEmpty()
            {
                temp2 = myNumber.pop()!
            }
            if instead == 3
            {
                temp = temp2 * temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 4
            {
                temp = temp2 / temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 1
            {
                Mixed = 1
                forever = temp2
                control2 = 1
                control3 = control3 + 1
                Allnumber.push(element: forever)
            }
            if instead == 2
            {
                Mixed = -1
                forever = temp2
                control2 = 1
                control3 = control3 + 1
                Allnumber.push(element: forever)
            }
            temp1 = 0
            myOperator.push(element: Operator)
            myNumber.push(element: temp)
        }
    }
    
    @IBAction func divide(_ sender: UIButton) {
        if output.text == ""
        {
            output.text = ""
            Operator = 4
        }
        else
        {
            temp = Double(output.text!)!
            output.text = ""
            Operator = 4
        }
        if output.text != ""
        {
            if !myOperator.isEmpty()
            {
                instead = myOperator.pop()!
            }
            if !myNumber.isEmpty()
            {
                temp2 = myNumber.pop()!
            }
            if instead == 4
            {
                temp = temp2 / temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 3
            {
                temp = temp2 * temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 1
            {
                Mixed = 1
                forever = temp2
                control2 = 1
                control3 = control3 + 1
                Allnumber.push(element: forever)
            }
            if instead == 2
            {
                Mixed = -1
                forever = temp2
                control2 = 1
                control3 = control3 + 1
                Allnumber.push(element: forever)
            }
            temp1 = 0
            myOperator.push(element: Operator)
            myNumber.push(element: temp)
        }
    }
    @IBAction func subtract(_ sender: UIButton) {
        if output.text == ""
        {
            output.text = ""
            Operator = 2
        }
        else
        {
            temp = Double(output.text!)!
            output.text = ""
            Operator = 2
        }
        if output.text != ""
        {
            temp1 = 0
            if !myOperator.isEmpty()
            {
                instead = myOperator.pop()!
            }
            if !myNumber.isEmpty()
            {
                temp2 = myNumber.pop()!
            }
            if instead == 2
            {
                temp = temp2 - temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 1
            {
                temp = temp2 + temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 4
            {
                temp = temp2 / temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 3
            {
                temp = temp2 * temp
                output.text = "\(temp)"
                control2 = 1
            }
            myOperator.push(element: Operator)
            myNumber.push(element: temp)
        }
    }
    @IBAction func add(_ sender: UIButton) {
        if output.text == ""
        {
            output.text = ""
            Operator = 1
        }
        else
        {
            temp = Double(output.text!)!
            output.text = ""
            Operator = 1
        }
        if output.text != ""
        {
            temp1 = 0
            if !myOperator.isEmpty()
            {
                instead = myOperator.pop()!
            }
            if !myNumber.isEmpty()
            {
                temp2 = myNumber.pop()!
            }
            if instead == 1
            {
                temp = temp2 + temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 2
            {
                temp = temp2 - temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 4
            {
                temp = temp2 / temp
                output.text = "\(temp)"
                control2 = 1
            }
            if instead == 3
            {
                temp = temp2 * temp
                output.text = "\(temp)"
                control2 = 1
            }
            myOperator.push(element: Operator)
            myNumber.push(element: temp)
        }
    }
    
    @IBAction func equel(_ sender: UIButton) {
        if output.text! == ""
        {
            output.text = "0"
        }
        else if Operator == 1
        {
            if Mixed == 1
            {
                temp = temp + Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                
                output.text = "\(temp)"
            }
            else if Mixed == -1
            {
                temp = -temp + Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else
            {
                temp = temp + Double(output.text!)!
                output.text = "\(temp)"
            }
        }
        else if Operator == 2
        {
            if Mixed == 1
            {
                temp = temp - Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else if Mixed == -1
            {
                temp = -temp - Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else
            {
                temp = temp - Double(output.text!)!
                output.text = "\(temp)"
            }
        }
        else if Operator == 3
        {
            if Mixed == 1
            {
                temp = temp * Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else if Mixed == -1
            {
                temp = -temp * Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else
            {
                temp = temp * Double(output.text!)!
                output.text = "\(temp)"
            }
        }
        else if Operator == 4
        {
            if Mixed == 1
            {
                temp = temp / Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else if Mixed == -1
            {
                temp = -temp / Double(output.text!)!
                for _ in 1...control3
                {
                    temp = temp + Allnumber.pop()!
                }
                output.text = "\(temp)"
            }
            else
            {
                temp = temp / Double(output.text!)!
                output.text = "\(temp)"
            }
        }
        temp1 = 0
        temp2 = 0
        instead = 0
        control1 = 1
        Operator = 0
        control2 = 0
        control3 = 0
        Mixed = 0
        if !myNumber.isEmpty()
        {
            deal = myNumber.pop()!
        }
        if !myOperator.isEmpty()
        {
            deal1 = myOperator.pop()!
        }
        deal = 0;
        deal1 = 0
    }
    @IBAction func number1(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "1"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "1"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "1"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "1"
        }

    }
    @IBAction func number2(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "2"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "2"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "2"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "2"
        }

    }
    @IBAction func number3(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "3"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "3"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "3"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "3"
        }

    }
    @IBAction func number4(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "4"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "4"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "4"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "4"
        }

    }
    @IBAction func number5(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "5"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "5"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "5"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "5"
        }

    }
    @IBAction func number6(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "6"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "6"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "6"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "6"
        }

    }
    @IBAction func number7(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "7"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "7"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "7"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "7"
        }

    }
    @IBAction func number8(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "8"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "8"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "8"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "8"
        }

    }
    @IBAction func number9(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "9"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "9"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "9"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "9"
        }

    }
    @IBAction func number0(_ sender: UIButton) {
        if output.text == "0"
        {
            output.text = ""
            output.text = output.text! + "0"
        }
        else if control2 == 1
        {
            output.text = ""
            output.text = output.text! + "0"
            control2 = 0
        }
        else if control1 == 1
        {
            output.text = ""
            output.text = output.text! + "0"
            control1 = 0
        }
        else
        {
            output.text = output.text! + "0"
        }

    }
    @IBAction func point(_ sender: UIButton) {
        if temp1 == 1
        {
            
        }
        else if output.text == ""
        {
            output.text = "0."
        }
        else
        {
            output.text = output.text! + "."
            temp1 = 1
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

