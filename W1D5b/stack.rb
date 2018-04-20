class Stack
  def initialize
    @stack = []
  end

#adds to the top of the stack
  def add(el)
    @stack.push(el)
  end

#removes from the top of the stack
  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end

sample2 = Stack.new
sample2.add(1)
sample2.add(2)
sample2.remove #removes from the end
sample2.add(3)
p sample2.show #returns [1,3]
