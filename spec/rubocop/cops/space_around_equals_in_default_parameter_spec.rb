# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    describe SpaceAroundEqualsInParameterDefault do
      let(:space) { SpaceAroundEqualsInParameterDefault.new }

      it 'registers an offence for default value assignment without space' do
        inspect_source(space, 'file.rb', ['def f(x, y=0, z=1)', 'end'])
        expect(space.offences.map(&:message)).to eq(
          ['Surrounding space missing in default value assignment.'] * 2)
      end

      it 'accepts default value assignment with space' do
        inspect_source(space, 'file.rb', ['def f(x, y = 0, z = 1)', 'end'])
        expect(space.offences.map(&:message)).to be_empty
      end
    end
  end
end
