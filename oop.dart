import 'dart:io';

// Interface for a printable object
abstract class Printable {
  void printInfo();
}

// Base class
class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void makeSound() {
    print('Some sound');
  }
}

// Class Dog extending Animal and implementing Printable
class Dog extends Animal implements Printable {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);


//Overriding an inherited method
  @override
  void makeSound() {
    print('Woof!');
  }

  @override
  void printInfo() {
    print('Dog: $name, Age: $age, Breed: $breed');
  }
}

void main() {
  // Creating an instance of Dog
  var dog = Dog('Buddy', 3, 'Labrador');

  dog.makeSound();

  dog.printInfo();

  // Reading data from a file to create instances
  var file = File('dog_data.txt'); //this is a non-existent file I used for the sake of demonstrating loops.
  var lines = file.readAsLinesSync();

  // List to hold Dog objects
  List<Dog> dogs = [];

  // Looping
  for (var line in lines) {
    var parts = line.split(',');
    if (parts.length == 3) {
      var name = parts[0];
      var age = int.tryParse(parts[1]);
      var breed = parts[2];
      if (age != null) {
        var newDog = Dog(name, age, breed);
        dogs.add(newDog);
      }
    }
  }

  // Printing info of dogs created from file
  print('\nDogs created from file:');
  for (var dog in dogs) {
    dog.printInfo();
  }
}
