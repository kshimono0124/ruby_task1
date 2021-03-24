require "csv"
require 'fileutils'

PATH = "/home/ec2-user/environment/memo/"
puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i

# //続きを書いていきましょう！！(ifで条件分岐)
if memo_type == 1
  puts "拡張子を除いたファイルを入力してください"
  filename = gets.chomp
  FileUtils.touch(PATH + "#{filename}.csv")
  p "メモしたい内容を記入してください"
  p "完了したらCtrl + dをおします"
  contents = gets.chomp
  CSV.open("#{filename}.csv", "w") do |csv|
    csv << [contents]
  end
elsif memo_type == 2
  puts "どのファイルを編集しますか"
  filename = gets.chomp
  data_list = CSV.read(PATH + "#{filename}.csv")
  p "メモしたい内容を記入してください"
  p "完了したらCtrl + dをおします"
  data_list = gets.chomp
  CSV.open("#{filename}.csv", "a") do |csv|
    csv << [data_list]
  end
else
  puts "1か２を選択してください"
  
end