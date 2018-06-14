require "rails_helper"

RSpec.describe User, type: :model do

  context "validations" do
    let(:user) {FactoryGirl.build :user}
    subject{user}

    it "has message blank when name is blank" do
      is_expected.to validate_presence_of(:name)
        .with_message(I18n.t("activerecord.errors.models.user.attributes.name.blank"))
    end

    it "check the length of name" do
      is_expected.to validate_length_of(:name)
        .with_message(
          I18n.t("activerecord.errors.models.user.attributes.name.too_long", count: Settings.name.length))
    end

    it "has message invalid when email is blank" do
      is_expected.to validate_presence_of(:email)
        .with_message(I18n.t("activerecord.errors.models.user.attributes.email.blank"))
    end

    it "check the length of email" do
      is_expected.to validate_length_of(:email)
        .with_message(
          I18n.t("activerecord.errors.models.user.attributes.email.too_long", count: Settings.email.length))
    end

    it "check email is unique" do
      is_expected.to validate_uniqueness_of(:email).case_insensitive
        .with_message(I18n.t("activerecord.errors.models.user.attributes.email.taken"))
    end

    it "check the length of password" do
      is_expected.to validate_length_of(:password)
        .with_message(
          I18n.t("activerecord.errors.models.user.attributes.password.too_short", count: Settings.password.length))
    end

    it "has message invalid when phone is blank" do
      is_expected.to validate_presence_of(:phone)
        .with_message(I18n.t("activerecord.errors.models.user.attributes.phone.blank"))
    end

    it "has message invalid when city is blank" do
      is_expected.to validate_presence_of(:city)
        .with_message(I18n.t("activerecord.errors.models.user.attributes.city.blank"))
    end

    it "has message invalid when country is blank" do
      is_expected.to validate_presence_of(:country)
        .with_message(I18n.t("activerecord.errors.models.user.attributes.country.blank"))
    end
  end

  context "type of columns" do
    it {is_expected.to have_db_column(:name).of_type(:string)}
    it {is_expected.to have_db_column(:email).of_type(:string)}
    it {is_expected.to have_db_column(:password_digest).of_type(:string)}
    it {is_expected.to have_db_column(:phone).of_type(:string)}
    it {is_expected.to have_db_column(:address).of_type(:string)}
    it {is_expected.to have_db_column(:city).of_type(:string)}
    it {is_expected.to have_db_column(:country).of_type(:string)}
    it {is_expected.to have_db_column(:role).of_type(:integer)}
  end

  context "associations" do
    it "should correctly identify the has_many orders" do
      should have_many(:orders)
    end

    it "should correctly identify the has_many orders through for order_items" do
      should have_many(:order_items).through(:orders)
    end
  end
end
