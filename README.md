# VidCant
It was supposed to be vidcan(covid canada) but I decided to make it can't :)

I built this simple project using rails and react specially for Samsung ads interview using part of their stack.

There is a task that wakes up every day at 2 am and fetches Canada's official covid-19 stats from this file
<https://health-infobase.canada.ca/src/data/covidLive/covid19.csv>
and updates the database.

## Note
This project was built in few hours and needs a lot of polishing.

## Versions
* Ruby version
  `2.7.1p83`

* Rails version
  `6.0.3.2`

## How to start
  ```bash
  bundle install
  yarn
rails db:create
rails db:migrate
```
The task will be scheduled automatically to start as 2 am. if you want to fetch the data manually, use `bundle exec rake fetch_data:update` OR click on enque now in <http://localhost:3000/sidekiq/cron>
 
## GraphQl
To test end points use <http://localhost:3000/graphiql>

### Queries

Canada stats in the last 10 days.
```
{
  canada {
    id
    pruid
    prname
    date
    numconf
    numtotal
    numrecover
    numdeaths   
  }
}
```

The stats of the biggest 3 provinces last day.
```
{
  radar {
    name
    numconf
    ratetotal
    numdeaths
    percentdeath
    ratetested
    numactive
  }
}
```

## Todo
* Making `ProvinceUpdater` class singeltone
* Automated testing.
* The domain of the radar axes are hard coded.
* Learn more about apollo.js 
