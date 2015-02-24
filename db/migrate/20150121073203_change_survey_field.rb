class ChangeSurveyField < ActiveRecord::Migration
  def change
    change_table :surveys  do |t|
      t.rename :number_of_people, :count_people
    end
  end
end
