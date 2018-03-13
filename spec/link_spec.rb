require 'link'
describe Link do
  describe '.all' do
    it 'returns all links' do
      links = Link.all

      expect(links).to include('http://www.makersacademy.com')
      expect(links).to include('http://www.facebook.com')
      expect(links).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'creates a new link' do
      Link.create(url: 'http://www.unittest.com')

      expect(Link.all).to include('http://www.unittest.com')
    end
  end
end
