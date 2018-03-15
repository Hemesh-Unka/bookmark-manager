require 'link'

describe Link do
  describe '.all' do
    it 'returns all links' do
      links = Link.all
      title_array = links.map(&:title)

      ['Makers Academy', 'Facebook', 'Google'].each do |title|
        expect(title_array).to include(title)
      end
    end
  end

  describe '.create' do
    it 'creates a new link' do
      Link.create(title: 'unit test', url: 'http://www.unit-test.com')
      links = Link.all
      url_array = links.map(&:url)

      expect(url_array).to include('http://www.unit-test.com')
    end

    it 'does not create a new link if the URL is invalid' do
      Link.create(url: 'Not a real url')
      expect(Link.all).not_to include('Not a real url')
    end
  end
end
