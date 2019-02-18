require "rails_helper"

RSpec.describe Author, :type => :model do
 
  it 'requires a first name' do
    author = Fabricate.build(:author, first_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:first_name].any?).to be_truthy
  end

  it 'requires a last name' do
    author = Fabricate.build(:author, last_name: nil)
    expect(author).not_to be_valid
    expect(author.errors[:last_name].any?).to be_truthy
  end

  describe '#full_name' do
    context 'with middle name present' do
      it 'returns the first name, middle initial, and last_name of the author' do
        author = Fabricate.build(:author, first_name: 'John', middle_name: 'Joe', last_name: 'Doe')
        expect(author.full_name).to eq('John J Doe')
      end
    end

    context 'with no middle name present' do
      it 'returns the authors first name and last name' do
        author = Fabricate.build(:author, first_name: 'John', middle_name: '', last_name: 'Doe')
        expect(author.full_name).to eq('John Doe')
      end
    end

    describe '#email' do
      context 'presence' do
        it 'when blank value' do
          author = Fabricate.build(:author, email: '')
          expect(author).to be_invalid
        end
      end
    end
    
    describe 'is requires an @ symbol follow by a . and two at least characters' do
      it 'with no @ symbol' do
        author = Fabricate.build(:author, email: 'testingexample.com')
        expect(author).to be_invalid
      end
      it 'with no . follow by two characters' do
        author = Fabricate.build(:author, email: 'testingexampleco')
        expect(author).to be_invalid
      end
      it 'with an @ symbol and a . with followed by at least 2 characters' do
        author = Fabricate.build(:author, email: 'testing@example.co')
        expect(author).to be_valid
      end
    end
  end
end