# AskIt2 
Questions&Answers app I built on Rails course by @IlyaBodrovKrukowski

## Features:

- **Manage questions:** Add, edit, and delete questions  
- **Comments system:** Users can leave comments on questions  
- **User authentication from scratch:** Implemented using `bcrypt-ruby` gem  
- **Email notifications:** Password reset and other emails sent via `ActionMailer`  
- **Tags system:** Many-to-many relationship for tags, displayed using `TomSelect`  
- **Authorization with Pundit:** Role-based access control  
- **Background jobs:** Export users using `Sidekiq`  

Localization with i18n:
<p align="center">
  <img src="https://github.com/user-attachments/assets/04cb11e9-33c1-41ce-b632-1eaa6d353ce1">
</p>

Admin panel, where you can delete and create new users:
<p align="center">
  <img src="https://github.com/user-attachments/assets/f68c284e-4c60-4d2c-99c4-a53f286ffce5">
</p>

## Installation

Ensure you have Ruby and Bundler installed. Then, install the required gems:

```sh
bundle install
```

Set up the database:

```sh
rails db:create db:migrate db:seed
```

## Running the Application

To start the application, run:

```sh
bin/dev
```

