class Image 
  def initialize(image)
    @image = image
  end

  def output_image
   @image.each do |row|
     puts row.join('')
   end
  end

 def blur_image
  one_coordinates = Array.new

  @image.each_with_index do |row, column_index|
    row.each_with_index do |pixel, row_index|
      if pixel == 1
        one_coordinates.push [column_index, row_index]        
      end
    end
  end

  one_coordinates.each do |index_tuple|
    column_index, row_index = index_tuple


    @image[column_index][row_index+1] = 1 if @image[column_index][row_index+1] != nil
    @image[column_index][row_index-1] = 1 if @image[column_index][row_index-1] != nil

    # @image[-1] == nil # True!
    # nil[row_index] # This is what's giving the error (I think)
    @image[column_index-1][row_index] = 1 if @image[column_index-1][row_index] != nil
    @image[column_index+1][row_index] = 1 if @image[column_index + 1] != nil && @image[column_index+1][row_index] != nil
            
    end
  end  

  def manhattan_distance(distance)
    distance.times do 
      blur_image
    end

  end

end
image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0], # @image[2] => [0,0,0,1]
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0]  # @image[3] => [1,0,0,0]
                # @image[4] => nil
              ])

image.manhattan_distance(2)
image.output_image

