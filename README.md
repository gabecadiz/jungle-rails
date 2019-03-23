# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

#Features
## User Authentication
* A new user can go to the registration page and create a new account
* A user can log into their account by going to the login page
* passwords are saved on the database using bcrypt gem

##Soldout Badge
* When a product has a quantity of 0, a sold out badge appears and product can no longer be added to cart.

##Order Details
* Once a user checks out their order, their order details will be displayed.
* Users will receieve an formatted HTML email receipt with their order details

##Feature Product Rating
* Visitors and users can view individual and overall ratings of a product
* Only logged in users can create reviews
* Only the creator of the review can delete their product review

##Admin Categories
* Admins can list and create new categories
* Admins can add new producings using new or existing categories

#Examples

##User Authentication

##Soldout Badge

##Order Details

##Feature Product Rating

##Admin Categories

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
