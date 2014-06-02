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
  end
end
