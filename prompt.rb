class Prompt
  def initialize(message, valid_options)
    @message = message
    @valid_options = valid_options
  end

  def gets
    choice = get_choice
    until valid_options.include?(choice)
      puts "Invalid choice #{choice}"
      choice = get_choice
    end
    choice
  end

  private

  attr_reader :message, :valid_options

  def get_choice
    print "#{message} > "
    $stdin.gets.chomp
  end
end
