 create database Assignment_3_Ravi

 use Assignment_3_Ravi

 create table actor(
	act_id int primary key,
	act_fname varchar(20),
	act_lname varchar(20),
	act_gender char(1),
);

-- Actors
INSERT INTO actor VALUES (1, 'Tom', 'Hanks', 'M'),
						 (2, 'Meryl', 'Streep', 'F'),
						 (3, 'Brad', 'Pitt', 'M'),
						 (4, 'Jennifer', 'Lawrence', 'F'),
						 (5, 'Leonardo', 'DiCaprio', 'M'),
						 (6, 'Emma', 'Watson', 'F'),
						 (7, 'Chris', 'Hemsworth', 'M'),
						 (8, 'Natalie', 'Portman', 'F'),
						 (9, 'Matthew', 'McConaughey', 'M'),
						 (10, 'Scarlett', 'Johansson', 'F');
select * from actor

create table genre(
	gen_id int primary key,
	gen_title varchar(50),
);
-- Genres
INSERT INTO genre VALUES (1, 'Drama'),
						 (2, 'Comedy'),
						 (3, 'Action'),
						 (4, 'Romance'),
						 (5, 'Thriller'),
						 (6, 'Sci-Fi'),
						 (7, 'Crime'),
						 (8, 'Adventure'),
						 (9, 'Fantasy'),
						 (10, 'Mystery');
select * from genre

create table director(
	dir_id int primary key,
	dir_fname varchar(20),
	dir_lname varchar(20),
);


-- Directors
INSERT INTO director VALUES (1, 'Christopher', 'Nolan'),
                            (2, 'Steven', 'Spielberg'),
                            (3, 'Quentin', 'Tarantino'),
                            (4, 'Greta', 'Gerwig'),
                            (5, 'James', 'Cameron'),
                            (6, 'Martin', 'Scorsese'),
                            (7, 'Ridley', 'Scott'),
                            (8, 'Tim', 'Burton'),
                            (9, 'Spike', 'Lee'),
                            (10, 'Kathryn', 'Bigelow');
select * from director

create table movie(
	mov_id int primary key,
	mov_title  varchar(50),
	mov_year int ,
	mov_time int,
	mov_dt_rel date ,
	mov_release_country varchar(max),
);
-- Movies
INSERT INTO movie VALUES (1, 'The Shawshank Redemption', 1994, 142, '1994-09-10', 'USA'),
                         (2, 'Forrest Gump', 1994, 142, '1994-07-06', 'USA'),
                         (3, 'Pulp Fiction', 1994, 154, '1994-10-14', 'USA'),
                         (4, 'La La Land', 2016, 128, '2016-12-09', 'USA'),
                         (5, 'Inception', 2010, 148, '2010-07-13', 'USA'),
                         (6, 'The Godfather', 1972, 175, '1972-03-24', 'USA'),
                         (7, 'The Dark Knight', 2008, 152, '2008-07-18', 'USA'),
                         (8, 'Jurassic Park', 1993, 127, '1993-06-11', 'USA'),
                         (9, 'The Matrix', 1999, 136, '1999-03-31', 'USA'),
                         (10, 'Gone Girl', 2014, 149, '2014-09-26', 'USA');
select * from movie

create table movie_genres(
	mov_id int primary key,
	gen_id int,
	
	foreign key (mov_id) references movie(mov_id),
	foreign key (gen_id) references genre(gen_id),
);

-- Movie Genres
INSERT INTO movie_genres VALUES (1, 1),
                                (2, 2),
                                (3, 3),
                                (4, 4),
                                (5, 5),
                                (6, 6),
                                (7, 7),
                                (8, 8),
                                (9, 9),
                                (10, 10);
select * from movie_genres
create table movie_direction(
	dir_id  int,
	mov_id int,

	foreign key (dir_id) references director(dir_id),
	foreign key (mov_id) references movie(mov_id),
);
-- Movie Directors
INSERT INTO movie_direction VALUES (1, 1),
                                   (2, 2),
                                   (3, 3),
                                   (4, 4),
                                   (5, 5),
                                   (6, 6),
                                   (7, 7),
                                   (8, 8),
                                   (9, 9),
                                   (10, 10);

create table reviewer(
	rev_id int primary key,
	rev_name varchar(20),
);

