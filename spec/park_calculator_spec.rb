require_relative '../app/park_calculator'

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

    it "costs 25$ for 1 day and 1 minute" do
      park_calculator = ParkCalculator.new short_term, 24*60 + 1
      expect(park_calculator.estimated_cost).to eq 25
    end

    it "costs 48$ for 1 day, 12 hours and 1 minute" do
      park_calculator = ParkCalculator.new short_term, 24*60 + 12*60 + 1
      expect(park_calculator.estimated_cost).to eq 48
    end

    it "costs 108$ for 4 days and 6 hours" do
      park_calculator = ParkCalculator.new short_term, 4*24*60 + 6*60
      expect(park_calculator.estimated_cost).to eq 96 + 12
    end

    it "costs 109$ for 4 days, 6 hours and 1 minute" do
      park_calculator = ParkCalculator.new short_term, 4*24*60 + 6*60 + 1
      expect(park_calculator.estimated_cost).to eq 96 + 12 + 1
    end
  end

  context "Parking in the Economy Parking Lot" do
    let(:economy) { Parkings.economy }

    it "costs 0$ for 0 minutes" do
      park_calculator = ParkCalculator.new economy, 0
      expect(park_calculator.estimated_cost).to eq 0
    end

    it "costs 2$ for 1 minute" do
      park_calculator = ParkCalculator.new economy, 1
      expect(park_calculator.estimated_cost).to eq 2
    end

    it "costs 2$ for 1 hour" do
      park_calculator = ParkCalculator.new economy, 60
      expect(park_calculator.estimated_cost).to eq 2
    end

    it "costs 4$ for 1 hour and 1 minute" do
      park_calculator = ParkCalculator.new economy, 60 + 1
      expect(park_calculator.estimated_cost).to eq 4
    end

    it "costs 8$ for 4 hours" do
      park_calculator = ParkCalculator.new economy, 4*60
      expect(park_calculator.estimated_cost).to eq 8
    end

    it "costs 9$ for 4 hours and 1 minute" do
      park_calculator = ParkCalculator.new economy, 4*60 + 1
      expect(park_calculator.estimated_cost).to eq 9
    end

    it "costs 9$ for 1 day" do
      park_calculator = ParkCalculator.new economy, 24*60
      expect(park_calculator.estimated_cost).to eq 9
    end

    it "costs 11$ for 1 day and 1 minute" do
      park_calculator = ParkCalculator.new economy, 24*60 + 1
      expect(park_calculator.estimated_cost).to eq 11
    end

    it "costs 53$ for 5 days and 4 hours" do
      park_calculator = ParkCalculator.new economy, 5*24*60 + 4*60
      expect(park_calculator.estimated_cost).to eq 53
    end

    it "costs 54$ for 5 days 4 hours and 1 minute" do
      park_calculator = ParkCalculator.new economy, 5*24*60 + 4*60 + 1
      expect(park_calculator.estimated_cost).to eq 54
    end

    it "costs 54$ for 6 days" do
      park_calculator = ParkCalculator.new economy, 6*24*60
      expect(park_calculator.estimated_cost).to eq 54
    end

    it "costs 54$ for 6 days and 1 minute" do
      park_calculator = ParkCalculator.new economy, 6*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 54
    end

    it "costs 54$ for 1 week" do
      park_calculator = ParkCalculator.new economy, 7*24*60
      expect(park_calculator.estimated_cost).to eq 54
    end

    it "costs 56$ for 1 week and 1 minute" do
      park_calculator = ParkCalculator.new economy, 7*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 56
    end

    it "costs 108$ for 1 week 6 days and 1 minute" do
      park_calculator = ParkCalculator.new economy, 7*24*60 + 6*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 108
    end

    it "costs 216$ for 3 weeks 6 days and 1 minute" do
      park_calculator = ParkCalculator.new economy, 3*7*24*60 + 6*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 216
    end
  end

  context "Parking in the Long-Term Garage Parking Lot" do
    let(:long_term_garage) { Parkings.long_term_garage }

    it "costs 0$ for 0 minutes" do
      park_calculator = ParkCalculator.new long_term_garage, 0
      expect(park_calculator.estimated_cost).to eq 0
    end

    it "costs 2$ for 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 1
      expect(park_calculator.estimated_cost).to eq 2
    end

    it "costs 2$ for 1 hour" do
      park_calculator = ParkCalculator.new long_term_garage, 60
      expect(park_calculator.estimated_cost).to eq 2
    end

    it "costs 4$ for 1 hour and 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 60 + 1
      expect(park_calculator.estimated_cost).to eq 4
    end

    it "costs 12$ for 6 hours" do
      park_calculator = ParkCalculator.new long_term_garage, 6*60
      expect(park_calculator.estimated_cost).to eq 12
    end

    it "costs 12$ for 6 hours and 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 6*60 + 1
      expect(park_calculator.estimated_cost).to eq 12
    end

    it "costs 12$ for 1 day" do
      park_calculator = ParkCalculator.new long_term_garage, 24*60
      expect(park_calculator.estimated_cost).to eq 12
    end

    it "costs 14$ for 1 day and 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 24*60 + 1
      expect(park_calculator.estimated_cost).to eq 14
    end

    it "costs 72$ for 6 days" do
      park_calculator = ParkCalculator.new long_term_garage, 6*24*60
      expect(park_calculator.estimated_cost).to eq 12*6
    end

    it "costs 72$ for 6 days and 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 6*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 72
    end

    it "costs 72$ for 1 week" do
      park_calculator = ParkCalculator.new long_term_garage, 7*24*60
      expect(park_calculator.estimated_cost).to eq 72
    end

    it "costs 74$ for 1 week 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 7*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 74
    end

    it "costs 288$ for 3 weeks 6 days 1 minute" do
      park_calculator = ParkCalculator.new long_term_garage, 3*7*24*60 + 6*24*60 + 1
      expect(park_calculator.estimated_cost).to eq 3*72 + 6*12
    end
  end
end
