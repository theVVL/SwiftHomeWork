//Задание
//Составить описание класса для объектов прямоугольных матриц, задаваемых массивом вещественных чисел типа double,
//располагающегося в памяти по строкам. Компоненты матрицы должны быть скрыты (инкапсулированы) в объекте.
//Предусмотреть применение конструкторов:
//а) по умолчанию;
//б) для инициализации квадратной матрицы заданного размера с заданными компонентами;
//в) для инициализации прямоугольной матрицы заданных размеров с заданными компонентами;
//г) копирования.
//Организовать в конструкторах и деструкторе вывод на экран информационных сообщений, например,
//«Конструктор матрицы ХХХ», «Деструктор матрицы ХХХ» и т.д. Вместо «ХХХ» указывать некоторый уникальный идентификатор матрицы.
//I. С помощью функций-элементов класса обеспечить:
//1) проверку возможности умножения двух матриц;
//2) проверку возможности сложения двух матриц;
//3) поиск максимального элемента матрицы;
//4) поиск минимального элемента матрицы.
//II. С помощью операторов-элементов класса обеспечить:
//1) математические действия над матрицами A и B без получения новых матриц, т.е. переопределить операторы
//а) (func copy);
//б) A += B;
//в) A –= B;
//г) A *= B;
//д) а также умножение матрицы на скаляр k.
//III. C помощью внешних операторов обеспечить:
//1) двуместные операции над матрицами A и B с получением новой матрицы C:
//а) сложение (C = A + B);
//б) вычитание (C = A – B);
//в) произведение (С = A * B);
//г) а также умножение матрицы на скаляр k.
//2) вывод на экран матрицы.
//Выполнению операций сложения, вычитания и умножения матриц должна предшествовать проверка возможности их выполнения над данными объектами.


import Foundation

class Matrix
{
    private var height : UInt
    private var width : UInt
    private var mass : [[Double]]
    
    init()
    {
        height = 0
        width = 0
        mass = []
        print("Constructor default")
    }
    
    init(height : UInt, width : UInt)
    {
        self.height = height
        self.width = width
        mass = Array(repeating: Array(repeating: 0, count: Int(self.width)), count: Int(self.height))
        print("Constructor parametrs")
    }
    
    init(height : UInt, width : UInt, rand : UInt)
    {
        self.height = height
        self.width = width
        mass = Array(repeating: Array(repeating: 0, count: Int(self.width)), count: Int(self.height))
        
        for i in 0..<self.height
        {
            for j in 0..<self.width
            {
                mass[Int(i)][Int(j)] = Double(arc4random() % UInt32(rand))
            }
        }
        print("Constructor rand")
    }
    
    init(quad : UInt, rand : UInt)
    {
        self.height = quad
        self.width = quad
        mass = Array(repeating: Array(repeating: 0, count: Int(self.width)), count: Int(self.height))
        
        for i in 0..<self.height
        {
            for j in 0..<self.width
            {
                mass[Int(i)][Int(j)] = Double(arc4random() % UInt32(rand))
            }
        }
        print("Constructor rand quad")
    }
    
    init(quad : UInt)
    {
        self.height = quad
        self.width = quad
        mass = Array(repeating: Array(repeating: 0, count: Int(self.width)), count: Int(self.height))
        
        for i in 0..<self.height
        {
            for j in 0..<self.width
            {
                mass[Int(i)][Int(j)] = 0.0
            }
        }
        print("Constructor quad")
    }
    
    init(obj : Matrix)
    {
        self.height = obj.height
        self.width = obj.width
        self.mass = obj.mass
        print("Constructor copy")
    }
    
    deinit
    {
        mass = []
        print("Destructor")
    }
    
    func printObject()
    {
        for i in 0..<Int(height)
        {
            print(mass[i])
        }
        print()
    }
    
    func checkSub(obj : Matrix) -> Bool
    {
        return (self.height == obj.height) && (self.width == obj.width)
    }
    
    func checkMul(obj : Matrix) -> Bool
    {
        return (self.width == obj.height)
    }
    
    func searchMin() -> Double
    {
        if mass.count != 0
        {
            var min = mass[0][0]
            
            for i in 0..<self.height
            {
                for j in 0..<self.width
                {
                    if mass[Int(i)][Int(j)] < min
                    {
                        min = mass[Int(i)][Int(j)]
                    }
                }
            }
            return min
        }
        return 0
    }
    
    func searchMax() -> Double
    {
        if mass.count != 0
        {
            var max = mass[0][0]
            
            for i in 0..<self.height
            {
                for j in 0..<self.width
                {
                    if mass[Int(i)][Int(j)] > max
                    {
                        max = mass[Int(i)][Int(j)]
                    }
                }
            }
            return max
        }
        return 0
    }
    
    func getHeight() -> UInt
    {
        return height
    }
    
    func getWidth() -> UInt
    {
        return width
    }
    
    func matrixCopy(obj : Matrix)
    {
        self.height = obj.height
        self.width = obj.width
        mass = Array(repeating: Array(repeating: 0, count: Int(self.width)), count: Int(self.height))
        
        for i in 0..<self.height
        {
            for j in 0..<self.width
            {
                mass[Int(i)][Int(j)] = obj.mass[Int(i)][Int(j)]
            }
        }
    }
    
    static func += (obj1 : Matrix, obj2 : Matrix)
    {
        if obj1.checkSub(obj: obj2)
        {
            for i in 0..<obj1.height
            {
                for j in 0..<obj2.width
                {
                   obj1.mass[Int(i)][Int(j)] += obj2.mass[Int(i)][Int(j)]
                }
            }
        }
    }
    
    static func -= (obj1 : Matrix, obj2 : Matrix)
    {
        if obj1.checkSub(obj: obj2)
        {
            for i in 0..<obj1.height
            {
                for j in 0..<obj2.width
                {
                    obj1.mass[Int(i)][Int(j)] -= obj2.mass[Int(i)][Int(j)]
                }
            }
        }
    }

    static func *= (obj : Matrix, skal : Double)
    {
        for i in 0..<obj.height
        {
            for j in 0..<obj.width
            {
                obj.mass[Int(i)][Int(j)] *= skal
            }
        }
    }
    
    static func *= (obj1 : Matrix, obj2 : Matrix)
    {
        if obj1.checkMul(obj: obj2)
        {
            var temp = Array(repeating: Array(repeating: 0.0, count: Int(obj2.width)), count: Int(obj1.height))
            for i in 0..<obj1.height
            {
                for j in 0..<obj2.width
                {
                    for k in 0..<obj1.width
                    {
                        temp[Int(i)][Int(j)] += obj1.mass[Int(i)][Int(k)] * obj2.mass[Int(k)][Int(j)]
                    }
                }
            }
            obj1.mass = temp
            obj1.width = obj2.width
        }
    }
}

func + (obj1 : Matrix, obj2 : Matrix) -> Matrix
{
    let temp = Matrix(obj: obj1)
    temp += obj2
    return temp
}

func - (obj1 : Matrix, obj2 : Matrix) -> Matrix
{
    let temp = Matrix(obj: obj1)
    temp -= obj2
    return temp
}

func * (obj1 : Matrix, obj2 : Matrix) -> Matrix
{
    let temp = Matrix(obj: obj1)
    temp *= obj2
    return temp
}

func * (obj : Matrix, skal : Double) -> Matrix
{
    let temp = Matrix(obj: obj)
    temp *= skal
    return temp
}

func * (skal : Double, obj : Matrix) -> Matrix
{
    let temp = Matrix(obj: obj)
    temp *= skal
    return temp
}
