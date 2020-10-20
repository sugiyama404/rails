require 'test/unit'
require 'lib/expanded_date'

class Datetest < Test::Unit::TestCase

  def test_tomorrow
    d = Date.parse("2004-02-28")
    assert_equal("2004-02-29", d.tomorrow.to_s)
  end

  def test_yesterday
    d = Date.parse("2004-03-01")
    assert_equal("2004-02-29", d.yesterday.to_s)
  end

  def test_next_week
    d = Date.parse("2004-02-28")
    assert_equal("2004-03-06", d.next_week.to_s)
  end

  def test_prev_week
    d = Date.parse("2004-02-28")
    assert_equal("2004-02-21", d.prev_week.to_s)
  end
      
  def test_next_month
    d = Date.parse("2000-01-01")
    assert_equal("2000-01-01", d.to_s)
    assert_equal("2000-02-01", d.next_month.to_s)
    assert_equal("2000-03-01", d.next_month.next_month.to_s)
  end
  
  def test_prev_month
    d = Date.parse("2000-01-01")
    assert_equal("2000-01-01", d.to_s)
    assert_equal("1999-12-01", d.prev_month.to_s)
    assert_equal("1999-11-01", d.prev_month.prev_month.to_s)
  end
  
  def test_end_of_month
    assert_equal("2000-02-29", Date.parse("2000-02-13").end_of_month.to_s)
    assert_equal("2001-02-28", Date.parse("2001-02-13").end_of_month.to_s)
    assert_equal("2006-09-30", Date.parse("2006-09-01").end_of_month.to_s)    
    assert_equal("2006-09-30", Date.parse("2006-09-30").end_of_month.to_s)    
    assert_equal("2006-10-31", Date.parse("2006-10-01").end_of_month.to_s)    
    assert_equal("2006-10-31", Date.parse("2006-10-31").end_of_month.to_s)    
  end

  def test_beginning_of_month
    assert_equal("2000-02-01", Date.parse("2000-02-13").beginning_of_month.to_s)
    assert_equal("2001-02-01", Date.parse("2001-02-13").beginning_of_month.to_s)
  end
  
  def test_beginning_of_next_month
    assert_equal("2000-01-01", Date.parse("1999-12-13").beginning_of_next_month.to_s)
    assert_equal("2000-02-01", Date.parse("2000-01-13").beginning_of_next_month.to_s)
    assert_equal("2000-03-01", Date.parse("2000-02-13").beginning_of_next_month.to_s)
    assert_equal("2001-03-01", Date.parse("2001-02-13").beginning_of_next_month.to_s)
  end
  
  def test_beginning_of_prev_month
    assert_equal("1999-11-01", Date.parse("1999-12-13").beginning_of_prev_month.to_s)
    assert_equal("1999-12-01", Date.parse("2000-01-13").beginning_of_prev_month.to_s)
    assert_equal("2000-01-01", Date.parse("2000-02-13").beginning_of_prev_month.to_s)
    assert_equal("2001-02-01", Date.parse("2001-03-13").beginning_of_prev_month.to_s)
  end

  def test_end_of_next_month
    assert_equal("2000-01-31", Date.parse("1999-12-13").end_of_next_month.to_s)
    assert_equal("2000-02-29", Date.parse("2000-01-13").end_of_next_month.to_s)
    assert_equal("2000-03-31", Date.parse("2000-02-13").end_of_next_month.to_s)
    assert_equal("2001-03-31", Date.parse("2001-02-13").end_of_next_month.to_s)
  end
  
  def test_end_of_prev_month
    assert_equal("1999-11-30", Date.parse("1999-12-13").end_of_prev_month.to_s)
    assert_equal("1999-12-31", Date.parse("2000-01-13").end_of_prev_month.to_s)
    assert_equal("2000-01-31", Date.parse("2000-02-13").end_of_prev_month.to_s)
    assert_equal("2001-02-28", Date.parse("2001-03-13").end_of_prev_month.to_s)
  end   
    
  def test_long_conversion
    assert_equal(Date.today.end_of_next_month, Date.today.next_month.next_month.end_of_prev_month)
    assert_equal(Date.today.next_month.next_month.next_month.prev_month.prev_month.prev_month, Date.today)
  end
end
