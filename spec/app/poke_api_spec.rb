require 'rails_helper'

RSpec.describe "PokeApi" do
    subject do
        PokeApi
    end
    context "download data from API" do
        it "can download Pokemon data" do
            expect(subject.downloadPokemonData(1)).to_not be_nil
        end
        it "can download Item data" do
            expect(subject.downloadMoveData(1)).to_not be_nil
        end
    end
    context "save data from API to DB" do
        it "can save Pokemon data" do
            expect(subject.saveJSONPokemonDataToDB(subject.downloadPokemonData(1))).to_not be_nil
        end
        it "can save Move data" do
            expect(subject.saveJSONMoveDataToDB(subject.downloadMoveData(1))).to_not be_nil
        end
    end
    context "generate random data from API and cache on DB" do
        it "can generate Pokemon data" do
            expect(subject.getRandomPokemon).to_not be_nil
        end
        it "can generate Move data" do
            expect(subject.getRandomMove).to_not be_nil
        end
    end
    context "load seed data from API" do
        it "can load data" do
            expect(subject.seedData).to be_truthy
        end
    end
end
  