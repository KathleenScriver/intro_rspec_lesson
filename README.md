# Intro to RSpec

## Warmup
  - Take 3 minutes to write reasons _why_ we test. Also, jot down some ideas of _what_ we would want to test.

## Getting Setup
- The easiest way to get setup for using RSpec is to start your new rails app with the `-T` tag.
- If you didn't do this, there are tons of resources for configuring your Rails project with RSpec. Do a google search for a blog or instructions on converting.

If you started your Rails project with the `-T` flag, follow these steps to get RSpec setup:
  - install these gems to the `:test, :development` block in your Gemfile:
   - 'rspec-rails'
   - 'launchy'
   - 'capybara'
   - 'database_cleaner'
  - run `bundle`
  - run `rails g rspec:install`

In `./spec/rails_helper`
  - before the RSpec block, add
  ```
  require 'rspec/rails'
  require 'pry'
  DatabaseCleaner.strategy = :truncation
  ```
  - inside the RSpec block, add
  ```
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before :each do
    DatabaseCleaner.clean
  end

  config.after :each do
    DatabaseCleaner.clean
  end
```

  - In `.rspec` file, add
  ```
    --require spec_helper
    --color
    --format=documentation
    --order=random
  ```

## Writing Specs

Your `/spec` directory will now hold all your test files.
Can make subdirectories for `./features` and `./models` to hold relevant tests.

Each file name should indicate what it is testing, and then end in `_spec.rb`.
Example: `./spec/features/cats_index_spec.rb` would hold all feature tests for the cats index page.

Each test file should start with `require rails_helper`.

**Test structure:**
  - start with a describe block to explain what the file is testing:
  ```
  describe 'Cats index' do
  .
  .
  .
  end
  ```

  - within the describe block, use `it` blocks to test for single features within the scope of the `describe` block:
  ```
  describe 'Cats Index' do
      it 'shows all cats names' do
        .
        .
        .
      end
  end
  ```

  - each `it` block should have a *setup*, *execution*, *expectation or assertion*, then a *teardown* (database_cleaner does our teardown for us)
  ```
  describe 'Cats Index' do
      it 'shows all cats names' do
        cat_1 = Cat.create(name: "Fluffy", breed: "Long-hair")
        cat_2 = Cat.create(name: "Bob", breed: "Long-hair")
        cat_3 = Cat.create(name: "Kitty", breed: "Tabby")

        visit 'cats_path'

        expect(page).to have_content(cat_1.name)
        expect(page).to have_content(cat_2.name)
        expect(page).to have_content(cat_3.name)
      end
  end
  ```

  - Run test by typing `rspec` in your terminal.

  - Let's use our Launchy gem. Add `save_and_open_page` just below your `visit cats_path` command in your test. (Great debugging tool!)

  - You can also add a `binding.pry` within a spec!

## Activity

With your partner, pick a lab from Learn, open the Github repo, look at the spec files. Talk about a few tests.
  - Can you identify the setup, execution, and expectation sections?
  - What is this test looking for?
  - Using these examples, as well as the [Capybara Docs](https://github.com/teamcapybara/capybara) (for syntax and keywords), work with your partner to write a spec to test that a user can fill out the new cat form and can successfully create a new cat.

## Deliverable

Slack to me:
  - Inside an `it` block, what is the structure of a test? Include examples.
