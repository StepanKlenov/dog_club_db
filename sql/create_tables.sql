-- ====== Таблица пород ======
CREATE TABLE Breeds (
    breed_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    min_height INT CHECK (min_height > 0),
    max_height INT CHECK (max_height >= min_height),
    color VARCHAR(50)
);

-- ====== Таблица владельцев ======
CREATE TABLE Owners (
    owner_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address TEXT
);

-- ====== Таблица собак ======
CREATE TABLE Dogs (
    dog_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    breed_id INT NOT NULL,
    owner_id INT,
    is_alive BOOLEAN DEFAULT TRUE,
    psych_score INT CHECK (psych_score BETWEEN 0 AND 100),
    FOREIGN KEY (breed_id) REFERENCES Breeds(breed_id),
    FOREIGN KEY (owner_id) REFERENCES Owners(owner_id)
);

-- ====== Таблица родителей ======
CREATE TABLE Parents (
    dog_id INT PRIMARY KEY,
    father_id INT,
    mother_id INT,
    FOREIGN KEY (dog_id) REFERENCES Dogs(dog_id),
    FOREIGN KEY (father_id) REFERENCES Dogs(dog_id),
    FOREIGN KEY (mother_id) REFERENCES Dogs(dog_id)
);

-- ====== Таблица болезней ======
CREATE TABLE Diseases (
    disease_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    treatment TEXT
);

-- ====== Таблица истории болезней ======
CREATE TABLE Disease_History (
    dog_id INT,
    disease_id INT,
    date_start DATE NOT NULL,
    date_end DATE,
    PRIMARY KEY (dog_id, disease_id, date_start),
    FOREIGN KEY (dog_id) REFERENCES Dogs(dog_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id),
    CHECK (date_end IS NULL OR date_end >= date_start)
);

-- ====== Таблица выставок ======
CREATE TABLE Exhibitions (
    dog_id INT,
    exhibition_date DATE NOT NULL,
    grade INT CHECK (grade BETWEEN 1 AND 5),
    medal VARCHAR(20),
    PRIMARY KEY (dog_id, exhibition_date),
    FOREIGN KEY (dog_id) REFERENCES Dogs(dog_id)
);
