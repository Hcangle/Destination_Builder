Requirements
Use the Ruby on Rails framework.

Your models must:

• Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships

• Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

Your application must provide standard user authentication, including signup, login, logout, and passwords.

Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

Your forms should correctly display validation errors.

a. Your fields should be enclosed within a fields_with_errors class

b. Error messages describing the validation failures must be present within the view.

Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.

Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.




* scope method: filter routes by  
* model method: return duration of route based on duration of directions 
* view helper method: converts duration format into hours and minutes 
* helper method: 



# TO DO 
* Destinations 
  - db 
    - name, 
  - Controller 
    - index 
 - Model 

 - App Routes 
  - get '/destination', to: 'destination#index'

* Views 
  - index    

* Routes 
  - Controller 
    - index 
    - new 
    - create
  - App Routes  
    - get '/routes', to: 'routes#index'
    - get '/routes/new', to: 'routes#new'
    - get '/routes/create', to: 'routes#create'
    
  - Directions(Join table) 
   
   - Controller 
     * new 
     * index 
     * create

     - App Routes 
      * get '/routes/:route_id/directions', to: 'directions#index'
      * get '/routes/:route_id/directions/new', to: 'directions#new'
      * get 'directions', to: 'directions#create'

     - Views 
      * new => nested under routes 
      * index => nested under routes 

* USERS

* OATH



* Routes Index 
 <h3><%= link_to route.name, routes_direcitions_path(route) %></h3>
 <%= format_duration_hours_and_minutes(routes.duration) %>