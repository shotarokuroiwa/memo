require 'csv'

input = nil

loop do
    puts "新しいファイルを作る場合は1、既存のファイルを追記する場合は2を押してください" 
    input = gets.to_i
    break if input == 1 || input == 2
    puts "無効な値です。1 (新規作成)または、2 (追記)を入力してください"
end

if input == 1
    puts "ファイル名を入力してください"
    file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "終了: Windowsは Ctrl+Z → Enter / Mac・Linuxは Ctrl+D"
    file_content = STDIN.read
    file_content = file_content.gsub("\u001A", "")
    CSV.open("#{file_name}.csv", "w") do |csv|
        csv << [file_content]
    end
elsif input == 2
    puts "ファイル名を入力してください"
    file_name = gets.chomp
    puts "メモしたい内容を入力してください"
    puts "完了したらEnterを押してください"
    file_content = STDIN.read
    file_content = file_content.gsub("\u001A", "")
    CSV.open("#{file_name}.csv", "a") do |csv|
        csv << [file_content]
    end
end
    