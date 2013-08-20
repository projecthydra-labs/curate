require 'spec_helper'
module Curate
  describe Configuration do
    describe '#default_antivirus_instance' do
      it 'has a default callable' do
        expect(Curate.configuration.default_antivirus_instance.call(__FILE__)).
          to eq(AntiVirusScanner::NO_VIRUS_FOUND_RETURN_VALUE)
      end

      it 'is configurable' do
        previous_av_instance = Curate.configuration.default_antivirus_instance
        Curate.configure do |config|
          config.default_antivirus_instance = lambda {|path|
            '2'
          }
        end

        expect(Curate.configuration.default_antivirus_instance.call(__FILE__)).
          to eq("2")
      end
    end
  end
end
