# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  s = 0
  arr.each{|x| s += x}
  return s
end

def max_2_sum arr
    if arr.length == 0
        return 0
    elsif arr.length == 1
        return arr[0]
    else # the array contains at least 2 integers
        # Find the 2 largest integers and return their sum
        max1 = arr.max
        # Remove the max element and call max again to find the second largest element
        arr.delete_at(arr.index(max1))
        max2 = arr.max
        return max1 + max2
    end
end

def sum_to_n? arr, n
    # For every element in the array which is less than n, check if the difference of 
    # n and the element exists in the array. Return true if it does, false otherwise.
    arr.each{ |elem|
        if elem <= n
            arr1 = arr - [elem]
            if arr1.include?(n-elem)
                return true
            end
        end
    }
    return false
end

# Part 2

def hello(name)
    return "Hello, " << name
end

def starts_with_consonant? s
    # take the first letter of the string and check if it is a letter but not one of a, e, i, o, u
    vowels = ['a', 'e', 'i', 'o', 'u']
    consonants = ("a".."z").to_a - vowels
    firstLetter = s.downcase[0]
    if consonants.include?(firstLetter)
        return true
    end
    return false
end

def binary_multiple_of_4? s
    # The best way I can think of is to use regular expressions to check if the string only
    # contains 1s and 0s with the last 2 digits being 00.
    return s.match?(/^[0-1]*00$|^0$/)
end

# Part 3

class BookInStock
    def initialize(isbn, price)
        # Call the setter methods instead of just assigning the values since the setter methods 
        # have the exception handling defined and it makes no sense to repeat the same here.
        self.isbn = isbn
        self.price = price
    end
    def isbn
        return @isbn
    end
    # The "=" in the setter method is a clever idea, it allows clear distinction between the getter and setter 
    # methods. Also, the method can be invoked as book.isbn = "bs-124-234" and Ruby calls the isbn= method under 
    # the hood.
    def isbn=(isbn)
        # Check for empty string in isbn
        if isbn.length == 0
            raise ArgumentError.new("isbn cannot be an empty string!")
        end
        @isbn = isbn
    end
    def price
        return @price
    end
    def price_as_string
        return sprintf("$%.2f",@price)
    end
    def price=(price)
        # Check for a negative or zero price for the book
        if price == 0
            raise ArgumentError.new("Books are not free, at least not yet!")
        end
        if price < 0
            raise ArgumentError.new("You can't expect me to pay for selling you the book!")
        end
        @price = price
    end
end
