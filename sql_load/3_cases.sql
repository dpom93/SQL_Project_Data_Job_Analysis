-- CASE Expression - CASE/ WHEN/ THEN/ ELSE/ END AS
SELECT
    job_title_short,
    job_location
FROM job_postings_fact;

/* 
Label new column as follows: 
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'Local'
- Otherwise 'Onsite'
*/
SELECT
    job_title_short,
    job_location,
    CASE    
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact;

-- now let's use grouping (count of location category)
SELECT
COUNT(job_id) AS number_of_jobs,
    CASE    
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE
    job_title_short = 'Data Analyst'

GROUP BY location_category;