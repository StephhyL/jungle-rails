# Jungle

An online store where customers can purchase the most unique items using their credit cards at checkout! Admin can adjust the product inventory, the categories, and any sales!

### Tested with:

- Capybara

### Please note:

Application is built with Rails 4.2 and the base code was from Lighthouse Lab.

## Final Product

## Getting Started

1. Run bundle install to install dependencies
2. Create config/database.yml by copying config/database.example.yml
3. Create config/secrets.yml by copying config/secrets.example.yml
4. Run bin/rake db:reset to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
- Capybara
- bcrypt
