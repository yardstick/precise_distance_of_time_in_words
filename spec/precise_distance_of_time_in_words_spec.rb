require 'spec_helper'

describe PreciseDistanceOfTimeInWords do
  context 'Distance of Time in Hours and Minutes' do
    before do
      @time1 = Time.utc(2013,10,10,10,0,0)
      @time2 = @time1 + 1.second
      @time3 = @time1 + 1.minute
      @time4 = @time1 + 1.hour
      @time5 = @time1 + 1.hours + 5.minutes
      @time6 = @time1 + 1.hours + 5.minutes + 3.seconds
    end

    it 'calculates time differences properly' do
      expect(precise_distance_of_time_in_words(1.second)).to eq('1 second')
      expect(precise_distance_of_time_in_words(@time1, @time1)).to eq('')
      expect(precise_distance_of_time_in_words(@time1, @time2)).to eq('1 second')
      expect(precise_distance_of_time_in_words(@time1, @time3)).to eq('1 minute')
      expect(precise_distance_of_time_in_words(@time1, @time4)).to eq('1 hour')
      expect(precise_distance_of_time_in_words(@time1, @time5)).to eq('1 hour and 5 minutes')
      expect(precise_distance_of_time_in_words(@time1, @time6)).to eq('1 hour and 5 minutes')
    end

    it 'should support German' do
      expect(precise_distance_of_time_in_words(2.second, 0, :locale => :de)).to eq('2 Sekunden')
    end

    it 'should support French' do
      expect(precise_distance_of_time_in_words(@time1, @time6, :locale => :fr)).to eq('1 heure et 5 minutes')
    end
  end
end
