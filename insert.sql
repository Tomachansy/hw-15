
-- копируем уникальные значения в новые таблицы

INSERT INTO animal_types(type)
SELECT DISTINCT animal_type
FROM animals
ORDER BY animal_type;

INSERT INTO breeds(type)
SELECT DISTINCT breed
FROM animals
ORDER BY breed;

-- убираем пробелы в конце строки из colo1 и color2

UPDATE animals
SET color1 = trim(color1),
    color2 = trim(color2);

-- отсортировываем название цветов

CREATE TABLE test_color(type);

INSERT INTO test_color(type)
SELECT DISTINCT animals.color1
FROM animals;

INSERT INTO test_color(type)
SELECT DISTINCT animals.color2
FROM animals;

INSERT INTO colors(type)
SELECT DISTINCT test_color.type
FROM test_color
WHERE test_color.type IS NOT NULL
ORDER BY type;

DROP TABLE test_color;

-- копируем значения в основную таблицу new_animals

INSERT INTO new_animals (age_upon_outcome, animal_id, name, date_of_birth, color1_id, color2_id, animal_type_id, breed_id)
SELECT age_upon_outcome, animal_id, name, date_of_birth, color1, color2, animal_types.id, breeds.id
FROM animals
JOIN animal_types ON animals.animal_type = animal_types.type
JOIN breeds ON animals.breed = breeds.type;

UPDATE new_animals
SET color1_id = colors.id
FROM colors
WHERE color1_id = colors.type;

UPDATE new_animals
SET color2_id = colors.id
FROM colors
WHERE color2_id = colors.type;

-- копируем уникальные значения в таблицы outcome_subtype и outcome_type

INSERT INTO outcome_subtype(type)
SELECT DISTINCT animals.outcome_subtype
FROM animals
WHERE animals.outcome_subtype IS NOT NULL
ORDER BY outcome_subtype;

INSERT INTO outcome_type(type)
SELECT DISTINCT animals.outcome_type
FROM animals
WHERE animals.outcome_type IS NOT NULL
ORDER BY outcome_type;

-- копируем значения в таблицу outcomes

INSERT INTO outcomes(outcome_subtype_id, outcome_type_id, outcome_month, outcome_year)
SELECT outcome_subtype, outcome_type, outcome_month, outcome_year
FROM animals;

UPDATE outcomes
SET outcome_subtype_id = outcome_subtype.id
FROM outcome_subtype
WHERE outcome_subtype_id = outcome_subtype.type;

UPDATE outcomes
SET outcome_type_id = outcome_type.id
FROM outcome_type
WHERE outcome_type_id = outcome_type.type;