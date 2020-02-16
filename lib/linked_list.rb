
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    def add_first(value)
      current = @head
      # add new node with provided value and set next to current
      new_node = Node.new(value, current)
      # new node becomes head
      @head = new_node
    end

    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      # if the list is empty, head is nil
      if @head.nil?
        return nil
      else 
        value = @head.data
        return value
      end
    end
 
    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    def search(value)
      current = @head

      until current.nil?  
        return true if current.data == value
        current = current.next
      end

      return false
      
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      
      if @head.nil?
        return nil 
      end

      max = @head.data
      current = @head

      until current.next.nil?
        if current.data > max 
          max = current.data
        end
        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min

      if @head.nil?
        return nil 
      end

      min = @head.data
      current = @head

      until current.next.nil?
        if current.data > min 
          min = current.data
        end
        current = current.next
      end

      return min

    end

    # method that returns the length of the singly linked list
    def length
      if @head.nil?
        return 0
      else
        length = 1
        current = @head
        until current.next.nil?
          current = current.next
          length += 1
        end
      return length
      end
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      raise NotImplementedError
    end

    # method to print all the values in the linked list
    def visit
      raise NotImplementedError
    end

    # method to delete the first node found with specified value
    def delete(value)
      raise NotImplementedError
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      raise NotImplementedError
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      raise NotImplementedError
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      raise NotImplementedError
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      
      # if list is empty, insert the new value at the head
      if @head.nil?
        @head = Node.new(value, nil)
        return @head
      end 

      # otherwise, traverse the list from start to last node ...
      current = @head
      until current.next.nil?
        current = current.next
      end

      # ... and insert new node after last node
      current.next = Node.new(value, nil)

    end

    # method that returns the value of the last node in the linked list
    def get_last
      # return nil if the linked list is empty
      if @head.nil?
        return nil
      end

      # otherwise, go to end of list ...
      current = @head
      until current.next.nil?
        # ... until 'current' is the last node ...
        current = current.next
      end

      # ... and return data from last node
      return current.data

    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      raise NotImplementedError
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
