Requirements
1) Use the Ruby on Rails framework. {X}:  used rails new filenam

2) Your models must:

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships {X}: 
    -user has_many messages, 
    -message belongs_to user, 
    -user has_many businesses, through: :user_businesses 
    -business has_many :projects, through: :departments

• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user {X}: 
    -user has_many businesses, through: :user_businesses 
    -business has_many applicants, through: :applications

3) Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.{X}:
    - for the user model: validates password, lenght: {minimum: 8}

4) You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

5) Your application must provide standard user authentication, including signup, login, logout, and passwords. {X}: used bycript gem

6) Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...{X}: 
    - used omniauth-github

7) You must include and make use of a nested resource with the appropriate RESTful URLs.{X}:
    -   resources :project do
            resources :goals
        end


• You must include a nested new route with form that relates to the parent resource {X}:
    -created a department that belongs to a business with a nested route.
    

• You must include a nested index or show route {X}
    -show page for the chat_room

8) Your forms should correctly display validation errors.{X}
    -creation of a user can show the errors.

a. Your fields should be enclosed within a fields_with_errors class{X}

b. Error messages describing the validation failures must be present within the view.{X}

9) Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.{X}

• Your views should use helper methods and partials when appropriate.{X}

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.{X}

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.{X}
    -used rails g ressource model_name