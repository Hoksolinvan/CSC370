# Adam Zheng

# Create Table
use bank_database;
drop table if exists `Employee`;
create table `Employee` (
	`employee_id` int
	,`age` int
	,`name` varchar(64)
	,`title` enum('Branch Manager', 'Assistant Branch Manager', 'Teller', 'Personal Banker', 'Loan Officer', 'Customer Service Representative', 'Financial Advisor')
	,`is_admin` bool
);
alter table `employee`
add primary key (`employee_id`);

# Load Data Into Table (Might need to change path)
set global local_infile = 1;
load data local infile 'C:\\Users\\adamz\\OneDrive\\Documents\\UVic\\CSC 370\\Database Project\\Employee\\Employee_Data.csv'
into table Employee 
fields terminated by ',' 
optionally enclosed by '"' 
lines terminated by '\r\n'
ignore 1 lines;

# Queries
# Select entire table
select * from `Employee`;

# Add new employee
insert into `Employee` (`employee_id`, `age`, `name`, `title`, `is_admin`)
values (16, 38, 'Sam Bankman-fried', 'Teller', 0);
select * from `Employee`;

# Change employee's title
update `Employee` 
set `title` = 'Financial Advisor'
where `employee_id` = 16;
select * from `Employee` where `employee_id` = 16;

# Display possible titles, is_admin, and how many currently hold that title
select `title`, `is_admin`, count(*) as `num_employees_holding_title`
from `Employee`
group by `title`, `is_admin`;

