![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Encoding


## Introduction

Without data, we couldn't really be data scientists. Therefore, this lab will discuss the task of importing and exporting data into pandas using different file formats.

## Getting Started

This lab will be a little bit different from others and has two main goals:
to learn the data encoding methods, and
to develop your analytical skills 
## Tasks
Part 1: Python
Create the dataframe that reflects the following table:

TransactionID | ClientID | Profession | Bank_dep | Risk | Number of credits | Revenue 

1| 231 | Self-employed | 009 | High | 2 | 30200

2| 765 | students | 005 | high | 3 |12700

3| 453 | Horeca | 007 | medium |5 |89400

4| 231 | self-employed | 009 | high | 2 | 30200

5| 892 | finance | 003 | low | 3 | 740000


Create a table in the readme file that consists of the columns: Method, Library, Code, Result
Encode the categorical data using the following methods using different Python libraries:
- Dummy Encoder
- Label Encoder
- Backward Difference Coding
- BaseN
- Binary
- CatBoost Encoder
- Count Encoder
- Generalized Linear Mixed Model Encoder
- Hashing
- Helmert Coding
- James-Stein Encoder
- Leave One Out
- M-estimate
- One Hot
- Ordinal
- Polynomial Coding
- Sum Coding
- Target Encoder
- Weight of Evidence
- Wrappers
- Quantile Encoder
- Summary Encoder


Add to the readme file the results for each method.
Part 2: SQL
Let’s encode the data in SQL.
Create a database
Create the table
Implement the queries for:
OneHot Encoding, 
Ordinal Encoding


## Deliverables

- `main.ipynb` with your responses.
- readme file with your summary

## Submission

Upon completion, add your deliverables to git. Then commit git and push your branch to the remote.

## Resources

[Pandas - categorical data] (https://pandas.pydata.org/pandas-docs/stable/user_guide/categorical.html)

[Category encoders ](https://contrib.scikit-learn.org/category_encoders/)

[Scikit-learn -preprocessing] (https://scikit-learn.org/stable/modules/generated/sklearn.preprocessing.LabelEncoder.htmll)
