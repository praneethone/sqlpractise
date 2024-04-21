drop table if exists goldusers_signup;
CREATE TABLE goldusers_signup(userid integer,gold_signup_date date); 

INSERT INTO goldusers_signup(userid,gold_signup_date) 
 VALUES (1,'09-22-2017'),
(3,'04-21-2017');

drop table if exists users;
CREATE TABLE users(userid integer,signup_date date); 

INSERT INTO users(userid,signup_date) 
 VALUES (1,'09-02-2014'),
(2,'01-15-2015'),
(3,'04-11-2014');

drop table if exists sales;
CREATE TABLE sales(userid integer,created_date date,product_id integer); 

INSERT INTO sales(userid,created_date,product_id) 
 VALUES (1,'04-19-2017',2),
(3,'12-18-2019',1),
(2,'07-20-2020',3),
(1,'10-23-2019',2),
(1,'03-19-2018',3),
(3,'12-20-2016',2),
(1,'11-09-2016',1),
(1,'05-20-2016',3),
(2,'09-24-2017',1),
(1,'03-11-2017',2),
(1,'03-11-2016',1),
(3,'11-10-2016',1),
(3,'12-07-2017',2),
(3,'12-15-2016',2),
(2,'11-08-2017',2),
(2,'09-10-2018',3);


drop table if exists product;
CREATE TABLE product(product_id integer,product_name text,price integer); 

INSERT INTO product(product_id,product_name,price) 
 VALUES
(1,'p1',980),
(2,'p2',870),
(3,'p3',330);


select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;

 select a.userid, sum(b.price) as total_amount_spent from sales a
 inner join
 product b
 on a.product_id=b.product_id
 group by userid


 select userid,count( distinct created_date) as distinct_days from sales
 group by userid

 ---what is the first product purchased by each customer
 select * from
 (select *,rank() over(partition by userid order by created_date) as ranknum from sales) a where ranknum=1

---most purchased item and how many times it was purchased
--mostpurchased
 select top 1 product_id, count(product_id) from sales group by product_id order by count(product_id) desc
 select top 1 product_id from sales group by product_id order by count(product_id) desc
 --how many times
select userid,count(product_id)  prodcount from sales where product_id=
(select top 1 product_id from sales group by product_id order by count(product_id) desc)
group by userid

---which is most favourit for each customer

select userid,product_id,count(product_id) as cnt from sales group by userid ,product_id 

select * from
(select *,rank() over(partition by userid order by cnt desc) rnk from
(select userid,product_id,count(product_id) as cnt from sales group by userid ,product_id)a)b
where rnk=1


select * from sales

select userid,product_id,count(product_id) as cnt from sales group by userid ,product_id

select *,rank() over(partition by userid order by cnt desc) rnk from
(select userid,product_id,count(product_id) as cnt from sales group by userid ,product_id) as subquery

select *, rank() over(partition by userid order by cnt desc) as rnk from 
(select userid, product_id, count(product_id) as cnt from sales group by userid, product_id) as subquery



select * from sales;
select * from product;
select * from goldusers_signup;
select * from users;

--what is first item purchased by customer after they became member
select * from sales;
select * from goldusers_signup;

select * from
(select c.* ,rank() over(partition by userid order by created_date) rnk from
(select s.userid,g.gold_signup_date,s.product_id,s.created_date from sales s 
inner join goldusers_signup g 
on s.userid=g.userid 
where created_date>=gold_signup_date) c) d where rnk=1



---which item was purchased before becoming a member
select * from
(select c.* ,rank() over(partition by userid order by created_date desc) rnk from
(select s.userid,g.gold_signup_date,s.product_id,s.created_date from sales s 
inner join goldusers_signup g 
on s.userid=g.userid 
where created_date<=gold_signup_date) c) d where rnk=1


---what is total order and amount spend by each customer before becoming a member


select userid, count(created_date) as orderpurchased ,sum(price) as totalamountspent from
(select c.*,p.price from
(select s.userid,g.gold_signup_date,s.product_id,s.created_date from sales s 
inner join goldusers_signup g 
on s.userid=g.userid 
where created_date<=gold_signup_date) as c inner join product p on c.product_id=p.product_id) as e
group by userid

select * from product;

--points for buying each item..p1--5rupees=1point, p2--10rupees=5point,p3--2rupees=1point


select s.*,g.price from sales s inner join product g on s.product_id=g.product_id

select c.userid,c.product_id,sum(price) from
(select s.*,g.price from sales s inner join product g on s.product_id=g.product_id) as c
group by userid,product_id

select d.*,case when product_id=1 then 5 when product_id=2 then 2 when product_id=3 then 5 else 0 end as points from
(select c.userid,c.product_id,sum(price) as totalsumprice from
(select s.*,g.price from sales s inner join product g on s.product_id=g.product_id) as c
group by userid,product_id) as d


select e.*,totalsumprice/points as totalpointswon from
(select d.*,case when product_id=1 then 5 when product_id=2 then 2 when product_id=3 then 5 else 0 end as points from
(select c.userid,c.product_id,sum(price) as totalsumprice from
(select s.*,g.price from sales s inner join product g on s.product_id=g.product_id) as c
group by userid,product_id) as d) as e








