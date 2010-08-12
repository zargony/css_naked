require 'helper'

class CssNakedTest < ActiveSupport::TestCase

  def setup
    @view = ActionView::Base.new
  end

  def test_css_naked_inclusion
    assert @view.respond_to?(:css_naked?)
  end

  def local_beginning_of_naked_day
    Time.zone.local(Date.today.year + 2, 4, 9)
  end

  def test_naked_day_detection_early
    Time.use_zone('Pacific/Fiji') do                # Earliest timezone: Fiji with GMT+12
      assert_equal 12.hours, Time.zone.utc_offset
      Time.stubs(:current).returns(local_beginning_of_naked_day - 1.second)
      assert !@view.css_naked?
      Time.stubs(:current).returns(local_beginning_of_naked_day)
      assert @view.css_naked?
      Time.stubs(:current).returns(local_beginning_of_naked_day + 24.hours)
      assert @view.css_naked?
    end
  end

  def test_naked_day_detection_europe
    Time.use_zone('Europe/London') do               # Central Europe timezone: London with GMT
      assert_equal 0, Time.zone.utc_offset
      Time.stubs(:current).returns(local_beginning_of_naked_day)
      assert @view.css_naked?
      Time.stubs(:current).returns(local_beginning_of_naked_day + 24.hours)
      assert @view.css_naked?
    end
  end

  def test_naked_day_detection_late
    Time.use_zone('Pacific/Pago_Pago') do           # Latest timezone: Pago Pago with GMT-11
      assert_equal -11.hours, Time.zone.utc_offset
      Time.stubs(:current).returns(local_beginning_of_naked_day)
      assert @view.css_naked?
      Time.stubs(:current).returns(local_beginning_of_naked_day + 24.hours)
      assert @view.css_naked?
      Time.stubs(:current).returns(local_beginning_of_naked_day + 24.hours + 1.second)
      assert !@view.css_naked?
    end
  end
end
