class Person
  attr_reader :name, :happiness, :hygiene
  attr_accessor :bank_account

  def initialize(name)
    @name = name
    @bank_account = 25
    @happiness = 8
    @hygiene  = 8
  end

  def hygiene=(num)
    @hygiene = num
    check_min_max
  end

  def happiness=(num)
    @happiness = num
    check_min_max
  end

  def clean?
    @hygiene>7
  end

  def happy?
    @happiness>7
  end

  def get_paid(salary)
    @bank_account += salary
    "all about the benjamins"
  end

  def check_min_max
    @hygiene = 10 if @hygiene > 10
    @hygiene = 0 if @hygiene < 0
    @happiness = 10 if @happiness > 10
    @happiness = 0 if @happiness < 0
  end

  def take_bath
    self.hygiene += 4
    check_min_max
    "♪ Rub-a-dub just relaxing in the tub ♫"
  end

  def work_out
    self.hygiene -= 3
    self.happiness += 2
    check_min_max
    "♪ another one bites the dust ♫"
  end

  def call_friend(callee)
    self.happiness += 3
    check_min_max
    callee.happiness += 3
    callee.check_min_max
    "Hi #{callee.name}! It's #{self.name}. How are you?"
  end

  def start_conversation(friend, topic)
    if topic == "politics"
      [self, friend].map do |person|
        person.happiness -= 2
        person.check_min_max
      end
      "blah blah partisan blah lobbyist"
    elsif topic == "weather"
      self.happiness += 1
      check_min_max
      friend.happiness +=1
      friend.check_min_max
      "blah blah sun blah rain"
    else
      "blah blah blah blah blah"
    end
  end
end
