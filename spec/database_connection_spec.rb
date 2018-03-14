require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'takes one argument' do
      expect(DatabaseConnection).to respond_to(:setup).with(1).argument
    end

    it 'sets up a connection to a data base through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end

    it 'checks if a connection is persistant' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(DatabaseConnection.connection).to eq(connection)
    end
  end

  describe '.query' do
    it 'takes one argument' do
      expect(DatabaseConnection).to respond_to(:query).with(1).argument
    end

    it 'takes a SQL string as a parameter and executes the query' do
      connection = DatabaseConnection.setup('bookmark_manager_test')
      expect(connection).to receive(:exec).with('SELECT * FROM links')
      expect(DatabaseConnection.query('SELECT * FROM links'))
    end
  end
end
