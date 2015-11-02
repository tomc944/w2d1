class Employee

  attr_accessor :name, :title, :salary, :boss, :sub_employees

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = (self.salary) * multiplier
  end

end


class Manager < Employee

  def initialize(name, title, salary, boss = nil, sub_employees)
    super(name, title, salary, boss)
    @sub_employees = sub_employees
  end

  def bonus(multiplier)
    total_sum = 0

    sub_employees.each do |sub_employee|
      total_sum += sub_employee.salary
    end

    bonus = total_sum * multiplier
  end


end


shawna = Employee.new(:shawna, :TA, 12000, :Darren)
david = Employee.new(:David, :TA, 10000, :Darren)
darren = Manager.new(:Darren, :ta_manager, 78000, :Ned, [shawna, david])
ned = Manager.new(:Ned, :Founder, 1000000, nil, [shawna, david, darren])




puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
