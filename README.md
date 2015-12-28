# Rocket, Paper-plane, Scissors Challenge!

## Learning Objectives
- using Rspec with Rails
- familiarize yourself with rspec style
- write code to fix tests
- write tests to fix code

## Summary

This is a little variation on rock, paper, scissors.  The user gets
to choose Rocket, Paper-plane, or Scissors.  Then the computer
randomly "throws" and we determine a winner.

This app works and is pretty spiffy, but we have a bunch of untested
code and a bunch of tests that are failing.

Can you help us by fixing them?

## Releases

### Constraints

1. You are not allowed to edit existing views 
2. You are not allowed to modify existing tests

### Release 0: Run it

1. Clone the repository
2. `bundle`
3. Set up your database `rake db:setup`
4. Start the Rails application by running 
`bundle exec rails server`

Play around and get a feel for the app.

### Release 1: Fix the existing tests

We need to fix the Rails application so that the existing tests pass, but before you begin let's talk about a couple new things that rails-rspec introduces.

#### rspec-rails Controller Helpers

Some of the methods in `games_controller_spec.rb` will be new to you. Let's talk about a couple of them briefly just to get you started off on the right foot.

##### `get`, `post`, `put`, `delete`

rails-rspec includes some helpers to help you run your controller actions and test them. For example, `get` issues a GET request against your app.

The first argument to these helpers is the method on the controller that should be run. The second argument is a hash that will become the `params` hash.

Examples:

```ruby
get(:show, {id: 37})
```

This will perform a GET request running the method `show` on the controller, providing `{'id' => 37}` as the params. This means that `GamesController#show` will run and `params` will contain `{'id' => 37}`.

```ruby
post(:create, {first:'foo', last:'bar'})
```

This will perform a POST to the method `create` and set the `params` hash to `{'first' => 'foo', 'last' => 'bar'}` inside the `create` method.

##### `assigns`

`assigns` is a helper in Rspec that lets you check what instance variables got assigned by a controller action. For example, I might run `get(:show, {id: 1})` to run my `GamesController#show` action, then check what instance variables got assigned and what their values are.

In this case of `GamesController#show`, I probably want to make sure `@game` got assigned to a game. I could say:

```ruby
get(:show, {id: some_game_id}) #do a GET request to #show
expect(assigns(:game)).to_not be_nil #See if @game got set
expect(assigns(:game)).to be_a(Game) #Check if it's a Game
```

### Release 2: Implement pending tests
Implement test sections marked as `pending`, and implement tests that are labeled with `skip` (you'll need to change `skip` to `it` if you want them to run).

### Release 3: Implement integration tests
Implement the feature tests in `spec/features`.

Check the [Capybara docs](https://github.com/jnicklas/capybara) to see the API available to you.

### Release 4: Ties!

Did you notice that the game doesn't handle ties?

Using BDD, implement the logic to handle a tie.

## Resources

The following screencasts are HIGHLY recommended:

 - http://railscasts.com/episodes/257-request-specs-and-capybara
 - http://railscasts.com/episodes/275-how-i-test

