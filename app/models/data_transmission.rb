class DataTransmission < DatawingsRecord
  belongs_to :firefly
  validates_presence_of :firefly_id

  scope :desc, order('data_transmissions.sent_at DESC')
  scope :from_week, ->(time) { where("sent_at < ?", time) }

  def self.by_week(firefly_ids)

    in_firefly_ids = firefly_ids.to_s.sub('[', '(').sub(']', ')')
    raw = DataTransmission.connection.select_all("SELECT firefly_id, extract(week from sent_at) as week, extract(year from sent_at) as year, sum(hour_meter) hour_meter FROM data_transmissions where firefly_id IN #{in_firefly_ids} group by firefly_id, week, year order by year, week")
    weekly = raw.map { |row| DataTransmission.new(firefly_id: row['firefly_id'], hour_meter: row['hour_meter'], sent_at: Date.strptime(row['year']+row['week'],'%Y%W'))}

    #fill out empty weeks or find a better way to do this
    # all_dt = Firefly.find(firefly_ids).map(&:data_transmissions).flatten
    # max_sent_at = all_dt.last.sent_at
    # min_sent_at = all_dt.first.sent_at
  end

  def total_hours
    hour_meter.nil? ? 0 : hour_meter
  end

  def self.sample_data(firefly=nil, sent_at=DateTime.now) #generate a valid sample
    #TODO Faker (random data on a bell curve?)
    #firefly Sent_at Hour meter  High temp Low temp  Min voltage Max voltage Error code
    standard_temp = 30
    standard_voltage = 220
    #standard_hours = 24
    firefly = Firefly.all.sample if firefly.nil?

    last_sent = firefly.data_transmissions.last.try :sent_at
    max_hours = last_sent.nil? || last_sent > sent_at ? 24 : (sent_at.to_i - last_sent.to_i)/(60*60)

    max_temp = standard_temp + (0..20).to_a.sample
    min_temp = standard_temp - (0..7).to_a.sample
    max_voltage = standard_voltage + ((Random.rand * 100 < 15) ? (0..200).to_a.sample : 0)
    min_voltage = standard_voltage - ((Random.rand * 100 < 20) ? (0..standard_voltage).to_a.sample : 0)
    error_code = ['E01','E02', 'E03', 'E04', 'E99'].sample if (Random.rand * 100 < 5) # 5% of the time
    #byebug
    hours = max_hours - (0 .. max_hours/2).to_a.sample
    DataTransmission.create({firefly_id:firefly.id, sent_at: sent_at, hour_meter:hours, high_temp:max_temp, low_temp:min_temp, min_voltage:min_voltage, max_voltage:max_voltage, error_code:error_code})
  end

  def self.lotsa_data
    end_at = DateTime.now.beginning_of_day
    start_at = end_at - 30.days
    # default interval for this time range is 1.day
    Firefly.all.each do |ff|
      start_at = end_at - (15..60).to_a.sample.days
      (start_at .. end_at).to_a.each do |date_time|
        DataTransmission.sample_data(ff, date_time)
      end
    end
  end

end
