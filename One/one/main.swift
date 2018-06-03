//Задание 0: Просто сделать калькулятор


func checkNum(strNum : String?) -> (Bool, Double?)
{
    let num : Double!
    num = Double(strNum!)

    if num == nil
    {
        print("Error num =  \(strNum!)")
        return (false, nil)
    }

    else
    {
        return (true, num)
    }
}

var flag = true

while flag
{
    print("Выбирите пункт: 0 выход, 1 сложить, 2 вычесть, 3 умножить, 4 поделить ")

    let choice = readLine()
    let choiceNum : Int!
    choiceNum = Int(choice!)

    if choiceNum == nil
    {
        print("Error choiceNum")
    }
    else
    {
        if choiceNum! == 0
        {
            print("Досвидания")
            flag = false
        }

        if choiceNum! == 1
        {
            print("One")
            let one = readLine()

            print("Two")
            let two = readLine()

            if checkNum(strNum: one).0 && checkNum(strNum: two).0
            {
                let total = (checkNum(strNum: one).1)! + (checkNum(strNum: two).1)!
                print(total)
            }
        }

        if choiceNum! == 2
        {
            print("One")
            let one = readLine()

            print("Two")
            let two = readLine()

            if checkNum(strNum: one).0 && checkNum(strNum: two).0
            {
                let total = (checkNum(strNum: one).1)! - (checkNum(strNum: two).1)!
                print(total)
            }
        }

        if choiceNum! == 3
        {
            print("One")
            let one = readLine()

            print("Two")
            let two = readLine()

            if checkNum(strNum: one).0 && checkNum(strNum: two).0
            {
                let total = (checkNum(strNum: one).1)! * (checkNum(strNum: two).1)!
                print(total)
            }
        }

        if choiceNum! == 4
        {
            print("One")
            let one = readLine()

            print("Two")
            let two = readLine()

            if checkNum(strNum: one).0 && checkNum(strNum: two).0
            {
                let total = (checkNum(strNum: one).1)! / (checkNum(strNum: two).1)!
                print(total)
            }
        }

        if (choiceNum! < 0) || (choiceNum! > 4)
        {
            print("Такого пункта нет")
        }
    }
    print("______________________________________________________________________")
}
