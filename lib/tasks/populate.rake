namespace :db do
  desc "Erase and fill  Articles data."
  task :populate => :environment do
    require 'populator'
    Article.delete_all
    Article.populate 100 do |article|
      article.title   = Populator.words(1..5).titleize
      article.content = Populator.sentences(2..10)
    end
  end
end
