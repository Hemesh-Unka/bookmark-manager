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
      Link.create(title: 'Not a real title')
      expect(Link.all).not_to include('Not a real title')
    end
  end

  describe '.delete' do
    it 'deletes a link' do
      Link.create(title: 'Delete unit test', url: 'http://www.deleteunittest.com')
      links = Link.all
      Link.delete(links.map(&:id).last)

      expect(Link.all).not_to include('Delete unit test')
    end
  end
end
