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

## 📊 Key Insights

1. 🎯 **Female users aged 26–35** have the **highest conversion rate (CR)** → This segment should be the primary advertising target.

2. 🍎 **Ad topics “Health” and “Food”** have the highest **CTR and CR**, especially when delivered via **Social Media** campaigns.

3. 📺 **Best-performing age groups per ad type**:
   - **Banner ads**: 46–60 years old
   - **Native ads**: 18–25 years old
   - **Text ads**: 36–45 years old
   - **Video ads**: 46–60 years old

4. 📱 **Social Media** platforms have the **highest average CTR** → Recommend prioritizing this placement in future campaigns.

5. 💰 **High-income users** generate the **most clicks** overall → Indicates strong engagement and potential ROI.

6. 🌍 **Top CTR by region and topic**:
   - **Rural** → Health (CTR = 0.0522)
   - **Suburban** → Food (CTR = 0.0514)
   - **Urban** → Technology (CTR = 0.0516)  
   ➤ Suggests that ads should be **geographically personalized**.

7. 👩‍💼 **Females in suburban areas** show the **highest average CR**: 0.2067  
   ➤ Indicates potential for **location + gender-based segmentation**.

---

## ✅ Strategic Recommendations

- Prioritize **female users aged 26–35**, especially those in suburban areas with high income.
- Focus campaign budgets on **Social Media platforms** with **Health** and **Food** ad topics.
- Match **ad formats to age groups** to optimize performance.
- Use **A/B testing** by region and topic to fine-tune engagement and conversion.
- Consider predictive modeling to allocate **dynamic pricing or discounts** in high- and low-demand segments.

---

## 💥 Business Impact

This analysis helps identify the **most profitable customer segments**, optimize ad strategy by **platform, format, and region**, and provides a roadmap to potentially **increase conversion rate and revenue** through better audience targeting and media mix strategy.

