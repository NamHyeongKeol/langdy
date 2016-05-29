module AdminHelper
  class String
    def remove!(start_index, end_index)
      (end_index - start_index + 1).times{ self.slice! start_index }
      self
    end 

    def choping(number) #integer
      i = 0
      while i < number do
        self.chop!
      end
    end
  end
end