-- Reviewers
INSERT INTO reviewer VALUES (1, 'John Doe'),
                            (2, 'Jane Smith'),
                            (3, 'Bob Johnson'),
                            (4, 'Alice Adams'),
                            (5, 'Charlie Brown'),
                            (6, 'Emily White'),
                            (7, 'Eva Williams'),
                            (8, 'David Taylor'),
                            (9, 'Grace Davis'),
                            (10, 'Mark Wilson');
create table rating(
	mov_id int,
	rev_id int,
	rev_starts int,
	num_o_rating int,
	foreign key (mov_id) references movie(mov_id),
	foreign key (rev_id) references reviewer (rev_id),
)

-- Ratings
INSERT INTO rating VALUES (1, 1, 5, 100),
                          (2, 2, 4, 80),
                          (3, 3, 4, 90),
                          (4, 4, 5, 120),
                          (5, 5, 5, 150),
                          (6, 6, 4, 100),
                          (7, 7, 3, 70),
                          (8, 8, 5, 130),
                          (9, 9, 4, 110),
                          (10, 10, 3, 90);


create table movie_cast(
	mov_id int ,
	act_id int, 
	role varchar(50),
	foreign key (mov_id) references movie(mov_id),
	foreign key (act_id) references actor(act_id),
);

alter table movie_cast alter column role varchar(50)
select * from movie_cast

-- Movie Cast
INSERT INTO movie_cast VALUES (1, 1, 'Andy Dufresne'),
                              (1, 2, 'Ellis Boyd Red Redding'),
                              (2, 3, 'Forrest Gump'),
                              (2, 4, 'Jenny Curran'),
                              (3, 5, 'Vincent Vega'),
                              (3, 6, 'Mia Wallace'),
                              (4, 7, 'Sebastian Wilder'),
                              (4, 8, 'Mia Dolan'),
                              (5, 9, 'Dom Cobb'),
                              (5, 10, 'Ariadne');



--1) From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year

select mov_title, mov_year from movie

--2. From the following table, write a SQL query to find when the movie specific released. Return movie release year

select year(mov_dt_rel) from movie where mov_title='the matrix' 

--3. From the following table, write a SQL query to find the movie that was released in 1999. Return movie title.

select mov_title from movie where year (mov_dt_rel)=1999

--4. From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.

select mov_title from movie where year(mov_dt_rel)<1998

--5. From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.

select m.*,rev.* from movie as m join rating as r on 
r.mov_id=m.mov_id join reviewer as rev on rev.rev_id=r.rev_id

--6. From the following table, write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name.

select rev.rev_name from reviewer as rev join rating as
r on r.rev_id=rev.rev_id where rev_starts >=7

--7. From the following tables, write a SQL query to find the movies without any rating. Return movie title.

select mov_title from movie join rating on 
movie.mov_id=rating.mov_id where rev_id is null

--8. From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.

select mov_title from movie where mov_id in (905,907,917)
--query according to movie_id in my table
select mov_title from movie where mov_id in (5,7,17)


--9. From the following table, write a SQL query to find the movie titles that contain the specific word. 
--Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year. 

select mov_id,mov_title,mov_dt_rel from movie where mov_title like '%the%'

--10. From the following table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID

select act_id from actor where act_fname='woody' and act_lname='allen'

--11. get directors who have directed movies with avrage rating higher then 5

select d.dir_id,d.dir_fname from movie_direction 
as md join rating as r on r.mov_id=md.mov_id join 
director as d on d.dir_id =md.dir_id group by 
d.dir_id,d.dir_fname having avg(rev_starts )>5

--12. get all actors who have worked for movies that were directed by specific director

select a.act_id,a.act_fname from actor as a
join movie_cast as mc on  a.act_id=mc.act_id 
join movie_direction as md on md.mov_id=mc.mov_id 
join director as d on d.dir_id=md.dir_id where d.dir_fname like '%steven%'

--13. create a stored proc to get list of movies which is 3 years old and having rating greater than 5

select mov_title from movie as m join rating
as r on r.mov_id=m.mov_id where r.rev_starts>5 
and year(mov_dt_rel)=year(getdate())-3


--14. create a stored proc to get list of all directors who have directed more then 2 movies


select md.dir_id,d.dir_fname from director as d
join movie_direction as md on d.dir_id=md.dir_id
group by md.dir_id,d.dir_fname having count (md.dir_id)>2



