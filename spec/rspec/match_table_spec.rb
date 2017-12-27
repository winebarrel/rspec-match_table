RSpec.describe 'match_table' do
  describe '#match_table' do
    context 'when match' do
      specify do
        expect(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => :baz,  '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 300},
          ]
        ).to match_table(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => :baz,  '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 300},
          ]
        )
      end
    end

    context 'when not match' do
      specify do
        expect(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => :baz,  '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 300},
          ]
        ).to_not match_table(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => 'baz', '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 301},
          ]
        )
      end
    end

    context 'when not ematch (different order)' do
      specify do
        expect(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100}, # 1
            {bar: 'foo', 200 => :baz,  '200' => 200}, # 2
            {baz: 'bar', 300 => 'foo', '300' => 300}, # 3
          ]
        ).to_not match_table(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100}, # 1
            {baz: 'bar', 300 => 'foo', '300' => 300}, # 3
            {bar: 'foo', 200 => :baz,  '200' => 200}, # 2
          ]
        )
      end
    end
  end

  describe '#match_table_without_order' do
    context 'when match' do
      specify do
        expect(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => :baz,  '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 300},
          ]
        ).to match_table_without_order(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => :baz,  '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 300},
          ]
        )
      end
    end

    context 'when not match' do
      specify do
        expect(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => :baz,  '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 300},
          ]
        ).to_not match_table_without_order(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100},
            {bar: 'foo', 200 => 'baz', '200' => 200},
            {baz: 'bar', 300 => 'foo', '300' => 301},
          ]
        )
      end
    end

    context 'when not ematch (different order)' do
      specify do
        expect(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100}, # 1
            {bar: 'foo', 200 => :baz,  '200' => 200}, # 2
            {baz: 'bar', 300 => 'foo', '300' => 300}, # 3
          ]
        ).to_not match_table(
          [
            {foo: 'bar', 100 => :zoo,  '100' => 100}, # 1
            {baz: 'bar', 300 => 'foo', '300' => 300}, # 3
            {bar: 'foo', 200 => :baz,  '200' => 200}, # 2
          ]
        )
      end
    end
  end
end
