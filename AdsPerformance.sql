use ads

-- 1. Xoá dữ liệu thiếu CTR hoặc CR
DELETE FROM ads
WHERE CTR IS NULL OR Conversion_Rate IS NULL;
-- 2. Gán nhóm tuổi
ALTER TABLE ads ADD Age_group VARCHAR(20);
UPDATE ads
SET Age_group = CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'     
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END;

--Tỉ lệ chuyển đổi trung bình theo độ tuổi và giới tính
SELECT 
    Age_group,
    Gender,
    ROUND(AVG(Conversion_Rate), 4) AS Avg_Conversion_Rate
FROM ads
GROUP BY Age_group, Gender
ORDER BY Avg_Conversion_Rate DESC;

-- Top 3 chủ đề quảng cáo có CTR cao nhất
SELECT 
    Ad_Topic,
    ROUND(AVG(CTR), 4) AS Avg_CTR
FROM ads
GROUP BY Ad_Topic
ORDER BY Avg_CTR DESC;

--Nhóm tuổi có hiệu suất chuyển đổi cao nhất trong từng loại quảng cáo
WITH RankedGroups AS (
    SELECT 
        Ad_Type,
        Age_group,
        ROUND(AVG(Conversion_Rate), 4) AS Avg_CR,
        RANK() OVER (PARTITION BY Ad_Type ORDER BY AVG(Conversion_Rate) DESC) AS Rank_CR
    FROM ads
    GROUP BY Ad_Type, Age_group
)
SELECT *
FROM RankedGroups


-- CTR trung bình theo vị trí hiển thị 
SELECT 
    Ad_Placement,
    ROUND(AVG(CTR), 4) AS Avg_CTR
FROM ads
GROUP BY ROLLUP (Ad_Placement);

-- Tổng lượt nhấp theo từng phân khúc thu nhập
SELECT 
    CASE 
        WHEN Income < 20000 THEN 'Low Income'
        WHEN Income BETWEEN 20000 AND 50000 THEN 'Mid Income'
        ELSE 'High Income'
    END AS Income_Segment,
    SUM(Clicks) AS Total_Clicks
FROM ads
GROUP BY 
    CASE 
        WHEN Income < 20000 THEN 'Low Income'
        WHEN Income BETWEEN 20000 AND 50000 THEN 'Mid Income'
        ELSE 'High Income'
    END
ORDER BY Total_Clicks DESC;

-- So sánh Conversion Rate giữa các giới tính theo từng loại quảng cáo
SELECT *
FROM (
    SELECT Ad_Type, Gender, Conversion_Rate
    FROM ads
) AS SourceTable
PIVOT (
    AVG(Conversion_Rate) FOR Gender IN ([Male], [Female],[Other])
) AS PivotTable;


--CTR cao nhất theo từng địa phương

WITH RankedCTR AS (
    SELECT 
        Location,
        Ad_Topic,
        ROUND(AVG(CTR), 4) AS Avg_CTR,
        RANK() OVER (PARTITION BY Location ORDER BY AVG(CTR) DESC) AS rnk
    FROM ads
    GROUP BY Location, Ad_Topic
)
SELECT *
FROM RankedCTR
WHERE rnk = 1;

-- Số lượng quảng cáo không có lượt nhấp
SELECT COUNT(*) AS Ads_No_Clicks
FROM ads
WHERE Clicks = 0;

--Khung giờ click
SELECT 
    DATEPART(HOUR, Click_Time) AS Click_Hour,
    COUNT(*) AS Total_Clicks
FROM ads
GROUP BY DATEPART(HOUR, Click_Time)
ORDER BY Total_Clicks DESC;

--Số chiến dịch quảng cáo theo mỗi chủ đề và số lần hiển thi
SELECT 
    Ad_Topic,
    Ad_Type,
    COUNT(*) AS Total_Campaigns
FROM ads
GROUP BY Ad_Topic, Ad_Type
ORDER BY Total_Campaigns DESC;

--Tỉ lệ chuyển đổi trung bình theo vùng
SELECT 
    Gender,
    Location,
    ROUND(AVG(Conversion_Rate), 4) AS Avg_CR
FROM ads
GROUP BY Gender, Location
ORDER BY Avg_CR DESC;

--Top 5 quảng cáo đem lại hiệu quả
SELECT TOP 5 
    Ad_Topic,
    Ad_Type,
    SUM(Clicks * Conversion_Rate) AS Effective_Conversions
FROM ads
GROUP BY Ad_Topic, Ad_Type
ORDER BY Effective_Conversions DESC;

--Chủ đề quảng cáo nào đang hiệu quả nhất với người có thu nhập cao
WITH income_with_percentile AS (
    SELECT *,
           PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER BY income)
           OVER () AS income_threshold
    FROM ads
),

high_income_ads AS (
    SELECT Ad_Topic, Conversion_Rate
    FROM income_with_percentile
    WHERE Income >= income_threshold
)

SELECT Ad_Topic,
       ROUND(AVG(Conversion_Rate), 4) AS avg_cr
FROM high_income_ads
GROUP BY Ad_Topic
ORDER BY avg_cr DESC;

--Có nên thử chuyển một số video ads sang social media thay vì search engine không?
SELECT Ad_Placement,
       COUNT(*) AS total_ads,
       ROUND(AVG(CTR), 4) AS avg_ctr,
       ROUND(AVG(Conversion_Rate), 4) AS avg_cr
FROM ads
WHERE Ad_Type = 'Video'
GROUP BY Ad_Placement
ORDER BY avg_cr DESC;



