//Задание
//Необходимо разработать иерархическую структуру классов, позволяющую создавать два типа объектов –
//вектора и матрицы. Вектор представляет собой одномерный массив произвольной длины, матрица –
//двумерный массив произвольной размерности
//При этом с обоими типами объектов должны быть предусмотрены:
//Конструкторы (по умолчанию, с параметрами, копирующий);
//Проверка возможности сложения и умножения объектов
//(вектора и вектора, вектора и матрицы, матрицы и вектора, матрицы и матрицы);
//Вывод;
//Математические операторы (+, –, *, +=, –=, *=, copy) с объектами,
//а также умножение объектов на скаляр (*, *=);
//Указание. Структуру иерархии классов продумать самостоятельно.
//Основные требования:
//1)    Отсутствие дублирования кода. Весь основной код должен находиться в базовом классе.
//Класс-потомок (или классы-потомки) должен быть максимально «легким».
//2)    Однозначность интерпретации объекта. Т.е.
//должна отсутствовать возможность использования для вектора операций, характерных только для матрицы, и наоборот.


import Foundation

 class Base
{
    private var height : UInt
    private var width : UInt
    private var mass : [[Double]]

    init()
    {
        height = 0
        width = 0
        mass = []
    }
    
    init(height : UInt, width : UInt)
    {
        self.height = height
        self.width = width
        self.mass = Array(repeating: Array(repeating: 0.0, count: Int(self.width)), count: Int(self.height))
    }
    
    init(height : UInt, width : UInt, rand : Int)
    {
        self.height = height
        self.width = width
        self.mass = Array(repeating: Array(repeating: 0.0, count: Int(self.width)), count: Int(self.height))
        
        for i in 0..<height
        {
            for j in 0..<width
            {
                mass[Int(i)][Int(j)] = Double(arc4random() % UInt32(rand))
            }
        }
        
    }
    
    init(obj : Base)
    {
        self.height = obj.height
        self.width = obj.width
        self.mass = obj.mass
    }
    
    init(height : UInt, width : UInt, mass : [[Double]])
    {
        self.height = height
        self.width = width
        self.mass = mass
    }
    
    init(quad : UInt)
    {
        self.height = quad
        self.width = quad
        self.mass = Array(repeating: Array(repeating: 0.0, count: Int(self.width)), count: Int(self.height))
    }
    
    init(quad : UInt, rand : Int)
    {
        self.height = quad
        self.width = quad
        self.mass = Array(repeating: Array(repeating: 0.0, count: Int(self.width)), count: Int(self.height))
        
        for i in 0..<height
        {
            for j in 0..<width
            {
                mass[Int(i)][Int(j)] = Double(arc4random() % UInt32(rand))
            }
        }
    }
    
    init(quad : UInt, mass : [[Double]])
    {
        self.height = quad
        self.width = quad
        self.mass = mass
    }
    
    func checkSub(obj : Base) -> Bool
    {
        return (self.height == obj.height) && (self.width == obj.width)
    }
    
    func checkMul(obj : Base) -> Bool
    {
         return (self.width == obj.height)
    }
    
    func printObject()
    {
        for i in 0..<height
        {
            print(mass[Int(i)])
        }
        print()
    }
    
    func getHeight() -> UInt
    {
        return height
    }
    
    func getWidtht() -> UInt
    {
        return width
    }
    
    func getElement(i : Int , j : Int) -> Double
    {
        return mass[i][j]
    }
    
    func copyObject(obj : Base)
    {
        self.height = obj.height
        self.width = obj.width
        self.mass = obj.mass
    }
    
    static func += (obj1 : Base, obj2 : Base)
    {
        if obj1.checkSub(obj: obj2)
        {
            for i in 0..<obj1.getHeight()
            {
                for j in 0..<obj1.getWidtht()
                {
                    obj1.mass[Int(i)][Int(j)] += obj2.mass[Int(i)][Int(j)]
                }
            }
        }
    }
    
