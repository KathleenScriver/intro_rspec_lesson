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
end
