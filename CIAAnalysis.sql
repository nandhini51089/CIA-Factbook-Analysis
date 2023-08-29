SELECT 
    *
FROM
    facts;
 -- min pop, max pop-------------------------------------------------------------------------------
SELECT 
    MIN(POPULATION),
    MAX(POPULATION),
    MIN(POPULATION_GROWTH),
    MAX(POPULATION_GROWTH)
FROM
    FACTS;
 -- country with min pop ----------------------------------------------------------------------------------
SELECT 
    NAME
FROM
    FACTS
WHERE
    POPULATION IN (SELECT 
            MIN(POPULATION)
        FROM
            FACTS);
  -- country with MAX pop ----------------------------------------------------------------------------------
SELECT 
    NAME
FROM
    FACTS
WHERE
    POPULATION IN (SELECT 
            MAX(POPULATION)
        FROM
            FACTS);
 -- AVG POP, AVG AREA -----------------------------------------------------------------------------------------------
SELECT 
    AVG(POPULATION), AVG(AREA)
FROM
    FACTS;
 -- COUNTRIES WITH Above-average values for population AND Below-average values for area ----------------------
SELECT 
    NAME
FROM
    FACTS
WHERE
    POPULATION > (SELECT 
            AVG(POPULATION)
        FROM
            FACTS)
        AND AREA < (SELECT 
            AVG(AREA)
        FROM
            FACTS);
            
-- Which country has the most people? ------------------------
SELECT 
    NAME
FROM
    FACTS
WHERE
    POPULATION IN (SELECT 
            MAX(POPULATION)
        FROM
            FACTS);
--  Which country has the highest growth rate?  --------------------
SELECT
	NAME
FROM
	FACTS
WHERE 
	POPULATION_GROWTH IN ( SELECT 
							MAX(POPULATION_GROWTH)
                            FROM
							FACTS);
                            
-- Which countries have the highest ratios of water to land? --------------------
SELECT
	NAME , cast(AREA_WATER as float)/AREA_LAND AS RATIO
FROM 
	FACTS
    ORDER BY RATIO DESC
    LIMIT 5;
	
-- Which countries have more water than land? --------------------------------
SELECT 
	NAME ,AREA_LAND,AREA_WATER
    FROM 
    FACTS
    WHERE 
    AREA_LAND <AREA_WATER;
-- Which countries will add the most people to their populations next year? -------------
	SELECT
    NAME ,population*population_growth as more_pop
    FROM 
    FACTS
    ORDER BY more_pop DESC
    LIMIT 5;
-- Which countries have a higher death rate than birth rate? -----------------------
SELECT
NAME 
FROM FACTS
WHERE 
DEATH_RATE>BIRTH_RATE;
-- Which countries have the highest population/area ratio? ---------------------
SELECT
NAME,cast(POPULATION as float)/AREA AS RATIO
FROM 
FACTS
ORDER BY RATIO DESC
LIMIT 5; 

