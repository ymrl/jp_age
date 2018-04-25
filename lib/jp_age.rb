require 'time'
require 'jp_age/version'

# Calculate Age based on Japanese law
class JpAge
  def initialize(birth_date)
    raise ArgumentError, 'Not date' unless birth_date.is_a?(Date)
    @birth_date = birth_date
  end

  def age_as_of(moment)
    date = case moment
           when DateTime, Time
             m = (moment.is_a?(Time) ? moment : moment.to_time)
             m.localtime('+09:00').to_date - 1
           when Date
             moment
           else
             raise ArgumentError 'Not Date, Time, or DateTime'
           end
    (date_num(date + 1) - date_num(@birth_date)) / 10_000
  end

  private

  def date_num(date)
    date.strftime('%Y%m%d').to_i
  end
end
