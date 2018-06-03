//Задача: Дано множество точек на двумерной плоскости. Точки заданы целыми числами.
//1) Необходимо определить четверть (К) плоскости, в которой содержится наибольшее число точек.
//2) В найденной четверти необходимо найти точку L, которая наименее удалено от начальной точки (0,0).
//3) Определить расстояние Р от точки до ближайшей оси (х или y).


import Foundation

var mass : [(x: Int,y : Int)] = [(-2, -4), (-2, 1), (3, 6), (-2, 1), (1, -2), (0, 2), (-2, -1), (-2, -4), (-2, 3), (-1, -3), (2, 2), (4, 6), (4, -2), (-5, 7), (6, 4), (6, 4), (6, 4), (6, 4), (6, 4), (6, 4), (1, 1)]

func checkStr(str: String?) -> (info : Bool, result : Int?)
{
    let num : Int?
    num = Int(str!)
    if num == nil
    {
        print("Error")
        return(false, nil)
    }

    return(true, num)
}

func quarterFinding(mass : [(x: Int, y: Int)] ) -> (quarter: Int, numQuarter: Int)
{
    var quarter : [Int] = [0, 0, 0, 0]

    for i in mass
    {
        if (i.x > 0 && i.y > 0) || (i.x == 0 && i.y > 0) || (i.x > 0 && i.y == 0)
        {
            quarter[0] = quarter[0] + 1
        }

        if (i.x < 0 && i.y > 0) || (i.x == 0 && i.y > 0) || (i.x < 0 && i.y == 0)
        {
            quarter[1] = quarter[1] + 1
        }

        if (i.x < 0 && i.y < 0) || (i.x == 0 && i.y < 0) || (i.x < 0 && i.y == 0)
        {
            quarter[2] = quarter[2] + 1
        }

        if (i.x > 0 && i.y < 0) || (i.x == 0 && i.y < 0) || (i.x > 0 && i.y == 0)
        {
            quarter[3] = quarter[3] + 1
        }
    }
    print("Информация по всем четвертям \(quarter)")
    var j = 1
    var max = (j, quarter[0])

    for i in quarter
    {
        if i > max.1
        {
            max = (j, i)
        }
        j = j + 1
    }
    print("Четверть и значение \(max)")
    return max
}

func locationDistance(mass : [(x: Int, y: Int)], num : Int ) -> Double
{
    var min = 0.0
    var temp : Double
    var flag = true
    var j = 0

    if num == 1
    {
        while flag
        {
            if (mass[j].0 > 0) && (mass[j].1 > 0)
            {
                flag = false
                min = pow(pow(Double(0 - mass[j].x), 2) + pow(Double(0 - mass[j].y), 2), 1/2)
            }
            j += 1
        }

        for i in mass
        {
            if (i.x > 0) && (i.y > 0)
            {
                temp = pow(pow(Double(0 - i.x), 2) + pow(Double(0 - i.y), 2), 1/2)

                if temp < min
                {
                    min = temp
                }
            }
        }
    }

    if num == 2
    {
        while flag
        {
            if (mass[j].0 < 0) && (mass[j].1 > 0)
            {
                flag = false
                min = pow(pow(Double(0 - mass[j].x), 2) + pow(Double(0 - mass[j].y), 2), 1/2)
            }
            j += 1
        }

        for i in mass
        {
            if (i.x < 0) && (i.y > 0)
            {
                temp = pow(pow(Double(0 - i.x), 2) + pow(Double(0 - i.y), 2), 1/2)

                if temp < min
                {
                    min = temp
                }
            }
        }
    }

    if num == 3
    {
        while flag
        {
            if (mass[j].0 < 0) && (mass[j].1 < 0)
            {
                flag = false
                min = pow(pow(Double(0 - mass[j].x), 2) + pow(Double(0 - mass[j].y), 2), 1/2)
            }
            j += 1
        }

        for i in mass
        {
            if (i.x < 0) && (i.y < 0)
            {
                temp = pow(pow(Double(0 - i.x), 2) + pow(Double(0 - i.y), 2), 1/2)

                if temp < min
                {
                    min = temp
                }
            }
        }
    }

    if num == 4
    {
        while flag
        {
            if (mass[j].0 > 0) && (mass[j].1 < 0)
            {
                flag = false
                min = pow(pow(Double(0 - mass[j].x), 2) + pow(Double(0 - mass[j].y), 2), 1/2)
            }
            j += 1
        }

        for i in mass
        {
            if (i.x > 0) && (i.y < 0)
            {
                temp = pow(pow(Double(0 - i.x), 2) + pow(Double(0 - i.y), 2), 1/2)

                if temp < min
                {
                    min = temp
                }
            }
        }
    }

    return min
}

func locationDistanceAxis(mass: [(Int, Int)]) -> (Int, (Int, Int))
{
    var el = mass[0]
    var dist = 0

    var min = abs(mass[0].0) < abs(mass[0].1)  ? abs(mass[0].0) : abs(mass[0].1)
    print(min)

    for i in mass
    {
        if (abs(i.0) < min) || (abs(i.1) < min)
        {
            el = i

            if abs(i.0) < min
            {
                dist = abs(i.0)
                min = abs(i.0)
            }
            else
            {
                dist = abs(i.1)
                min = abs(i.1)
            }
        }
    }
    return(dist, el)
}

var flag = true

var arr : [(x: Int, y: Int)] = mass

while flag
{
    print("Сделайте свой выбор")
    print("0 - выход \n1 - добавть точку \n2 - вывод всех точек \n3 - Определить четверть плоскости, в которой содержится наибольшее число точек \n4 - Определить расстояние от точки до ближайшей оси (х или y).")

    let choice = readLine()

    if (checkStr(str: choice).info) == true
    {
        let num = (checkStr(str: choice).result)!

        if num == 0
        {
            flag = false
            print("Досвидания!")
        }

        if num == 1
        {
            print("--------------------------")
            print("Введите x")
            let x = readLine()

            print("Введите y")
            let y = readLine()

            if (checkStr(str: x).info) && (checkStr(str: y).info)
            {
                arr.append(((checkStr(str: x).result)!, (checkStr(str: y).result)!))
            }
        }

        if num == 2
        {
            print(arr)
        }

        if num == 3
        {
            print("--------------------------")
            print(locationDistance(mass: arr, num: quarterFinding(mass: arr).quarter))
        }

        if num == 4
        {
            print(locationDistanceAxis(mass: mass))
        }
    }
    print("-------------------------------------------------------------------------------------------------------------------------------------")
}
