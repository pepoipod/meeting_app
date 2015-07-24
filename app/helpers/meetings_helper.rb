module MeetingsHelper
  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
  end

  def replaceNumToTopic(text)
    replaced_text = ""

    text.each_line do |line|
      word_arr = line.split
      word_arr.each do |word|
        if integer_string?(word.delete("#")) && word.start_with?("#")
          if Topic.exists?(id: Integer(word.delete("#")))
            topic = Topic.find(Integer(word.delete("#")))
            line[word] = check_box_tag("", topic.id, topic.finished_flg) + link_to("##{topic.id} #{topic.title}", "/topics/#{topic.id}")
          end
        end
      end
      replaced_text += line
    end
    replaced_text
  end
end