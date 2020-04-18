# frozen_string_literal: true

Given('pets with the following data are Created') do |table|
  
  table.hashes.each do |record|
    Pet.create(
      id: record['id'],
      name: record['name'],
      status: record['status'],
      photo_urls: record['photo_urls'].split(','),
      tags: record['tags'].split(','),
      category_id: record['category_id'],
      owner_id: record['owner_id']
    )
  end
end
