ReturnValue = require 'nanocyte-component-return-value'
ClearIfLengthGreaterThanMinElsePassthrough = require '../src/clear-if-length-greater-than-min-else-passthrough'

describe 'ClearIfLengthGreaterThanMinElsePassthrough', ->
  beforeEach ->
    @sut = new ClearIfLengthGreaterThanMinElsePassthrough

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'
