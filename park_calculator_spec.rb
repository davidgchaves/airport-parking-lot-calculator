require_relative 'park_calculator'
require_relative 'parkings'

describe ParkCalculator do
  context "Parking in the Valet Parking Lot" do
    let(:valet) { Parkings.valet }

    it "costs 0$ for 0 minutes" do
      park_calculator = ParkCalculator.new valet, 0
      expect(park_calculator.estimated_cost).to eq 0
    end

    it "costs 12$ for 1 minutes" do
      park_calculator = ParkCalculator.new valet, 1
      expect(park_calculator.estimated_cost).to eq 12
    end

    it "costs 12$ for 5 hours" do
      park_calculator = ParkCalculator.new valet, 5*60
      expect(park_calculator.estimated_cost).to eq 12
    end

    it "costs 18$ for 5 hours and 1 minute" do
      park_calculator = ParkCalculator.new valet, 5*60 + 1
      expect(park_calculator.estimated_cost).to eq 18
    end

    it "costs 18$ for 1 day" do
      park_calculator = ParkCalculator.new valet, 24*60
      expect(park_calculator.estimated_cost).to eq 18
    end

    it "costs 36$ for 1 day and 1 minute" do
      park_calculator = ParkCalculator.new valet, 24*60 + 1
      expect(park_calculator.estimated_cost).to eq 36
    end

    it "costs 54$ for 3 days" do
      park_calculator = ParkCalculator.new valet, 3 * 24*60
      expect(park_calculator.estimated_cost).to eq 54
    end

    it "costs 126$ for 1 week" do
      park_calculator = ParkCalculator.new valet, 7 * 24*60
      expect(park_calculator.estimated_cost).to eq 126
    end
  end
end
