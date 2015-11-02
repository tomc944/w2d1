class Employee

  attr_accessor :name, :title, :salary, :boss

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
    bonus =


end


ned = Employee.new(Ned, Founder, 1000000)
darren = Manager.new(Darren, TA Manager, 78000, Ned)
shawna = Employee.new(Shawna, TA, 12000, Darren)
david = Employee.new(David, TA, 10000, Darren)
