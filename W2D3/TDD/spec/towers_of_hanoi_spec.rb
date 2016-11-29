require 'towers_of_hanoi'

describe Game do
  subject(:game) { Game.new }

  describe '#initialize' do
    it 'creates three empty towers' do
      expect(game.tower1).to be_empty
      expect(game.tower2).to be_empty
      expect(game.tower3).to be_empty
    end
  end

  describe 'game_process' do
    before(:each) { game.set_up }
    describe '#set_up' do
      it 'checks if first tower is empty' do
        expect(game.tower1).to_not be_empty
      end
    end

    describe '#move' do
      it 'moves top element from one tower to second tower' do
        game.move(1, 3)
        expect(game.tower3).to eq([1])
      end
    end

    describe '#valid_move?' do
      it 'cannot move from empty tower' do
        expect { game.move(3 ,1) }.to raise_error('no valid move')
      end

      it 'cannot move higher value of lower value' do
        game.move(1, 2)
        expect { game.move(1, 2) }.to raise_error('no valid move')
      end
    end

    describe '#won?' do
      it 'checks for game over' do
        game.tower2 = game.tower1
        game.tower1 = []
        expect(game.won?).to be_truthy
      end

      it 'checks for game over' do
        game.move(1, 2)
        expect(game.won?).to be_falsy
      end
    end
  end
end
