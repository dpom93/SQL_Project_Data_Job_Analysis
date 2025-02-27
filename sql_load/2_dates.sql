SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM    
    job_postings_fact;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT (MONTH FROM job_posted_date) AS date_year,
        EXTRACT (YEAR FROM job_posted_date) AS date_year

FROM    
    job_postings_fact
LIMIT 5;

-- the month and year was great, let's look at trends from month to month now
SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    month
ORDER BY
    job_posted_count DESC;

-- practice problem 6
CREATE TABLE january_jobs AS 
    SELECT  *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS 
    SELECT  *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS 
    SELECT  *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM february_jobs;

