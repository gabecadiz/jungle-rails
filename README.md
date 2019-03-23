# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

#Features
## User Authentication
* A new user can go to the registration page and create a new account with a unique email address
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
![User can create a new account with a unique email](https://github.com/gabecadiz/jungle-rails/blob/master/docs/jungle-signup.gif)

![User can login once they have created an account](https://github.com/gabecadiz/jungle-rails/blob/master/docs/jungle-user-login.gif)

##Soldout Badge
![Soldout products display a soldout badge and can not be added to cart](https://github.com/gabecadiz/jungle-rails/blob/master/docs/jungle-product-index.gif)

##Order Details
![Order details are displayed once a user checks out successfully](https://github.com/gabecadiz/jungle-rails/blob/master/docs/jungle-cart-checkout.gif)

##Feature Product Rating
![Products display user reviews](https://github.com/gabecadiz/jungle-rails/blob/master/docs/jungle-product-review.gif)

##Admin Categories
![Admin create products and categories feature](https://github.com/gabecadiz/jungle-rails/blob/master/docs/jungle-admin-features.gif)

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
