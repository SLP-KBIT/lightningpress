Time::DATE_FORMATS.merge!(
  default: lambda { |t| t.strftime("%Y.%m.%d(#{%w(日 月 火 水 木 金 土)[t.wday]}) %H:%M:%S") }
)
