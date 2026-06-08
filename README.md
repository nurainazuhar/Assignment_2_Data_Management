# MovieLens-100k Analysis using Apache Spark + Cassandra 🎬

---
## 📖 Project Overview

This project was developed for **STQD6324 Data Management Assignment 2**. The objective is to build a distributed data pipeline using **Apache Spark** and **Cassandra** to analyze the MovieLens 100K dataset.


## 🛠️ Software Environment

| Component          | Purpose                      | 
| ------------------ | ---------------------------- |
| Apache Hadoop HDFS | Distributed storage          |
| Apache Spark       | Distributed data processing  |
| Spark SQL          | Analytical querying          |
| Apache Cassandra   | NoSQL database storage       |
| Python             | Data pipeline implementation |
| Zeppelin Notebook  | Development environment      |

---

## 📂 Dataset

Dataset: MovieLens 100K

Files used:

* `u.data` – User movie ratings
* `u.user` – User demographic information
* `u.item` – Movie information and genres

Dataset Source:

https://grouplens.org/datasets/movielens/

---

## 🔄 Project Workflow

```text
MovieLens Dataset
       │
       ▼
Upload to HDFS
       │
       ▼
Create Spark RDDs
       │
       ▼
Convert to DataFrames
       │
       ▼
Data Cleaning & Preprocessing
       │
       ▼
Spark SQL Analytics
       │
       ▼
Write Results to Cassandra
       │
       ▼
Read Back for Validation
```

---

# 📊 Analytical Tasks

---

## Task (i): Average Rating for Each Movie

### Objective

Calculate the average rating received by every movie in the dataset.

### Method

* Join ratings data with movie titles.
* Group records by movie.
* Compute:

  * Average rating
  * Number of ratings

### Results
<p align="center">
  <a href="screenshots/task_i_output.png">
    <img src="screenshots/task_i_output.png" width="500">
  </a>
</p>


### Interpretation

Several movies achieved a perfect average rating of 5.0. However, these movies received very few ratings, making their averages less reliable indicators of overall popularity. Therefore, rating frequency should also be considered when evaluating movie quality.

---

## Task (ii): Top 10 Highest Rated Movies

### Objective

Identify the highest-rated movies based on average ratings.

### Top 10 Movies
<p align="center">
  <img src="screenshots/task_ii_output.png" width="700">
</p>

### Interpretation

The results reveal that several critically acclaimed films dominate the highest-rated list. Classic movies such as *Casablanca*, *12 Angry Men*, and *Rear Window* remain highly appreciated by users despite their age, which indicates enduring audience appeal.

---

## Task (iii): Favourite Genre of Active Users

### Objective

Identify users who rated at least 50 movies and determine their favourite genre.

### Results Summary

* Active Users Identified: **568 users**
* Favourite genres observed:

  * Drama
  * Comedy
  * Horror

<p align="center">
  <img src="screenshots/task_iii_output.png" width="700">
</p>

### Interpretation

**Drama** emerged as the most common favourite genre among active users. This suggests that users who engage heavily with the platform tend to consume a wide variety of dramatic content. **Comedy** also appeared frequently, indicating broad audience preference.

---

## Task (iv): Users Below 20 Years Old

### Objective

Identify all users younger than 20 years old.

### Results

* Total Users Below 20: **77 users**
<p align="center">
  <img src="screenshots/task_iv_output.png" width="600">
</p>

### Observation

The majority of users below 20 years old were students, indicating that younger audiences form an important segment of the MovieLens user base.

### Interpretation

The prevalence of students among younger users is expected due to their higher engagement with entertainment media and online recommendation systems.

---

## Task (v): Scientists Aged Between 30 and 40

### Objective

Identify users whose occupation is scientist and whose age falls between 30 and 40 years.

### Results

* Total Scientists Aged 30–40: **16 users**

<p align="center">
  <img src="screenshots/task_v_output.png" width="600">
</p>

### Interpretation

The scientist user group represents a relatively small proportion of the dataset. Most identified users were male, although female scientists were also represented within the selected age range.

---

# 🗄️ Cassandra Data Storage

The analytical outputs were stored in Cassandra for persistence and validation.

| Table           | Purpose                         |
| --------------- | ------------------------------- |
| avg_ratings     | Average movie ratings           |
| top_movies      | Top 10 highest-rated movies     |
| user_fav_genre  | Favourite genre of active users |
| young_users     | Users below 20 years old        |
| scientist_users | Scientists aged 30–40           |

After insertion, all Cassandra tables were read back into Spark DataFrames to verify successful storage.

---

# 📸 Screenshots

Screenshots of:

* HDFS file uploads
* Spark DataFrames
* Spark SQL outputs
* Cassandra validation queries
* Visualizations

are provided in the `screenshots/` directory.

---

# 🎯 Conclusion

This project successfully demonstrates the integration of Apache Spark and Cassandra for large-scale analytical processing. Using distributed computing techniques, the MovieLens dataset was transformed into meaningful insights regarding movie ratings, user preferences, demographic patterns, and genre interests. The workflow highlights how big data technologies can be combined to create scalable and efficient analytics pipelines.

