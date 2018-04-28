# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Blog, type: :model do
  subject { create(:blog) }

  describe '#title' do
    it 'respond_to' do
      expect(subject).to respond_to(:title)
    end

    it 'return as expected' do
      expect(subject.title).to eq('My Blog Title')
    end

    context 'title is nil' do
      let(:blog) { build(:blog, title: nil) }
      it 'is not valid ' do
        expect(blog.valid?).to be_falsey
      end
    end
  end

  describe '#body' do
    it 'respond_to' do
      expect(subject).to respond_to(:body)
    end

    it 'return as expected' do
      expect(subject.body).to eq('My Blog Body')
    end

    context 'body is nil' do
      let(:blog) { build(:blog, body: nil) }
      it 'is not valid ' do
        expect(blog.valid?).to be_falsey
      end
    end
  end
end
