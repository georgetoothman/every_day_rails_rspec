require 'spec_helper'

describe Contact do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "is invalid without a firstname" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(cotact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "returns a contact;s full name as a string" do
    contact = build(:contact,
      firstname: "Jane",
      lastname: "Smith"
    )
    expect(contact.name).to eq 'Jane Smith'
  end

  it "is invalid with a duplicate email address" do
    create(:contact, email: 'aaron@example.com')
    contact.valid?
    expect(contact.errors[:email]).to include('has already been taken')
  end

  it "has three phone numbers" do
    expect(create(:contact).phones.count).to eq 3
  end

  # it "has a valid factory" do
  #   expect(build(:contact)).to be_valid
  # end

  # it { should validate_presence_of :firstname }
  # it { should validate_presence_of :lastname }
  # it { should validate_presence_of :email }
  # it { should validate_uniqueness_of(:email) }

  # it "has three phone numbers" do
  #   expect(create(:contact).phones.count).to eq 3
  # end

  # it "returns a contact's full name as a string" do
  #   contact = build_stubbed(:contact,
  #     firstname: "Jane", lastname: "Doe")
  #   expect(contact.name).to eq "Jane Doe"
  # end

  # describe "filter last name by letter" do
  #   let(:smith) { create(:contact,
  #     lastname: 'Smith', email: 'jsmith@example.com') }
  #   let(:jones) { create(:contact,
  #     lastname: 'Jones', email: 'tjones@example.com') }
  #   let(:johnson) { create(:contact,
  #     lastname: 'Johnson', email: 'jjohnson@example.com') }

  #   context "matching letters" do
  #     it "returns a sorted array of results that match" do
  #       expect(Contact.by_letter("J")).to eq [johnson, jones]
  #     end
  #   end

  #   context "non-matching letters" do
  #     it "returns a sorted array of results that match" do
  #       expect(Contact.by_letter("J")).to_not include smith
  #     end
  #   end
  # end
end