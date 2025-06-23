-- 1. Table: title_basics
CREATE TABLE title_basics (
  tconst VARCHAR(12) PRIMARY KEY,
  title_type VARCHAR(20),
  primary_title VARCHAR(500),
  original_title VARCHAR(500),
  is_adult BOOLEAN,
  start_year INTEGER,
  end_year INTEGER,
  runtime_minutes INTEGER,
  genres VARCHAR(100)
);

COPY title_basics
FROM PROGRAM 'zcat /import/title.basics.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- 2. Table: title_ratings
CREATE TABLE title_ratings (
  tconst VARCHAR(12) PRIMARY KEY,
  average_rating FLOAT,
  num_votes INTEGER
);

COPY title_ratings
FROM PROGRAM 'zcat /import/title.ratings.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- 3. Table: title_episode
CREATE TABLE title_episode (
  tconst VARCHAR(12) PRIMARY KEY,
  parent_tconst VARCHAR(12),
  season_number INTEGER,
  episode_number INTEGER
);

COPY title_episode
FROM PROGRAM 'zcat /import/title.episode.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- 4. Table: title_crew
CREATE TABLE title_crew (
  tconst VARCHAR(12) PRIMARY KEY,
  directors TEXT,
  writers TEXT
);

COPY title_crew
FROM PROGRAM 'zcat /import/title.crew.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- 5. Table: title_akas
CREATE TABLE title_akas (
  title_id VARCHAR(12),
  ordering INTEGER,
  title TEXT,
  region VARCHAR(10),
  language VARCHAR(20),
  types TEXT,
  attributes TEXT,
  is_original_title BOOLEAN
);

COPY title_akas
FROM PROGRAM 'zcat /import/title.akas.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- 6. Table: name_basics
CREATE TABLE name_basics (
  nconst VARCHAR(12) PRIMARY KEY,
  primary_name VARCHAR(255),
  birth_year INTEGER,
  death_year INTEGER,
  primary_profession TEXT,
  known_for_titles TEXT
);

COPY name_basics
FROM PROGRAM 'zcat /import/name.basics.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');

-- 7. Table: title_principals
CREATE TABLE title_principals (
  tconst VARCHAR(12),
  ordering INTEGER,
  nconst VARCHAR(12),
  category VARCHAR(50),
  job TEXT,
  characters TEXT
);

COPY title_principals
FROM PROGRAM 'zcat /import/title.principals.tsv.gz'
WITH (FORMAT csv, DELIMITER E'\t', HEADER, NULL '\N', QUOTE E'\001');


-- 8. Execute queries in TP_01