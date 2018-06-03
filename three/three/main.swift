//Задание. Сделать программу с возможностью создания массива из N эллементов, добавления
//еще эллементов, отсортиовать данный массив, выход из программы, вывод массива.


import Foundation

func checkStr(str : String?) -> (status : Bool, num : Int?)
{
    let temp = Int(str!)
    if temp == nil
    {
        return (false, nil)
    }
    return (true, temp)
}

var flag = true
var mass : [Int] = []

while flag
{
    print("0 - выход\n1 - задать размер массива\n2 - вывод массива \n3 - задать потолок значений \n4 - добавить эллемент в конец \n5 - отсортировать массив")
    
    let chuice = readLine()
    
    if (checkStr(str: chuice).status != false)
    {
        if checkStr(str: chuice).num == 0
        {
            print("досвидания")
            flag = false
        }
        
        if checkStr(str: chuice).num == 1
        {
            if mass.isEmpty == true
            {
                print("введите размер массива")
                let num = readLine()
        
                if checkStr(str: num).status == true
                {
                    mass = Array(repeating: 0, count: checkStr(str: num).num!)
                }
            }
            else
            {
                print("Массив уже существует")
            }
        }
        
        if checkStr(str: chuice).num == 2
        {
            print(mass)
        }
        
        if checkStr(str: chuice).num == 3
        {
            print("введите значение")
            let rand = readLine()
            
            if checkStr(str: rand).status == true
            {
                for i in 0..<mass.count
                {
                    mass[i] = Int(arc4random() % UInt32(checkStr(str: rand).num!))
                }
            }
        }
        
        if checkStr(str: chuice).num == 4
        {
            print("введите эллемент")
            let el = readLine()
            
            if checkStr(str: el).status == true
            {
               mass.append(checkStr(str: el).num!)
            }
        
        }

        if checkStr(str: chuice).num == 5
        {
            for i in 0..<mass.count
            {
                for j in 0..<mass.count
                {
                    if mass[i] > mass[j]
                    {
                        let temp = mass[i]
                        mass[i] = mass[j]
                        mass[j] = temp
                    }
                }
            }
        }
    }

    else
    {
        print("в выборе  меню допущенна  ошибка")
    }
    print("------------------------------------------------------------------------------------------------------------------------------------------------")
}
