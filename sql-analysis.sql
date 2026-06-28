

CREATE TABLE unicorn_companies (
    company VARCHAR(255),
    valuation VARCHAR(20),
    date_joined VARCHAR(20),
    industry VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100),
    continent VARCHAR(50),
    year_founded INT,
    funding VARCHAR(20),
    select_investors TEXT,
    unicorn_year INT,
    years_to_unicorn INT,
    valuation_b NUMERIC(10,3),
    fundings_b NUMERIC(10,3),
    funding_category VARCHAR(20),
    valuation_efficiency NUMERIC(15,4)
);



Select * from unicorn_companies
limit 10;



--How many unicorn companies exist?

Select Count(*) as total_companies
from unicorn_companies


--How many countries are represented?

Select count(distinct country) as contries
from unicorn_companies



--How many industries exist?


Select count(distinct industry) as industries
from unicorn_companies


--Which countries have the most unicorns?


Select country,count(company) as unicorn_count from unicorn_companies 
group by country
order by unicorn_count desc


--Which countries have the most unicorns and top 10 countries?


Select country,count(company) as unicorn_count from unicorn_companies 
group by country
order by unicorn_count desc
limit 10


--Average Valuation by Country


Select country,round(Avg(valuation_b),2) as avg_val
	from unicorn_companies
	group by country
	order by avg_val desc
	

Select round(Avg(valuation_b),2) as avg_val
	from unicorn_companies
	where country = 'India'


--Which industries attract the most funding?

Select industry,round(avg(fundings_b),2) as funds from unicorn_companies
group by industry
order by funds desc


--Which industries have the highest average valuation?

Select industry,round(avg(valuation_b),2) as avg_val From unicorn_companies 
group by industry
order by avg_val desc 

--Which industries produce unicorns fastest?

Select industry,ROUND(AVG(years_to_unicorn),2) as avg_year from unicorn_companies 
group by industry
order by avg_year 



--Which companies are most capital efficient? 


Select company,ROUND(valuation_efficiency,2) as eff from unicorn_companies 
order by eff desc
limit 10


--Which industries are most capital efficient?

Select industry,ROUND(AVG(valuation_efficiency),2) as eff from unicorn_companies
group by industry 
order by eff desc



--Do highly funded startups become unicorns faster? - yes

Select funding_category, Round(avg(years_to_unicorn),2)  as avg_year from unicorn_companies
group by funding_category
order by avg_year 



--Has unicorn creation accelerated over time?

Select unicorn_year , count(company) as unicorn_count from unicorn_companies
group by unicorn_year
order by unicorn_year


SELECT COUNT(DISTINCT country) FROM unicorn_companies;
SELECT COUNT(DISTINCT industry) FROM unicorn_companies;
SELECT country, COUNT(*)
FROM unicorn_companies
GROUP BY country
ORDER BY COUNT(*) DESC;
SELECT industry, COUNT(*)
FROM unicorn_companies
GROUP BY industry
ORDER BY COUNT(*) DESC;




--Total Funding by Industry

Select industry,round(sum(fundings_b),2) total_funding from unicorn_companies
group by industry
order by total_funding desc

--Average Funding by Industry

Select industry,round(avg(fundings_b),2) avg_funding from unicorn_companies
group by industry
order by avg_funding desc


--Average Valuation by Industry

Select industry,round(avg(valuation_b),2) avg_valuation from unicorn_companies
group by industry
order by avg_valuation desc


--Capital Efficiency by Industry

Select industry, Round(avg(valuation_efficiency),2) avg_eff from unicorn_companies
group by industry
order by avg_eff desc


--Fastest Industries to Reach Unicorn Status

Select Distinct industry , ROund(avg(years_to_unicorn),2) avg_year from unicorn_companies 
group by industry
order by avg_year 

SELECT DISTINCT industry
FROM unicorn_companies
group by industry

UPDATE unicorn_companies
SET industry = 'Artificial Intelligence'
WHERE industry = 'Artificial intelligence';

Select * from unicorn_companies

--Which Countries Create Unicorns Fastest?

SELECT
    country,
    ROUND(AVG(years_to_unicorn),2) AS avg_years
FROM unicorn_companies
GROUP BY country
HAVING COUNT(*) >= 10
ORDER BY avg_years ASC;

--Top 10 Most Valuable Unicorns

Select company,valuation_b,industry,country from unicorn_companies 
order by valuation_b desc
limit 10

--Top 10 Most Capital Efficient Companies

Select company, ROUND(valuation_efficiency,2) as val from unicorn_companies 
order by val desc 
limit 10


--Least Capital Efficient Companies

Select company,industry,country, ROUND(valuation_efficiency,2) as val from unicorn_companies 
where ROUND(valuation_efficiency, 2)  > 0
order by val  
limit 10

--Which countries generate the highest valuations?

select country ,
		round(avg(valuation_b),2) as val
	from unicorn_companies
	group by country
	HAVING COUNT(company) >= 10
	order by val desc

--Which countries are most capital efficient?


select country ,
		round(avg(valuation_efficiency),2) as eff
	from unicorn_companies
	group by country
	HAVING COUNT(company) >= 10
	order by eff desc

--Which countries attract the most funding?

select country,round(sum(fundings_b),2) as fund from unicorn_companies
group by country
order by fund desc

--Which industry dominates each country?

SELECT
    country,
    industry,
    COUNT(*) AS unicorn_count
FROM unicorn_companies
GROUP BY country, industry
ORDER BY unicorn_count DESC;

--AI Unicorn Distribution

select country, count(*) as ai_unicorns from unicorn_companies
where industry ILIKE '%artificial%'
group by country
order by ai_unicorns desc

--Does More Funding Lead to Faster Growth?

select funding_category, Round(avg(years_to_unicorn),2) as time_taken from unicorn_companies
group by funding_category
order by time_taken

--Does More Funding Lead to Higher Valuation?

select funding_category, Round(avg(valuation_b),2) as val from unicorn_companies
group by funding_category
order by val desc

---IMP
--Best Industries for Investors
--which industry offer best balanced of growth, efficiency, and valuation?

Select industry,
		round(avg(valuation_b),2) as val,
		round(avg(valuation_efficiency),2) as eff,
		round(avg(years_to_unicorn),2) as years
		from unicorn_companies
		group by industry
		order by eff desc


--












