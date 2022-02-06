
CREATE TABLE animal_types(
    id              INTEGER PRIMARY KEY,
    type            VARCHAR
);

CREATE TABLE breeds(
    id              INTEGER PRIMARY KEY,
    type            VARCHAR
);

CREATE TABLE colors(
    id              INTEGER PRIMARY KEY,
    type            VARCHAR
);

CREATE TABLE new_animals
(
    id               INTEGER PRIMARY KEY,
    age_upon_outcome VARCHAR,
    animal_id        VARCHAR,
    animal_type_id   INTEGER,
    name             VARCHAR,
    breed_id         INTEGER,
    color1_id        INTEGER,
    color2_id        INTEGER,
    date_of_birth    DATE,
    FOREIGN KEY (animal_type_id) REFERENCES animal_types(id),
    FOREIGN KEY (breed_id) REFERENCES breeds(id),
    FOREIGN KEY (color1_id) REFERENCES colors(id),
    FOREIGN KEY (color2_id) REFERENCES colors(id)
);

CREATE TABLE outcome_subtype(
    id              INTEGER PRIMARY KEY,
    type VARCHAR
);

CREATE TABLE outcome_type(
    id              INTEGER PRIMARY KEY,
    type    VARCHAR
);

CREATE TABLE outcomes(
    id                  INTEGER PRIMARY KEY,
    outcome_subtype_id  INTEGER,
    outcome_type_id     INTEGER,
    outcome_month       INTEGER,
    outcome_year        INTEGER,
    FOREIGN KEY (id) REFERENCES new_animals(id),
    FOREIGN KEY (outcome_subtype_id) REFERENCES outcome_subtype(id),
    FOREIGN KEY (outcome_type_id) REFERENCES outcome_type(id)
);


