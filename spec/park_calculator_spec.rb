require_relative '../app/park_calculator'
require_relative '../app/parkings'

describe ParkCalculator do
  context "Parking in the Valet Parking Lot" do
    let(:valet) { Parkings.valet }

    it "costs 0$ for 0 minutes" do
      park_calculator = ParkCalculator.new valet, 0
      expect(park_calculator.estimated_cost).to eq 0
    end

    it "costs 12$ for 1 minute" do
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

  context "Parking in the Short-Term Parking Lot" do
    let(:short_term) { Parkings.short_term }

    it "costs 0$ for 0 minutes" do
      park_calculator = ParkCalculator.new short_term, 0
      expect(park_calculator.estimated_cost).to eq 0
    end

    it "costs 2$ for 1 minute" do
      park_calculator = ParkCalculator.new short_term, 1
      expect(park_calculator.estimated_cost).to eq 2
    end

    it "costs 2$ for 1 hour" do
      park_calculator = ParkCalculator.new short_term, 60
      expect(park_calculator.estimated_cost).to eq 2
    end

    it "costs 3$ for 1 hour and 1 minute" do
      park_calculator = ParkCalculator.new short_term, 60 + 1
      expect(park_calculator.estimated_cost).to eq 3
    end

    it "costs 3$ for 1 hour and 30 minutes" do
      park_calculator = ParkCalculator.new short_term, 60 + 30
      expect(park_calculator.estimated_cost).to eq 3
    end

    it "costs 4$ for 1 hour and 31 minutes" do
      park_calculator = ParkCalculator.new short_term, 60 + 31
      expect(park_calculator.estimated_cost).to eq 4
    end

    it "costs 24$ for 12 hours" do
      park_calculator = ParkCalculator.new short_term, 12*60
      expect(park_calculator.estimated_cost).to eq 24
    end

    it "costs 24$ for 12 hours and 1 minute" do
      park_calculator = ParkCalculator.new short_term, 12*60 + 1
      expect(park_calculator.estimated_cost).to eq 24
    end

    it "costs 24$ for 1 day" do
      park_calculator = ParkCalculator.new short_term, 24*60
      expect(park_calculator.estimated_cost).to eq 24
    end
  end
end
