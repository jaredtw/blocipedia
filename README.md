# Blocipedia

### SaaS Wiki Collaboration Tool

Users can create, edit and collaborate on markdown wikis.

## Project Objectives

- Users can sign up for a free account by providing a user name, password and email
- Users can sign in and out of Blocipedia
- Users with a standard account, can create, read, update, and delete public wikis
- User roles available: admin, standard, or premium
- Development database is seeded automatically with users and wikis
- Users can upgrade account from a free to a paid plan
- Users can create private wikis
- Users can edit wikis using Markdown syntax
- Users can add and remove collaborators for private wikis
- Users have readable URLs on wikis

## Built With

#### Languages and Frameworks:
- Ruby 2.4.1
- Rails 5.1.4
- Bootstrap

#### Databases:
- SQLite (Test, Development)
- PostgreSQL (Production)

#### Tools and Gems:
- Devise for user authentication
- Pundit for user authorization
- Stripe for payment processing
- Redcarpet for Markdown formatting
- Faker for seeding fake data
- FriendlyId 5.1.0 for human friendly URLs

## Setup and Configuration

#### Setup:

#### To run Blocipedia locally:

1. Clone the repository
2. Run `bundle install`
3. Create and migrate the database with `rake db:create` and `rake db:migrate`cd
4. Start the server using `rails server`
5. Run the app on `localhost:3000`
