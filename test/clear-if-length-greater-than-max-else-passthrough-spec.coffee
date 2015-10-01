ReturnValue = require 'nanocyte-component-return-value'
ClearIfLengthGreaterThanMaxElsePassthrough = require '../src/clear-if-length-greater-than-max-else-passthrough'

describe 'ClearIfLengthGreaterThanMaxElsePassthrough', ->
  beforeEach ->
    @sut = new ClearIfLengthGreaterThanMaxElsePassthrough

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when max is greater than length of message', ->
      it 'should return the message', ->
        envelope =
          message: [1,2]
          config:
            max: 3
        expect(@sut.onEnvelope envelope).to.deep.equal [1,2]

    describe 'when max is less than length of message', ->
      it 'should return an empty message', ->
        envelope =
          message: [1,2]
          config:
            max: 1
        expect(@sut.onEnvelope envelope).to.deep.equal []

    describe 'when message is null', ->
      it 'should return an empty message', ->
        envelope =
          message: null
          config:
            max: 1
        expect(@sut.onEnvelope envelope).to.deep.equal []

    describe 'when message is an int', ->
      it 'should return an empty message', ->
        envelope =
          message: 6
          config:
            max: 1
        expect(@sut.onEnvelope envelope).to.deep.equal []
