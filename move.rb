class Move
  attr_reader :name, :label, :outcomes

  def initialize(options)
    @name = options.fetch("name")
    @label = options.fetch("label")
    @outcomes = options.fetch("outcomes")
  end
end
