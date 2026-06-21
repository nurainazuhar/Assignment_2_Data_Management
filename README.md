# MovieLens-100k Analysis using Apache Spark + Cassandra 🎬

![Python](https://img.shields.io/badge/Python-2.7-blue)
![Apache Spark](https://img.shields.io/badge/Spark-2.3.0-orange)
![Apache Cassandra](https://img.shields.io/badge/Cassandra-3.11-blue)
![HDFS](https://img.shields.io/badge/HDFS-2.6.5-yellow)
![Zeppelin](https://img.shields.io/badge/Zeppelin-0.7.3-red)
![Status](https://img.shields.io/badge/Assignment-Completed-success)

<p align="center">
  <b>Distributed MovieLens Analytics Pipeline</b><br>
  <sub>HDFS → Apache Spark → Spark SQL → Apache Cassandra → Validation</sub>
</p>

---

<a id="project-overview"></a>

## 📖 Project Overview

This project was developed for **STQD6324 Data Management Assignment 2**. The objective is to build a distributed data pipeline using **Apache Spark** and **Cassandra** to analyze the MovieLens 100K dataset.

---

<a id="quick-navigation"></a>

## 🚀 Quick Navigation

<p align="center">
  <a href="#software-environment">Environment</a> •
  <a href="#dataset">Dataset</a> •
  <a href="#project-workflow">Workflow</a> •
  <a href="#repository-structure">Repository</a> •
  <a href="#analytical-tasks">Tasks</a> •
  <a href="#cassandra-data-storage">Cassandra</a> •
  <a href="#reproducibility">Reproducibility</a> •
  <a href="#conclusion">Conclusion</a>
</p>

<br>

| Task | Analysis | Method | Output | Visualization | Discussion |
|------|----------|--------|--------|---------------|------------|
| 🎬 Task (i) | Average rating for each movie | [Method](#method-i) | [Result](#result-i) | [Visual](#visual-i) | [Interpretation](#interpretation-i) |
| ⭐ Task (ii) | Top 10 highest rated movies | [Method](#method-ii) | [Result](#result-ii) | [Visual](#visual-ii) | [Interpretation](#interpretation-ii) |
| 🎭 Task (iii) | Favourite genre of active users | [Method](#method-iii) | [Result](#result-iii) | [Visual](#visual-iii) | [Interpretation](#interpretation-iii) |
| 👦 Task (iv) | Users below 20 years old | [Method](#method-iv) | [Result](#result-iv) | [Visual](#visual-iv) | [Interpretation](#interpretation-iv) |
| 🔬 Task (v) | Scientists aged 30–40 | [Method](#method-v) | [Result](#result-v) | [Visual](#visual-v) | [Interpretation](#interpretation-v) |

---

## 📈 Project Summary

| Metric | Value |
|---------|---------|
| Ratings Analysed | 100,000 |
| Active Users (≥50 Ratings) | 568 |
| Users Below 20 | 77 |
| Scientists Aged 30–40 | 16 |
| Top Rated Movie | Close Shave, A (1995) |
| Storage Engine | Apache Cassandra |

---

## ✨ Project Highlights

- Built a distributed data pipeline using **Apache Spark** and **Cassandra**.
- Loaded MovieLens files from **HDFS** into Spark RDDs and DataFrames.
- Used **Spark SQL** for analytical queries and validation.
- Stored processed outputs into **Cassandra tables**.
- Included result screenshots and visualizations for each analytical task.
- Organized the project repository for reproducibility and GitHub presentation.

---

<a id="software-environment"></a>

## 🛠️ Software Environment

| Component | Version | Purpose |
|-----------|---------|---------|
| Apache Spark | 2.3.0 | Distributed data processing |
| Apache Cassandra | 3.11.x | NoSQL database storage |
| PySpark | 2.3.0 | Python API for Spark |
| Spark-Cassandra Connector | 2.3.0 | Spark and Cassandra integration |
| HDFS | 2.6.5 | Distributed file storage |
| Apache Zeppelin | 0.7.3 | Notebook environment |
| Python | 2.7.x | Programming language |
| Matplotlib | 2.2.5 | Data visualization |
| HDP Sandbox | 2.6.5 | Hadoop platform |

---

<a id="dataset"></a>

## 📂 Dataset

Dataset: MovieLens 100K

Files used:

* `u.data` – User movie ratings
* `u.user` – User demographic information
* `u.item` – Movie information and genres

Dataset Source:

https://grouplens.org/datasets/movielens/

---

<a id="project-workflow"></a>

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

<a id="repository-structure"></a>

## 📁 Repository Structure

```text
STQD6324-Assignment2/
│
├── README.md
├── P161828_Assignment2_MovieLens_Analysis.json
│
├── screenshots/
│   ├── task_i_output.png
│   ├── task_ii_output.png
│   ├── task_iii_output.png
│   ├── task_iv_output.png
│   ├── task_v_output.png
│   ├── task_i_visual.png
│   ├── task_ii_visual.png
│   ├── task_iii_visual.png
│   ├── task_iv_visual.png
│   └── task_v_visual.png
│
└── setup.cql
```

---

<a id="analytical-tasks"></a>

# 📊 Analytical Tasks

---

## 🎬 Task (i): Average Rating for Each Movie

### Objective

Calculate the average rating received by every movie in the dataset.

<a id="method-i"></a>

### Method

* Join ratings data with movie titles.
* Group records by movie.
* Compute:

  * Average rating
  * Number of ratings

<a id="result-i"></a>

### Results

<p align="center">
  <a href="screenshots/task_i_output.png">
    <img src="screenshots/task_i_output.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 1. Average rating output for each movie using Spark.</em>
</p>

<a id="visual-i"></a>

### Visualization

<p align="center">
  <a href="screenshots/task_i_visual.png">
    <img src="screenshots/task_i_visual.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 2. Visualization of movies ranked by average rating.</em>
</p>

<a id="interpretation-i"></a>

### Interpretation

Several movies achieved a perfect average rating of 5.0. However, these movies received very few ratings, making their averages less reliable indicators of overall popularity. Therefore, rating frequency should also be considered when evaluating movie quality.

<p align="right">
  <a href="#quick-navigation">⬆ Back to Navigation</a>
</p>

---

## ⭐ Task (ii): Top 10 Highest Rated Movies

### Objective

Identify the highest-rated movies based on average ratings.

<a id="method-ii"></a>

### Method

- Calculated average ratings for all movies.
- Filtered movies with sufficient rating counts (>10).
- Ranked movies by average rating in descending order.

<a id="result-ii"></a>

### Top 10 Movies

<p align="center">
  <a href="screenshots/task_ii_output.png">
    <img src="screenshots/task_ii_output.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 3. Top 10 highest rated movies after applying rating count filtering.</em>
</p>

<a id="visual-ii"></a>

### Visualization

<p align="center">
  <a href="screenshots/task_ii_visual.png">
    <img src="screenshots/task_ii_visual.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 4. Bar chart visualization of the top 10 highest rated movies.</em>
</p>

<a id="interpretation-ii"></a>

### Interpretation

The results reveal that several critically acclaimed films dominate the highest-rated list. Classic movies such as *Casablanca*, *12 Angry Men*, and *Rear Window* remain highly appreciated by users despite their age, which indicates enduring audience appeal.

<p align="right">
  <a href="#quick-navigation">⬆ Back to Navigation</a>
</p>

---

## 🎭 Task (iii): Favourite Genre of Active Users

### Objective

Identify users who rated at least 50 movies and determine their favourite genre.

<a id="method-iii"></a>

### Method

- Selected users with at least 50 movie ratings.
- Joined rating information with movie genre information.
- Counted genre occurrences for each user.
- Selected the most frequently rated genre as the user's favourite genre.

<a id="result-iii"></a>

### Results Summary

* Active Users Identified: **568 users**
* Some of favourite genres observed:

  * Drama
  * Comedy
  * Action

<p align="center">
  <a href="screenshots/task_iii_output.png">
    <img src="screenshots/task_iii_output.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 5. Favourite genre output for active users who rated at least 50 movies.</em>
</p>

<a id="visual-iii"></a>

### Visualization

<p align="center">
  <a href="screenshots/task_iii_visual.png">
    <img src="screenshots/task_iii_visual.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 6. Favourite genre distribution among active users.</em>
</p>

<a id="interpretation-iii"></a>

### Interpretation

**Drama** emerged as the most common favourite genre among active users. This suggests that users who engage heavily with the platform tend to consume a wide variety of dramatic content. **Comedy** also appeared frequently, indicating broad audience preference.

<p align="right">
  <a href="#quick-navigation">⬆ Back to Navigation</a>
</p>

---

## 👦 Task (iv): Users Below 20 Years Old

### Objective

Identify all users younger than 20 years old.

<a id="method-iv"></a>

### Method

- Filtered the user dataset based on age.
- Selected records where age < 20.

<a id="result-iv"></a>

### Results

* Total Users Below 20: **77 users**

<p align="center">
  <a href="screenshots/task_iv_output.png">
    <img src="screenshots/task_iv_output.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 7. Users below 20 years old identified from the user dataset.</em>
</p>

<a id="visual-iv"></a>

### Visualization

<p align="center">
  <a href="screenshots/task_iv_visual.png">
    <img src="screenshots/task_iv_visual.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 8. Age distribution of users below 20 years old.</em>
</p>

### Observation

The majority of users below 20 years old were students, indicating that younger audiences form an important segment of the MovieLens user base.

<a id="interpretation-iv"></a>

### Interpretation

The prevalence of students among younger users is expected due to their higher engagement with entertainment media and online recommendation systems.

<p align="right">
  <a href="#quick-navigation">⬆ Back to Navigation</a>
</p>

---

## 🔬 Task (v): Scientists Aged Between 30 and 40

### Objective

Identify users whose occupation is scientist and whose age falls between 30 and 40 years.

<a id="method-v"></a>

### Method

- Filtered users based on occupation.
- Selected only users with occupation = scientist.
- Applied an age filter between 30 and 40 years old.

<a id="result-v"></a>

### Results

* Total Scientists Aged 30–40: **16 users**

<p align="center">
  <a href="screenshots/task_v_output.png">
    <img src="screenshots/task_v_output.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 9. Scientist users aged between 30 and 40 years old.</em>
</p>

<a id="visual-v"></a>

### Visualization

<p align="center">
  <a href="screenshots/task_v_visual.png">
    <img src="screenshots/task_v_visual.png" width="500">
  </a>
</p>

<p align="center">
  <em>Figure 10. Visualization of scientist users by age and gender.</em>
</p>

<a id="interpretation-v"></a>

### Interpretation

The scientist user group represents a relatively small proportion of the dataset. Most identified users were male, although female scientists were also represented within the selected age range.

<p align="right">
  <a href="#quick-navigation">⬆ Back to Navigation</a>
</p>

---

<a id="cassandra-data-storage"></a>

## 🗃️ Cassandra Schema

The processed analytical results were stored in the `movielens` keyspace using five Cassandra tables designed specifically for each analytical task.

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

<a id="implementation-notes"></a>

# 🧩 Implementation Notes

This project was implemented in **Apache Zeppelin** using the `%spark2.pyspark` interpreter. Spark DataFrames were created from raw MovieLens files stored in HDFS. Analytical queries were executed using Spark DataFrame operations and Spark SQL temporary views.

Cassandra was used as the persistent storage layer. Each analytical result was written into a separate Cassandra table and read back into Spark to validate successful storage.

---

<a id="reproducibility"></a>

# ▶️ Reproducibility

### 1. Upload Dataset to HDFS

Upload the following MovieLens files into HDFS:

* `u.data`
* `u.user`
* `u.item`

---

### 2. Start Cassandra

Open PuTTY and run:

```bash
su root
service cassandra start
cqlsh
```

Execute the commands in `setup.cql` to create:

* Keyspace: `movielens`
* Tables:

  * `avg_ratings`
  * `top_movies`
  * `user_fav_genre`
  * `young_users`
  * `scientist_users`

After the tables have been created, exit Cassandra:

```bash
exit
```

---

### 3. Import and Run Zeppelin Notebook

Open Zeppelin:

```text
http://localhost:9995
```

1. Click **Import Note**
2. Upload `P161828_Assignment2_MovieLens_Analysis.json`
3. Open the imported notebook
4. Run all cells sequentially from top to bottom
5. Wait for each cell to complete before executing the next cell

---

### 4. Validate Results

The notebook will:

* Load data from HDFS into Spark
* Create RDDs and DataFrames
* Perform data preprocessing
* Execute Spark SQL analytical queries
* Write processed results into Cassandra
* Read Cassandra tables back into Spark for validation

Successful execution should produce outputs for all five analytical tasks and display validation results from Cassandra.

---

<a id="conclusion"></a>

# 🎯 Conclusion

This project successfully demonstrates the integration of Apache Spark and Cassandra for large-scale analytical processing. Using distributed computing techniques, the MovieLens dataset was transformed into meaningful insights regarding movie ratings, user preferences, demographic patterns, and genre interests. The workflow highlights how big data technologies can be combined to create scalable and efficient analytics pipelines.

---

<p align="center">
  <b>STQD6324 Data Management Assignment 2</b><br>
  MovieLens 100K Analysis using Apache Spark, HDFS, Zeppelin, and Cassandra
</p>
