## Ad Placement Challenge
* db:create, db:migrate, db:seed
* Delivery and placement objects should seed via seeding but also can be manually seeded with Delivery.seed or Placement.seed
* Placement.total_impressions should print the total impressions in the format expected.
* Delivery.between_dates_impressions(start, end) should give total impressions between two STRING dates (mm/dd/YYYY).
* Delivery.between_dates_cost(start, end) should give the total impressions per cmp between two STRING dates (mm/dd/YYYY).
* Delivery.between_dates_print(start, finish) should print the total impressions per cmp as well as the total impression amount between dates (mm/dd/YYYY) in provided format.
* Tests can be run with rails test. Speaking of those tests, I left one test of mine edited out. If brought in I wanted to ask questions about why I'm getting different output in my terminal than I'm getting in my tests while using the same variables.
* If I'm missing anything please let me know.