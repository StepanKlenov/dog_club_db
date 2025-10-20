CREATE TABLE Dish_Types (
    dish_type_id INT PRIMARY KEY,
    type_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Dishes (
    dish_id INT PRIMARY KEY,
    dish_name VARCHAR(100) NOT NULL,
    price DECIMAL(8,2) CHECK (price > 0),
    dish_type_id INT NOT NULL,
    FOREIGN KEY (dish_type_id) REFERENCES Dish_Types(dish_type_id)
);

CREATE TABLE Components (
    component_id INT PRIMARY KEY,
    component_name VARCHAR(100) UNIQUE NOT NULL,
    calories INT DEFAULT 0 CHECK (calories >= 0),
    price DECIMAL(8,2) CHECK (price >= 0),
    weight DECIMAL(6,2) CHECK (weight > 0)
);

CREATE TABLE Dish_Composition (
    dish_id INT,
    component_id INT,
    PRIMARY KEY (dish_id, component_id),
    FOREIGN KEY (dish_id) REFERENCES Dishes(dish_id) ON DELETE CASCADE,
    FOREIGN KEY (component_id) REFERENCES Components(component_id)
);

CREATE TABLE Microelements (
    microelement_id INT PRIMARY KEY,
    microelement_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Component_Composition (
    component_id INT,
    microelement_id INT,
    amount_per_100g DECIMAL(6,2) CHECK (amount_per_100g >= 0),
    PRIMARY KEY (component_id, microelement_id),
    FOREIGN KEY (component_id) REFERENCES Components(component_id),
    FOREIGN KEY (microelement_id) REFERENCES Microelements(microelement_id)
);

CREATE TABLE Daily_Microelement_Norms (
    microelement_id INT PRIMARY KEY,
    amount_mg DECIMAL(6,2) CHECK (amount_mg > 0),
    FOREIGN KEY (microelement_id) REFERENCES Microelements(microelement_id)
);



