class Animal {
    String sound() {
        return "Unkown";
    }
}

class Dog extends Animal {
    @Override
    String sound() {
        return "Woof";
    }
}

class Cat extends Animal {
    @Override
    String sound() {
        return "Meow";
    }
}

void main() {
    Animal[] animals = {
            new Dog(),
            new Cat(),
            new Animal()
    };

    for (Animal animal : animals) {
        System.out.println(animal.sound());
    }
}