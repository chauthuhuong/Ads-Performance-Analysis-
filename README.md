# 🎯 Ads Performance Analysis (SQL Project)

## 🧠 Overview
This project aims to analyze a dataset of digital ad campaigns using **advanced SQL** techniques, including **window functions, CTEs, and pivot tables**, to uncover insights and drive **business decisions**.

---

## 🚀 Business Objective
> **How can we improve ad targeting and optimize conversion rates to increase ROI and user engagement?**

The dataset contains ad campaign data such as:
- Age, Gender, Income
- Ad Type, Topic, Placement
- Click-through Rate (CTR), Conversion Rate (CR)
- Time of click, Location, etc.

---

## 🛠️ Tools Used
- **SQL Server**
- Window functions, ROLLUP, CTEs, PIVOT

---

## 🔍 Key Analyses

| No. | Insight | Method |
|-----|---------|--------|
| 1. | **Conversion Rate by Age & Gender** | `GROUP BY` + `AVG()` |
| 2. | **Top 3 CTR Topics** | `ORDER BY` + `LIMIT` |
| 3. | **Best Age Group per Ad Type** | `RANK()` + `PARTITION BY` |
| 4. | **Income Segment Click Behavior** | `CASE WHEN` logic |
| 5. | **Pivot CR by Gender & Ad Type** | `PIVOT` |
| 6. | **CTR by Location** | `RANK()` + `PARTITION BY` |
| 7. | **Click Trends by Hour** | `DATEPART()` |
| 8. | **Top 5 Effective Ads** | `SUM(Clicks * CR)` |
| 9. | **High Income Audience Analysis** | `PERCENTILE_CONT` |
| 10.| **Compare Social Media vs Search** | Filtered by Ad Type |
