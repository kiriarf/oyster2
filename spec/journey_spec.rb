require 'journey'
require 'oystercard'

describe Journey do

subject(:journey) { described_class.new }
let(:entry_station) { instance_double("Station") }
let(:exit_station) { instance_double("Station") }
let(:oystercard) { instance_double("Oystercard") }


  describe "#initialize" do
    it "with empty entry station" do
      expect(journey.entry_station).to eq nil
    end
    it "with empty exit station" do
      expect(journey.exit_station).to eq nil
    end
  end

  describe "#start" do
    it "stores given station into entry_station" do
      journey.start(entry_station)
      expect(journey.entry_station).to eq entry_station
    end
  end

  describe "#finish" do
    it "stores given station into exit_station" do
      journey.finish(exit_station)
      expect(journey.exit_station).to eq exit_station
    end
  end

  describe "#complete?" do
    it "checks whether journey is complete" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey).to be_complete
    end
  end

  describe "#fare" do
    context 'complete journey' do
      it 'charges minimum fare when journey within one zone' do
        allow(entry_station).to receive(:zone).and_return(2)
        allow(exit_station).to receive(:zone).and_return(2)
        journey.start(entry_station)
        journey.finish(exit_station)
        expect(journey.fare).to eq described_class::FARE
      end
      it 'charges min fare + £1 when journey within 2 zones' do
        allow(entry_station).to receive(:zone).and_return(5)
        allow(exit_station).to receive(:zone).and_return(6)
        journey.start(entry_station)
        journey.finish(exit_station)
        expect(journey.fare).to eq (described_class::FARE + 1)
      end
      it 'charges £6 when journey from z1 to z6' do
        allow(entry_station).to receive(:zone).and_return(1)
        allow(exit_station).to receive(:zone).and_return(6)
        journey.start(entry_station)
        journey.finish(exit_station)
        expect(journey.fare).to eq (described_class::FARE + 5)
      end
    end
    context 'incomplete journey' do
      it 'charges penalty when journey is incomplete' do
        journey.start(entry_station)
        expect(journey.fare).to eq described_class::PENALTY
      end
    end
  end

end