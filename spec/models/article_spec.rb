require 'rails_helper'

RSpec.describe Article, type: :model do
  it "test article object" do
    article = create(:article)
    expect(article.title).to eq('Sample Article')
  end

  describe "#Validations" do
    let(:article) { build(:article) }

    it "test that factory is valid" do
      expect(article).to be_valid
    end

    it "has invalid title" do
      article.title = " "
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it "has invalid content" do
      article.content = " "
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it 'has an invalid slug' do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it 'title should be unique' do
      valid_article = create(:article)
      expect(valid_article).to be_valid

      invalid_article = build(:article, title: "Sample Article")
      expect(invalid_article).not_to be_valid
    end  
  end

  describe '.recent' do
    it 'return articles in the correct order' do
      recent_article = create(:article)
			older_article = create(:article, title: 'Older', created_at: 1.hour.ago)
      expect(described_class.recent).to eq([recent_article, older_article])

      recent_article.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq([older_article, recent_article])
    end
  end
end
