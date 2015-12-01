# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
   # p movie
    Movie.create!(movie)
  end
end

Then /the director of "([^"]+)" should be "([^"]+)"/ do |title, director| 
  Movie.find_by_title(title).director.should == director
  expect(Movie.find_by_title(title).director).to eq(director)
end

# Then /I should see (\d+) movies$/ do |movie_count|
#   movies_shown = page.all("#movies tbody td:nth-child(1)").map { |m| m.text }
#   movies_shown.count.should == movie_count.to_i
# end

# # Make sure that one string (regexp) occurs before or after another one
# #   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
 #  ensure that that e1 occurs before e2.
 #  page.body is the entire content of the page as a string.
 movies_shown = page.all("#movies tbody td:nth-child(1)").map { |m| m.text }
  
 (movies_shown.index("#{e1}") < movies_shown.index("#{e2}")).should be true
end

# # Make it easier to express checking or unchecking several boxes at once
# #  "When I uncheck the following ratings: PG, G, R"
# #  "When I check the following ratings: G"

# When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
#   # HINT: use String#split to split up the rating_list, then
#   #   iterate over the ratings and reuse the "When I check..." or
#   #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#   rating_list.split(/\s*,\s*/).each do |rating|
#     if uncheck.nil?
#       step %Q{I check "ratings_#{rating}"}
#     else
#       step %Q{I uncheck "ratings_#{rating}"}
#     end
#   end
# end

# Then /I should see all of the movies/ do
#   # Make sure that all the movies in the app are visible in the table
#   movies_shown = page.all("#movies tbody td:nth-child(1)").map { |m| m.text }
#   movies_shown.count.should == Movie.count
# end
