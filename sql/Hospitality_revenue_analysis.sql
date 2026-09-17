#Overall Business Performance(KPIs)
select count(*) as total_bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as average_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*) as cancellation_rate
from hospitality_revenue_sql;

#HOTEL PERFORMANCE
select HOTEL,
	count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR)as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*) as cancellation_rate
from hospitality_revenue_sql
group by HOTEL 
order by total_revenue DESC;

#CUSTOMER SEGMENT
select CUSTOMER_SEGMENT,
	count(*) as bookings,
    sum(FINAL_REVENUE) as total_revenue,
    avg(ADR)as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*) as cancellation_rate
from hospitality_revenue_sql
group by CUSTOMER_SEGMENT
order by total_revenue desc;

#BOOKING PLATFORM PERFORMANCE
select BOOKING_PLATFORM, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellatio_rate
from hospitality_revenue_sql
group by BOOKING_PLATFORM
order by total_revenue desc;

#PAYMENT METHOD PERFORMANCE
select Payment_Method, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellatio_rate
from hospitality_revenue_sql
group by Payment_Method
order by total_revenue desc;

#MONTHLY REVENUE
select MONTH, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellatio_rate
from hospitality_revenue_sql
group by MONTH
order by total_revenue desc;

#LEAD TIME ANALYSIS
SELECT 
	case when LEAD_TIME<=7 then '0 - 7 days'
		when LEAD_TIME<=30 then '8 - 30 days'
		when LEAD_TIME<=90 then '31 - 90 days'
		when LEAD_TIME<=180 then '91 - 180 days'
			else'180+ days'
		end as lead_time_group,
	count(*) as bookings,
    sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellation_rate
from hospitality_revenue_sql
group by lead_time_group
order by bookings desc;

#REPEAT vs NEW GUEST
select IS_REPEATED_GUEST, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellatio_rate
from hospitality_revenue_sql
group by IS_REPEATED_GUEST
order by total_revenue desc;

#STAY DURATION ANALYSIS
select TOTAL_NIGHTS, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellation_rate
from hospitality_revenue_sql
group by TOTAL_NIGHTS
order by TOTAL_NIGHTS asc;

#DISCOUNT PERCENT IMPACT
select DISCOUNT_PERCENTAGE, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellation_rate
from hospitality_revenue_sql
group by DISCOUNT_PERCENTAGE
order by DISCOUNT_PERCENTAGE asc;

#CUSTOMER SEG + BOOKING PLATFORM ANALYSIS
select CUSTOMER_SEGMENT, BOOKING_PLATFORM, count(*) as bookings,
	sum(FINAL_REVENUE) as total_revenue,
    avg(ADR) as avg_adr,
    sum(BOOKING_STATUS='cancelled')*100/count(*)as cancellation_rate
from hospitality_revenue_sql
group by CUSTOMER_SEGMENT, BOOKING_PLATFORM
order by total_revenue asc;