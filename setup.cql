-- ============================================================
-- Cassandra Setup Script for MovieLens 100k Pipeline
-- STQD6324 Data Management Assignment 2
-- Run with: cqlsh < setup.cql
-- ============================================================

-- Create keyspace
CREATE KEYSPACE IF NOT EXISTS movielens 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor':'1'} 
AND durable_writes = true;

USE movielens;

-- Task (i): Average rating per movie
CREATE TABLE IF NOT EXISTS avg_ratings (
    movie_id int,
    title text,
    avg_rating double,
    num_ratings bigint,
    PRIMARY KEY (movie_id)
);

-- Task (ii): Top 10 highest rated movies
CREATE TABLE IF NOT EXISTS top_movies (
    movie_id int,
    title text,
    avg_rating double,
    PRIMARY KEY (movie_id)
);

-- Task (iii): Favourite genre of active users
CREATE TABLE IF NOT EXISTS user_fav_genre (
    user_id int,
    favourite_genre text,
    rating_count bigint,
    PRIMARY KEY (user_id)
);

-- Task (iv): Users under 20 years old
CREATE TABLE IF NOT EXISTS young_users (
    user_id int,
    age int,
    gender text,
    occupation text,
    zip text,
    PRIMARY KEY (user_id)
);

-- Task (v): Scientists aged 30-40
CREATE TABLE IF NOT EXISTS scientist_users (
    user_id int,
    age int,
    gender text,
    occupation text,
    zip text,
    PRIMARY KEY (user_id)
);