--15. create a stored proc to get list of all directors which have directed a movie which have rating greater than 3.


select d.dir_id,d.dir_fname from director as d 
join movie_direction as  md on md.dir_id=d.dir_id 
join rating as r on r.mov_id=md.mov_id where r.rev_starts>3


--16. create a function to get worst director according to movie rating

select top 1  d.*,r.rev_starts from director as d
join movie_direction as md on d.dir_id=md.dir_id join
rating as r on r.mov_id=md.mov_id order by r.rev_starts;


--17.  create a function to get worst actor according to movie rating

select top 1 a.*,r.rev_starts from movie_cast as md 
join rating as r on r.mov_id=md.mov_id join actor as
a on a.act_id=md.act_id order by r.rev_starts ;



--18. create a parameterized stored procedure which accept genre and give movie accordingly 


select m.* from movie as m join movie_genres
as mg on mg.mov_id=m.mov_id join genre as g on 
g.gen_id=mg.gen_id where g.gen_title='drama'




--19. get list of movies that start with 'a' and end with letter 'e' and movie released before 2015

select mov_title from movie where mov_title like'a%e' 
and year(mov_dt_rel)<2015; 

--20. get a movie with highest movie cast

select top 1 m.mov_title,count(mc.act_id)
as no_of_cast from movie as m join movie_cast 
as mc on mc.mov_id=m.mov_id group by m.mov_title 
order  by count(mc.act_id) desc

--21. create a function to get reviewer that has rated highest number of movies


select top 1 r.rev_id,rev.rev_name,count(r.rev_id) as total_movie_review from reviewer as rev 
join rating as r on r.rev_id=rev.rev_id
group by r.rev_id,rev.rev_name order by total_movie_review desc




--22. From the following tables, write a query in SQL to generate a report, which contain the fields movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie.




select m.mov_title,a.act_fname,m.mov_year,mc.role,g.gen_title,mov_dt_rel,r.rev_starts from movie_direction as md 
join movie as m on m.mov_id=md.mov_id
join director as d on d.dir_id=md.dir_id
join movie_genres as mg on mg.mov_id=m.mov_id
join genre as g on g.gen_id=mg.gen_id
join movie_cast as mc on mc.mov_id=m.mov_id
join actor as a on a.act_id=mc.act_id
join rating as r on r.mov_id=m.mov_id
where a.act_gender='f'


--23. From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. Return movie year, generic title, number of generic title and average rating.


select top 1 m.mov_year,g.gen_title,count(*),avg(r.rev_starts) as average_rating
from movie_genres as mg 
join movie as m on m.mov_id=mg.mov_id
join genre as g on g.gen_id =mg.gen_id
join rating as r on r.mov_id=m.mov_id
group by g.gen_title,m.mov_year having g.gen_title='Mystery' order by count(*) desc



----24.  From the following tables, 
--write a SQL query to find the highest-rated ‘Mystery Movies’.
--Return the title, year, and rating


select top 1 m.mov_title,m.mov_year,r.rev_starts
from movie_genres as mg 
join movie as m on m.mov_id=mg.mov_id
join genre as g on g.gen_id =mg.gen_id
join rating as r on r.mov_id=m.mov_id
where g.gen_title='Mystery' order by r.rev_starts desc


--25. create a function which accepts genre and suggests best movie according to ratings 



select top 1 m.*, r.rev_starts
from movie_genres as mg 
join movie as m on m.mov_id=mg.mov_id
join genre as g on g.gen_id =mg.gen_id
join rating as r on r.mov_id=m.mov_id
where g.gen_title='drama' order by r.rev_starts desc;




--26. create a function which accepts genre and suggests best director according to ratings. 



select top 1  d.*,g.gen_title,r.rev_starts
from movie_genres as mg 
join movie as m on m.mov_id=mg.mov_id
join genre as g on g.gen_id =mg.gen_id
join rating as r on r.mov_id=m.mov_id
join movie_direction as md on mg.mov_id=md.mov_id 
join director as d on md.dir_id=d.dir_id
where g.gen_title='crime' order by r.rev_starts desc;





--27. create a function that accepts a genre and give random movie according to genre

select  top 1 m.*
from movie_genres as mg 
join movie as m on m.mov_id=mg.mov_id
join genre as g on g.gen_id =mg.gen_id
where g.gen_title='mystery'





