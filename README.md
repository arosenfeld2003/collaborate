# See It Live: [BASECAMP](https://stormy-crag-63797.herokuapp.com/)

This is a clone of the popular project management app Basecamp.  It was built with two other fellows at Qwasar Silicon Valley.  Our app includes the ability for users to create an authenticated account with multiple projects.  Projects can have many members, with varying permissions to view/edit the project.  Each project can have discussion threads (with sub-threads), attachments (text or image files), and tasks  (with sub-tasks) to be completed.

My specific contributions include:
- Create initial framework of the app and database (with Active Record and Devise gem)
- Allow users to add attachments (Active Storage gem)
- Add user permissions (admin privileges) to the Model and database
- Refactor of Tasks (Model, Controller, Views)
- Update Tasks schema to use a self-join for sub-tasks
- Refactor Javascript for filtering views on front-end
- Migrate database from SQLite to postgreSQL for Heroku deploy
- Numerous bug fixes and minor tweaks to front-end (CSS)

Each member of the team was intimately involved in building our version of Basecamp, and we duplicated much of the functionality in order to learn as much as possible during the process.  For each of us, this was a first experience building a web app using Ruby on Rails.