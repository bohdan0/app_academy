require "practice"
describe "monkey patching" do
# my_uniq array test cases
  describe "#my_uniq" do
    subject(:array) {[1,2,2,3,3,4,4,5]}

    it "receives an array and returns an array" do
      expect(array.my_uniq).to be_an(Array)
    end

    it "returns unique array" do
      expect(array.my_uniq).to eq([1,2,3,4,5])
    end
  end

  describe "#two_sum" do
    subject(:array) {[-1, 0, 2, -2, 1]}

    it "receives an array and returns an array" do
      expect(array.two_sum).to be_an(Array)
    end

    it "returns indices of elements that sum upto zero" do
      expect(array.two_sum).to eq([[0,4],[2,3]])
    end
  end

  describe "#my_transpose" do
    subject(:array) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

    it "receives an array and returns an array" do
      expect(array.my_transpose).to be_an(Array)
    end

    it "tranposes square array" do
      expect(array.my_transpose).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ])
    end

    it "tranposes rectangular array" do
      trans_array = [[0, 1, 2],
                     [3, 4, 5] ]
      expect(trans_array.my_transpose).to eq([[0,3],[1,4],[2,5]])
    end

  end

  describe "#stock_picker" do
    subject(:array) {[7,1,3,4,8]}

    it "receives an array and returns an array" do
      expect(array.stock_picker).to be_an(Array)
    end

    it "returns indices of the best pair" do
      expect(array.stock_picker).to eq([1,4])
    end

    it "returns an empty array if there is no best pair" do
      trans_array = [9,8,6,5,4,3]
      expect(trans_array.stock_picker).to eq([])
    end

  end


end
