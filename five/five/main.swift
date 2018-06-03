//Задание 
//Составить описание класса для объектов-векторов, задаваемых координатами концов в трехмерном пространстве, считая, что компоненты векторов представлены вещественными
//числами типа double. Компоненты векторов должны быть скрыты (инкапсулированы) в объекте. Предусмотреть в классе деструктор и, как минимум, два конструктора:
//а)    для инициализации векторов нулевыми компонентами и
//б)    заданным набором компонентов.
//Можно использовать параметры по умолчанию для сокращения количества конструкторов.
//Организовать в конструкторах и деструкторе вывод на экран информационных сообщений, например, «Конструктор вектора ХХХ», «Деструктор вектора ХХХ» и т.д.
//Вместо «ХХХ» указывать некоторый уникальный идентификатор вектора.
//I.    С помощью функций-элементов класса обеспечить
//1) доступ к элементам вектора (чтение/запись);
//2) вычисление модуля вектора;
//3) копирование вектора;
//4) умножение вектора на скаляр;
//5) нормировку вектора (получение вектора единичной длины).
//II.    C помощью внешних и функций-элементов обеспечить двуместные операции над векторами A и B:
//1)    с получением нового вектора C:
//а) сложение (C = A + B);
//б) вычитание (C = A – B);
//в) векторное произведение (С = A × B);
//2)    с получением скалярных величин:
//а) скалярного произведения двух векторов;
//б) косинуса и синуса угла между двумя векторами;
//в) величины угла в градусах между векторами в пределах [–180º, 180º]


import Foundation

class Vector
{
    private var x : Double
    private var y : Double
    private var z : Double
    
    init()
    {
        x = 0.0
        y = 0.0
        z = 0.0
        print("Constuctor default")
    }
    
    init(x : Double, y : Double, z : Double)
    {
        self.x = x
        self.y = y
        self.z = z
        print("Constuctor parameters")
    }
    
    init(obj : Vector)
    {
        self.x = obj.x
        self.y = obj.y
        self.z = obj.z
        print("Constuctor copy")
    }
    
    deinit
    {
        print("Destructor")
    }
    
    func printObject()
    {
        print("x = \(x), y = \(y), z = \(z) \n")
    }
    
    func getX() -> Double
    {
        return x
    }
    
    func getY() -> Double
    {
        return y
    }
    
    func getZ() -> Double
    {
        return z
    }
    
    func setX(x : Double)
    {
        self.x = x
    }
    
    func setY(y : Double)
    {
        self.y = y
    }
    
    func setZ(z : Double)
    {
        self.z = z
    }
    
    func module() -> Double
    {
        return sqrt(x * x + y * y + z * z)
    }
  
    func vectorCopy(obj : Vector)
    {
        self.x = obj.x
        self.y = obj.y
        self.z = obj.z
    }
 
    func skalMul(skal : Double) -> Vector
    {
        self.x *= skal
        self.y *= skal
        self.z *= skal
        return self
    }

    func sum(obj : Vector) -> Vector
    {
       return Vector(x: (self.x + obj.x), y: (self.y + obj.y), z: (self.z + obj.z))
    }
 
    func res(obj : Vector) -> Vector
    {
        return Vector(x: (self.x - obj.x), y: (self.y - obj.y), z: (self.z - obj.z))
    }
    
    func mul(obj : Vector) -> Vector
    {
        return Vector(x: (self.y * obj.z -  self.z * obj.y), y: (self.z * obj.x -  self.x * obj.z), z: (self.x * obj.y -  self.y * obj.x))
    }
}

func sum(obj1 : Vector, obj2 : Vector) -> Vector
{
    return Vector(x: (obj1.getX() + obj2.getX()), y: (obj1.getY() + obj2.getY()), z: (obj1.getZ() + obj2.getZ()))
}

func res(obj1 : Vector, obj2 : Vector) -> Vector
{
    return Vector(x: (obj1.getX() - obj2.getX()), y: (obj1.getY() - obj2.getY()), z: (obj1.getZ() - obj2.getZ()))
}

func mul(obj1 : Vector, obj2 : Vector) -> Vector
{
    return Vector(x: (obj1.getY() * obj2.getZ() - obj1.getZ() * obj2.getY()), y: (obj1.getZ() * obj2.getX() - obj1.getX() * obj2.getZ()), z: (obj1.getX() * obj2.getY() - obj1.getY() * obj2.getX()))
}

func skalProd(obj1 : Vector, obj2 : Vector) -> Double
{
    return (obj1.getX() * obj2.getX() + obj1.getY() * obj2.getY() + obj1.getZ() * obj2.getZ())
}

func cosVec(obj1 : Vector, obj2 : Vector) -> Double
{
    return (skalProd(obj1: obj1, obj2: obj2)) / (obj1.module() * obj2.module())
}

func sinVec(obj1 : Vector, obj2 : Vector) -> Double
{
    return sqrt(1 - pow(cosVec(obj1: obj1, obj2: obj2), 2.0))
}

func angleVec(obj1 : Vector, obj2 : Vector) -> Double
{
    return atan2(sinVec(obj1: obj1, obj2: obj2), cosVec(obj1: obj1, obj2: obj2)) * 1/180 * Double.pi
}
