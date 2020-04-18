# frozen_string_literal: true

Given('categories with the following data are Created') do |table|
    table.hashes.each do |record|
    Category.create(
      id: record['id'],
      name: record['name']
    )
  end
end
