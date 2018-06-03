//Задание на двумерные массивы 0 - выход 1- задать размер 2 - вывод массива 3 - задать потолок значений 4 - сортировка


import Foundation

func checkStr(str : String?) -> (ststus : Bool, num : Int?)
{
    let num : Int? = Int(str!)
    
    if num == nil
    {
        return (false, nil)
    }
    
    return (true, num)
}

var mass : [[Int]]  = []

var flag = true

while flag
{
    let choise = readLine()
    
    if checkStr(str: choise).ststus == true
    {
        switch checkStr(str: choise).num!
        {
        case 0:
            print("Bay")
            flag = false
            
        case 1:
            if mass.isEmpty == true
            {
                print("Height")
                let height = readLine()
            
                print("Weith")
                let width = readLine()
            
            
                if (checkStr(str: height).ststus == true) && (checkStr(str: width).ststus == true)
                {
                    mass = Array(repeating: Array(repeating: 0, count: checkStr(str: width).num!), count: checkStr(str: height).num!)
                }
                else
                {
                    print("Error height or width")
                }
            }
            else
            {
                print("mass no empty")
            }
        
        case 2:
            for i in 0..<mass.count
            {
                print(mass[i])
            }
            
        case 3:
            print("Rand")
            let randNum = readLine()
            
            if checkStr(str: randNum).ststus == true
            {
                for i in 0..<mass.count
                {
                    for j in 0..<mass[i].count
                    {
                        mass[i][j] = Int(arc4random() % UInt32(abs(checkStr(str: randNum).num!)))
                    }
                }
            }
            else
            {
                print("Error randNum")
            }
        case 4:
            for i in 0..<mass.count
            {
                for j in 0..<mass[i].count
                {
                    for k in 0..<mass.count
                    {
                        for l in 0..<mass[k].count
                        {
                            if mass[k][l] < mass[i][j]
                            {
                                let temp = mass[i][j]
                                mass[i][j] = mass[k][l]
                                mass[k][l] = temp
                            }
                        }
                    }
                }
            }
        default:
            print("No")
        }
    }
    else
    {
        print("Error choice")
    }
    
}