    static func -= (obj1 : Base, obj2 : Base)
    {
        if obj1.checkSub(obj: obj2)
        {
            for i in 0..<obj1.getHeight()
            {
                for j in 0..<obj1.getWidtht()
                {
                    obj1.mass[Int(i)][Int(j)] -= obj2.mass[Int(i)][Int(j)]
                }
            }
        }
    }
 
    static func + (obj1 : Base, obj2 : Base) -> Base
    {
        let temp = Base(obj: obj1)
        temp += obj2
        return temp
    }
    
    static func - (obj1 : Base, obj2 : Base) -> Base
    {
        let temp = Base(obj: obj1)
        temp -= obj2
        return temp
    }
    
    static func *= (obj : Base, skal : Double)
    {
        for i in 0..<obj.height
        {
            for j in 0..<obj.width
            {
                obj.mass[Int(i)][Int(j)] *= skal
            }
        }
    }
 
    static func * (obj : Base, skal : Double) -> Base
    {
        let temp = Base(obj: obj)
        temp *= skal
        return temp
    }
    
    static func * (skal : Double, obj : Base) -> Base
    {
        let temp = Base(obj: obj)
        temp *= skal
        return temp
    }
}


class Matrix : Base
{
    static func *= (obj1 : Matrix, obj2 : Base)
    {
        if obj1.checkMul(obj: obj2)
        {
            var temp = Array(repeating: Array(repeating: 0.0, count: Int(obj2.getWidtht())), count: Int(obj1.getHeight()))
            for i in 0..<obj1.getHeight()
            {
                for j in 0..<obj2.getWidtht()
                {
                    for k in 0..<obj1.getWidtht()
                    {
                        temp[Int(i)][Int(j)] += obj1.getElement(i: Int(i), j: Int(k)) * obj2.getElement(i: Int(k), j: Int(j))
                    }
                }
            }
            obj1.copyObject(obj: Matrix(height: obj1.getHeight(), width: obj2.getWidtht(), mass: temp))
        }
    }
    
    static func * (obj1 : Matrix, obj2 : Base) -> Matrix
    {
        let temp = Matrix(obj: obj1)
        temp *= obj2
        return temp
    }
}

class Vector: Base
{
    init(len : UInt)
    {
        super.init(height: 1, width: len)
    }
    
    init(len: UInt, rand : Int)
    {
        super.init(height: 1, width: len, rand: rand)
    }
    
    override init(obj: Base)
    {
        if obj.getHeight() == 1
        {
            super.init(obj: obj)
        }
        else
        {
            print("Error")
            super.init()
        }
    }

    override func checkMul(obj: Base) -> Bool
    {
        return (self.getWidtht() == obj.getWidtht()) && (self.getWidtht() == 3) == (obj.getWidtht() == 3)
    }
    
    static func *= (obj1 : Vector, obj2 : Base)
    {
        if obj1.checkMul(obj: obj2)
        {
            let temp = [[ obj1.getElement(i: 0, j: 1) * obj2.getElement(i: 0, j: 2) - obj1.getElement(i: 0, j: 2) * obj2.getElement(i: 0, j: 1),
                   -1.0 * obj1.getElement(i: 0, j: 0) * obj2.getElement(i: 0, j: 2) - obj1.getElement(i: 0, j: 2) * obj2.getElement(i: 0, j: 0),
                          obj1.getElement(i: 0, j: 0) * obj2.getElement(i: 0, j: 1) - obj1.getElement(i: 0, j: 1) * obj2.getElement(i: 0, j: 0) ]]

            obj1.copyObject(obj: Base(height: 1, width: 3, mass: temp))
        }
    }
    
    static func * (obj1 : Vector, obj2 : Base) -> Vector
    {
        let temp = Vector(obj: obj1)
        temp *= obj2
        return temp
    }
}
