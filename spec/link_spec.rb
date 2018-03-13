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

  describe '.add' do
    it 'add new link' do
      Link.add('http://www.test.com')
      links = Link.all
      expect(links).to include('http://www.test.com')
    end
  end
end
