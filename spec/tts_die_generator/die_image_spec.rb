# frozen_string_literal: true

RSpec.describe TtsDieGenerator::DieImage do
  describe "create" do
    it "creates appropriate die" do
      die = TtsDieGenerator::DieImage.create(%w[1 3 4 5])

      expect(die).to be_a TtsDieGenerator::FourSided
      expect(die.sides).to eq(%w[1 3 4 5])
    end

    it "raises error when sides do not match die size" do
      expect { TtsDieGenerator::DieImage.create(%w[1 2 3]) }.to raise_error(InvalidDie)
    end
  end
end
