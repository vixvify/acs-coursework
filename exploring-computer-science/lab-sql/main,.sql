SELECT * FROM Foods WHERE Type = "Spices and Herbs";
 
SELECT DISTINCT Type FROM Foods order by Type; 

SELECT Name, C, Fiber FROM Foods order by C; 

SELECT * FROM Foods WHERE Fiber = 42.8; 

SELECT Name, C FROM Foods WHERE C > 25 order by C desc; 

SELECT * FROM Foods WHERE ServingSize like '%cup'; 

DELETE FROM Foods WHERE C = 0;
SELECT * FROM Foods;

INSERT into Foods values (1, 'Corn bran crude', '1cup', 79, 'Cereal Grains and Pasta', 0);
INSERT into Foods values (4, 'Wheat bran crude', '1cup', 42.8, 'Cereal Grains and Pasta', 0);
INSERT into Foods values (10, 'Spearmint dried', '1tbsp', 29.8, 'Spices and Herbs', 0); 
SELECT * FROM Foods;

DELETE FROM Foods WHERE C = 0 or Fiber < 40;
SELECT * FROM Foods; 