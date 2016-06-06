# Rock, Paper, Scissors!

## Learning Objectives
- using Rspec with Rails
- familiarize yourself with rspec style
- write code to fix tests
- write tests to fix code

## Summary

This is a rock, paper, scissors application.  The user chooses to throw rock, paper, or scissors.  Then the computer throws a random shape, and we determine a winner.

How do we determine if the user or the computer is the winner?  It depends on who throws which shape.  Rock crushes scissors, paper covers rock, and scissors cut paper.  So, if the user throws scissors and the computer throws paper, the user wins because scissors cut paper.

This app works and is pretty spiffy, but we have a bunch of untested
code and a bunch of tests that are failing.

Can you help us by fixing them?


### Testing Configuration
Our application's testing setup has been configured to differ from the Rails convention.  We're testing our application with RSpec rather than the default Test Unit.  Our app uses the [rspec-rails][rspec-rails] gem, which provides some methods and RSpec matchers specific to testing a Rails app.  We also use [Capybara][].


## Releases
### Pre-release: Run the Application
We have a fully functional application—we're going to write tests for it.  Before we begin testing the application, let's explore how it works.

1. Clone the repository.
2. Install the required gems: `bundle install`.
3. Set up the database: `bundle exec rake db:setup`
4. Start the application: `bundle exec rails server`
5. Get a feel for the app by playing a few rounds.

*Note:* As you explore the application, you might notice that ties aren't recorded as ties; we'll deal with this later.


### Release 0: Model Specs
Our test suite contains a mixture of passing tests and pending tests.  We're going to work through all of the pending tests, writing them out so that they describe how our application behaves.  We've been working with model specs throughout our time at Dev Bootcamp, so we'll begin this challenge by completing the tests for our `Game` model (see `app/models/game.rb`).  The model includes a number of custom behaviors for which we need to write tests:  one class method and a handful of instance methods.

Model specs are saved in the `spec/models` directory where we'll see some tests already written in the file `spec/models/game_spec.rb`.  Some are passing, and some are pending.  Write out the pending tests to describe the behaviors of the `Game` model.

Run the model specs with `bundle exec rake spec:models`.


### Release 1: Routing Specs
Routing specs test whether or not making an HTTP request to a path results in running a specific controller action.  For example, if we make a GET request to `/games`, we expect to run the `games#index` action.

[Routing specs][] are saved in the `spec/routing` directory.  Looking there in our application, we'll see that routing tests for games have been written.  Read the tests.  Do we understand what they are testing?  Notice that they make use of the `route_to` matcher, which is part of `rspec-rails`.

Run the routing specs:  `bundle exec rake spec:routing`.

The tests for the games routes are passing, but we have one pending test that we need to write ourselves.  What controller action is run when we visit the root path?  Write the test to describe which action is run when visiting the root path and then update the test description.


### Release 2: Implement pending tests
Implement test sections marked as `pending`, and implement tests that are labeled with `skip` (you'll need to change `skip` to `it` if you want them to run).


#### Constraints

1. You are not allowed to edit existing views 
2. You are not allowed to modify existing tests


#### rspec-rails Controller Helpers

Some of the methods in `games_controller_spec.rb` will be new to you. Let's talk about a couple of them briefly just to get you started off on the right foot.

##### `get`, `post`, `put`, `delete`

rails-rspec includes some helpers to help you run your controller actions and test them. For example, `get` issues a GET request to your Rails app, allowing you to test what happens when a certain controller action runs.

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


### Release 3: Implement integration tests
Implement the feature tests in `spec/features`. Feature tests mimic an actual user visiting your site and clicking on things.

#### A quick note on mocks
We want to test situations that depend on the computer or user winning, which means we can't let the computer throw be random, we need to force a certain outcome.

It's not uncommon to want to override or force certain behavior in tests, and one way to do this is with "mocking."

Let's say we gave a game, and we want to make sure the computer always throws "scissors". In Rspec, we could do this:

```ruby
game = Game.new(user_throw: 'rock')
allow(game).to receive(:computer_throw).and_return('scissors')
```

The example above says "hey, if someone calls the method `#computer_throw` on my `game` object, don't actually run it — instead just return `scissors`."

This is particularly useful when you have code that has random behavior (like randomly choosing a throw for the computer). You can't write reliable tests if your code has random behavior, so we force it into a certain state using mocks.

In the case of your feature tests, you need to make sure the computer makes a certain throw if you're going to test a losing case vs a winning case. Since the feature doesn't have access to the game object we will override (or "mock out") any call to `computer_throw` on any instance of `Game` like this.

```ruby
allow_any_instance_of(Game).to receive(:computer_throw).and_return('paper')
```

What's above is just an example, but use something like it in your feature tests to force instances of `Game` to have a specific outcome.

That covers the computer side, but you'll need to fake out a user clicking on things to set the user throw. Check the [Capybara docs](https://github.com/jnicklas/capybara) to see the API available to you.

### Release 4: Ties!

Did you notice that the game doesn't handle ties?

Using BDD, implement the logic to handle a tie.

## Resources

The following screencasts are HIGHLY recommended:

 - http://railscasts.com/episodes/257-request-specs-and-capybara
 - http://railscasts.com/episodes/275-how-i-test


[routing specs]: https://github.com/rspec/rspec-rails#routing-specs
[rspec-rails]: https://github.com/rspec/rspec-rails
[capybara]: https://github.com/jnicklas/capybara

