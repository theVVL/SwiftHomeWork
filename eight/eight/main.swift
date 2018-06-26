//Задание: реализвать обычный стек

class Stack
{
    private var arr : [Int]
    
    init()
    {
        arr = []
    }
    
    func PrintSteck()
    {
        print(arr)
    }

    func Push(Element : Int)
    {
        arr.append(Element)
    }
    
    func Pop() -> Int!
    {
        if arr.count == 0
        {
            return nil
        }
        else
        {
            let num = arr[arr.count - 1]
            arr.remove(at: arr.count - 1)
            return num
        }
    }
    
    func Empty()
    {
        if arr.count == 0
        {
            print("Empty")
        }
        else
        {
            print("No Empty")
        }
    }
}
