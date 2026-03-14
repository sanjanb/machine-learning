# Feature Construction and Feature Splitting

This tutorial covers the manual side of feature engineering: **Feature Construction** and **Feature Splitting**. Unlike automated transformations, these techniques rely heavily on your **domain knowledge** and **intuition**.


## 1. Feature Construction

**Feature Construction** is the process of manually creating new features from existing ones to help the model learn more effectively. There is no fixed mathematical formula; it’s about understanding the logic of the data. [[01:54](http://www.youtube.com/watch?v=ma-h30PoFms&t=114)]

### Example: Titanic Dataset

In the Titanic dataset, we have two columns: `SibSp` (Siblings/Spouses) and `Parch` (Parents/Children).

* **The Logic:** Individually, these columns represent specific family ties. Together, they represent the total number of people traveling together.
* **The New Feature:** `Family_Size = SibSp + Parch + 1` (the '+1' accounts for the passenger themselves).
* **Categorization:** You can further refine this into a categorical feature like `Family_Type`:
* `0` (Alone): Family Size = 1
* `1` (Small): Family Size 2–4
* `2` (Large): Family Size > 4 



**Result:** Adding `Family_Type` improved the model's accuracy from **65% to 67%** in the demonstration.



## 2. Feature Splitting

**Feature Splitting** is used when a single column contains multiple pieces of information (non-atomic values). Splitting these into separate columns makes the data "tidy" and easier for the model to process. 

### Example: Name Titles

In the Titanic data, the `Name` column follows a format like: *"Braund, Mr. Owen Harris"*.

* **The Hidden Data:** The title ("Mr.", "Mrs.", "Miss") contains information about the passenger's gender, social status, and marital status.
* **The Split:** By using string manipulation (splitting by comma and period), you can extract just the **Title**.
* **Insight:** Once extracted, you can observe that "Mrs." and "Miss" have significantly higher survival rates (~70–80%) compared to "Mr.". 

---

## Summary of Benefits

| Technique | Goal | Success Factor |
| --- | --- | --- |
| **Construction** | Combine features to capture underlying relationships. | Domain Expertise & Experience. |
| **Splitting** | Break down complex strings into simple, atomic features. | Understanding data format & patterns. |

## Pro-Tip for Learners

To practice, take a dataset like IPL player stats. Can you create a **Strike Rate** feature for batsmen or an **Economy Rate** for bowlers? These are constructed features that provide much more value than raw runs or balls faced.
