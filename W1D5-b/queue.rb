class Queue
  def initialize
    @queue = []
  end

#adds to the end of the queue
  def enqueue(el)
    @queue.push(el)
  end

#removes from the front of the queue
  def dequeque
    @queue.shift
  end

  def show
    @queue.dup
  end
end

sample = Queue.new
sample.enqueue(4)
sample.enqueue(5)
sample.dequeque #removes from front
p sample.show #should show [5]
