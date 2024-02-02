const mongoose = require('mongoose');

mongoose.connect('mongodb://127.0.0.1:27017/fruitsDB');
var connection = mongoose.connection;
const fruitSchema = new mongoose.Schema({
    name: String,
    rating: Number,
    review: String
})

const Fruit = mongoose.model("fruit", fruitSchema);

const fruit = Fruit({
    name: "Apple",
    rating: 10,
    review: "Green apples all day!!"
});

fruit.save();
const PersonSchema = new mongoose.Schema({
    name: String,
    age: Number,
})

const Person = mongoose.model("Person", PersonSchema);

const person = Person({
    name: "John",
    age: 23,
});

// person.save();

const kiwi = Fruit({
    name: "Kiwi",
    rating: 6,
    review: "Standard"
});
const banana = Fruit({
    name: "Banana",
    rating: 8,
    review: "Good stuff"
});
const orange = Fruit({
    name: "Orange",
    rating: 9,
    review: "Great fruit!"
});

// Fruit.insertMany([kiwi, orange, banana],j
// );
console.log(Person.find()
)
