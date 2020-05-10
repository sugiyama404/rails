#=Expanded date
#Jon Egil Strand
#
#Adds extra functionality to the regular Date class. Methods such as tomorrow, 
#yesterday, next_week, prev_week are syntactic sugar for date +/- 1 (or 7). 
#Their main use is for readability of code if one so wishes.
#
#The month functions are really handy when working with specific periods. In my
#experience these are quite often tied to beginning- and end of months rather than
#specific dates. I.e. "end of March, end of April, ... " instead of "31st March, 
#30th April, ..." in a lot of cases.
#

require 'date'

class Date
  def tomorrow
    self + 1
  end

  def yesterday
    self - 1
  end

  def next_week
    self + 7
  end

  def prev_week
    self - 7
  end

  #This date in previous month
  def prev_month
    m = month - 1
    y = year
    if m == 0
      m = 12
      y = y - 1
    end
    d = day
    self::class.civil(y,m,d)
  end 

  #This date in next month. Raises ArgumentError: invalid date if the date does not exist.
  def next_month
    m = month + 1
    y = year
    if m == 13
      m = 1
      y = y + 1
    end
    d = day
    self::class.civil(y,m,d)
  end
  
  def end_of_month  
    self.beginning_of_next_month-1    
  end
  
  def beginning_of_month
    self::class.civil(self.year, self.month, 1)
  end

  def end_of_next_month
    self.beginning_of_month.next_month.end_of_month
  end

  def end_of_prev_month
    self.beginning_of_month-1
  end
  
  def beginning_of_next_month
    self.beginning_of_month.next_month
  end

  def beginning_of_prev_month
    self.beginning_of_month.prev_month
  end  
end
