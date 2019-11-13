# README: BUSINESS_BUILDER

* Short Description 
 Business_Builder is an app design to mock the structure of a business.

* Download the repo
 `git clone git@github.com:armel50/business_builder.git`

* Features
 - Login 
    User can login via github: `gem "omniauth-github"`
    User can login directly through the app 
- Interaction 
    User can `CRUD` business only if the user is signed in as an `ADMIN`
    User can apply to a business only if the user is `NOT ADMIN`
    User can `CRUD`projects 
    User can create and delete goals for the projects 
    User can update the progression of the projects by checking a goal
    User can create and delete a chat_room only if user is `ADMIN`
    User can experience the real time chat app: `action cable`
    User can send files: `gem shrine`

* Rails version
    - gem 'rails', '~> 5.2.3'

* DB used 
    - SQLite3
* Front-end
    - Semantin Ui
    - JavaScript
    - jQuery
* Back-end 
    - Ruby
* Documentation 
    - site-point blog about action cable: https://www.sitepoint.com/create-a-chat-app-with-rails-5-actioncable-and-devise/
    
    - scotch blog about action calbe: https://scotch.io/tutorials/uploading-files-with-rails-and-actioncable
    - video about action cable: https://www.youtube.com/watch?v=tyNepRO_ERc
