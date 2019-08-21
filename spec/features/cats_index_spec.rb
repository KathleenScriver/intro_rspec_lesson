require 'rails_helper'

describe 'Cats Index' do
  it 'shows all cats names' do
    cat_1 = Cat.create(name: "Fluffy", breed: "Long-hair")
    cat_2 = Cat.create(name: "Bob", breed: "Long-hair")
    cat_3 = Cat.create(name: "Kitty", breed: "Tabby")

    visit cats_path

    expect(page).to have_content(cat_1.name)
    expect(page).to have_content(cat_2.name)
    expect(page).to have_content(cat_3.name)
  end

  it 'makes a new cat' do
    cat_1 = Cat.create(name: "Fluffy", breed: "Long-hair")
    cat_2 = Cat.create(name: "Bob", breed: "Long-hair")

    visit new_cat_path

    fill_in :cat_name, with: "Meowface"
    fill_in :cat_breed, with: "Siamese"
    click_on "Create Cat"

    expect(current_path).to eq(cats_path)
    expect(page).to have_content("Meowface")
  end
end
