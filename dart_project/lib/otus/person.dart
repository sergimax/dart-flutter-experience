class Person {
  final String name;
  final int id;

  // Приватный конструктор 
  // Можно использовать для синглтонов - единственного экземпляра класса
  // Person._(this.id, this.name);


  Person(this.id, this.name);

  // Именованный конструктор
  Person.createWithName(this.name): id = 0;

  // С редиректом на другой на конструктор
  Person.redirected(String name): this(1,name);
}