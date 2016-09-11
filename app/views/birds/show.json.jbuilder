json.extract! @bird, :id, :name, :family,  :added, :visible
json.continents @bird.continents.collect(&:name)