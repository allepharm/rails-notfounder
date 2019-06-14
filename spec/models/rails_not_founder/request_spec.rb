require "rails_helper"

RSpec.describe RailsNotFounder::Request, type: :model do
  describe "database columns" do
    let(:model) { described_class.new }

    it "#headers" do
      expect(model)
        .to have_db_column(:headers)
        .of_type(:jsonb)
        .with_options(null: false)
    end

    it "#method" do
      expect(model)
        .to have_db_column(:method)
        .of_type(:string)
        .with_options(null: false)
    end

    it "#ip" do
      expect(model)
        .to have_db_column(:ip)
        .of_type(:string)
        .with_options(null: false)
    end

    it "#params" do
      expect(model)
        .to have_db_column(:params)
        .of_type(:string)
        .with_options(default: "")
    end

    it "#url" do
      expect(model)
        .to have_db_column(:url)
        .of_type(:string)
        .with_options(null: false)
    end
  end
end
